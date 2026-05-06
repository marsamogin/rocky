#!/bin/bash
echo "Criar usuario dti e diretorio home"
useradd -d /home/dti dti
echo "Incluir dti no grupo sudo"
usermod -aG wheel dti
echo "Criar pasta .ssh no /home/dti"
mkdir /home/dti/.ssh
echo "Criar arquivo de autorizacao de acesso no /home/dti/.ssh"
touch /home/dti/.ssh/authorized_keys
echo "Mudar proprietario do /home/dti"
chown -R dti:dti /home/dti/.ssh
echo "Mudar permissoes do diretorio e arquivo criado dentro do /home/dti"
chmod 700 /home/dti/.ssh
chmod 600 /home/dti/.ssh/authorized_keys
echo "Criar senha padrao para dti"
passwd dti
