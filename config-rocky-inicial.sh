#!/bin/bash -xv
# Redefine o mapa do teclado para ABNT
localectl set-keymap br-abnt
# Instalar o git
yum install git -y
# Criar diretorio shell e entrar nele
mkdir /root/shell && cd /root/shell
# Baixar shell do Github
git clone https://github.com/marsamogin/rocky
# Adicionar permissao de execuçao aos aqruivos
chmod +x /root/shell/rocky/*.sh
# Chama script de criacao de usuarios
/root/shell/rocky/./create-users-rocky.sh
