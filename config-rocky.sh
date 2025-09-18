#!/bin/bash
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
cd /tmp
git clone https://github.com/marsamogin/linux
echo "Copiar arquivos prontos de config. para destino"
mv -f /tmp/linux/chrony.conf /etc
mv -f /tmp/linux/bacula-fd.conf /etc/bacula
mv -f /tmp/linux/main.cf /etc/postfix
mv -f /tmp/linux/*.sh /root/shell
chmod +x /root/shell/*.sh
echo "Definir nome do host no arquivo do Bacula"
sed -i "s/trocar/$(hostname)/g" /etc/bacula/bacula-fd.conf
echo "Habilitar os servicos postfix e bacula da maquina"
systemctl enable postfix && systemctl enable bacula-fd
echo "Ajustar a configuracao do sshd_config"
sed -i "s/#PubkeyAuthentication yes/PubkeyAuthentication yes/g" /etc/ssh/sshd_config
sed -i "s/#PasswordAuthentication yes/PasswordAuthentication no/g" /etc/ssh/sshd_config
echo "Trocar a senha de root"
passwd
echo "Ultima coisa: lembrar de copiar o conteudo do arq. crontab no /tmp"
