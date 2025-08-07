#!/bin/bash
echo "Criar usuario otoniel e diretorio home"
useradd -d /home/otoniel otoniel
echo "Incluir otoniel no grupo sudo"
usermod -aG wheel otoniel
echo "Criar pasta .ssh no /home/otoniel"
mkdir /home/otoniel/.ssh
echo "Criar arquivo de autorizacao de acesso no /home/otoniel/.ssh"
touch /home/otoniel/.ssh/authorized_keys
echo "Mudar proprietario do /home/otoniel"
chown -R otoniel:otoniel /home/otoniel/.ssh
echo "Mudar permissoes do diretorio e arquivo criado dentro do /home/otoniel"
chmod 700 /home/otoniel/.ssh
chmod 600 /home/otoniel/.ssh/authorized_keys
echo "Criar senha padrao para otoniel"
passwd otoniel
echo "Criar a chave de acesso de otoniel"
ssh-keygen -b 2048 -C "otoniel@dti"
echo "Concatenar a chave publica de otoniel ao arquivo de autorizacao"
cat otoniel@*.pub >> /home/otoniel/.ssh/authorized_keys
echo "Remover a chave publica de otoniel"
rm -rf otoniel@*.pub
