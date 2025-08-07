#!/bin/bash
echo "Criar usuario ludgero e diretorio home"
useradd -d /home/ludgero ludgero
echo "Incluir ludgero no grupo sudo"
usermod -aG wheel ludgero
echo "Criar pasta .ssh no /home/ludgero"
mkdir /home/ludgero/.ssh
echo "Criar arquivo de autorizacao de acesso no /home/ludgero/.ssh"
touch /home/ludgero/.ssh/authorized_keys
echo "Mudar proprietario do /home/ludgero"
chown -R ludgero:ludgero /home/ludgero/.ssh
echo "Mudar permissoes do diretorio e arquivo criado dentro do /home/ludgero"
chmod 700 /home/ludgero/.ssh
chmod 600 /home/ludgero/.ssh/authorized_keys
echo "Criar senha padrao para ludgero"
passwd ludgero
echo "Criar a chave de acesso de ludgero"
ssh-keygen -b 2048 -C "ludgero@dti"
echo "Concatenar a chave publica de ludgero ao arquivo de autorizacao"
cat ludgero@*.pub >> /home/ludgero/.ssh/authorized_keys
echo "Remover a chave publica de ludgero"
rm -rf ludgero@*.pub
