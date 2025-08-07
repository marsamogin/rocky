#!/bin/bash
# Instalar o git
yum install git -y
# Criar diretorio shell e entrar nele
mkdir /root/shell && cd /root/shell
# Baixar shell do Github
git clone https://github.com/marsmogin/linux/rocky
# Mover arquivos para diretorio shell
mv /rocky/*.sh .
# Adicionar permissao de execuçao aos aqruivos
chmod +x *.sh
