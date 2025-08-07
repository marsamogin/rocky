#!/bin/bash
echo "Obtem o nome do host"
hostname = `hostname`
echo "Desativar o Selinux e o Firewall:"
sudo sed -i 's/enforcing/disabled/g' /etc/selinux/config && systemctl disable firewalld
echo "Instalar o repositório REMI:"
sudo dnf -y install https://rpms.remirepo.net/enterprise/remi-release-9.rpm
echo "Habilitar o repositório REMI:"
sudo vi /etc/yum.repos.d/remi.repo
echo "Instalar o repositório EPEL:"
sudo dnf -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm
echo "Atualizar os repositórios e pacotes:"
sudo yum update -y
echo "Instalar os pacotes que mais usamos:"
sudo yum install rsync bind-utils mlocate wget openldap-clients make cmake automake man net-tools ntsysv nfs-utils bacula-client yum-utils postfix s-nail zip unzip telnet chrony git lynx lsof curl -y
echo "Ir até a pasta "/tmp" e baixar os scripts usados por nos do Github:"
sudo cd /tmp
sudo git clone https://github.com/marsamogin/linux
echo "Criar pasta padrao /root/shell"
sudo mkdir /root/shell
echo "Copiar arquivos prontos de config. para destino"
sudo mv -y chrony.conf /etc
sudo mv -y bacula-fd.conf /etc/bacula
sudo mv -y main.cf /etc/postfix
sudo mv -y monitor-disco.sh /root/shell
echo "Definir nome do host no arquivo do Bacula"
sudo sed -i 's/trocar-fd/$hostname-fd/g' /etc/bacula/bacula-fd.conf
echo "Iniciar e ativar os servicos postfix e bacula da maquina
sudo systemctl start postfix && sudo systemctl start bacula-fd
echo "Ajustar a configuracao do sshd_config"
sudo sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/g' /etc/ssh/sshd_config
sudo sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/g' /etc/ssh/sshd_config
echo "Trocar a senha de root"
passwd
echo "Ultima coisa: lembrar de editar a crontab"
