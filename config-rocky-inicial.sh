#!/bin/bash -xv
# Instalar o git
yum install git -y
# Criar diretorio shell e entrar nele
mkdir /root/shell && cd /root/shell
# Baixar shell do Github
git clone https://github.com/marsamogin/rocky
# Mover arquivos para diretorio shell
mv /root/shell/rocky/*.sh .
# Adicionar permissao de execuçao aos aqruivos
chmod +x *.sh
# Remove diretorio baixado
rm -rf /root/shell/rocky
