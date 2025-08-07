#!/bin/bash
echo "Criar usuario keite e diretorio home"
useradd -d /home/keite keite
echo "Incluir keite no grupo sudo"
usermod -aG wheel keite
echo "Criar pasta .ssh no /home/keite"
mkdir /home/keite/.ssh
echo "Criar arquivo de autorizacao de acesso no /home/keite/.ssh"
touch /home/keite/.ssh/authorized_keys
echo "Mudar proprietario do /home/keite"
chown -R keite:keite /home/keite/.ssh
echo "Mudar permissoes do diretorio e arquivo criado dentro do /home/keite"
chmod 700 /home/keite/.ssh
chmod 600 /home/keite/.ssh/authorized_keys
echo "Criar senha padrao para keite"
passwd keite
echo "Criar a chave de acesso de keite"
ssh-keygen -b 2048 -C "keite@dti"
echo "Concatenar a chave publica de keite ao arquivo de autorizacao"
cat keite@*.pub >> /home/keite/.ssh/authorized_keys
echo "Remover a chave publica de keite"
rm -rf keite@*.pub
