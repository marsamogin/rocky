#!/bin/bash
# Capturar o nome da maquina
hostname=`hostname`
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
##########################################
##########################################
echo "Configurar acesso usuario ludgero"
/root/shell/./create-user-rocky-ludgero.sh
##########################################
echo "Configurar acesso usuario marcio"
/root/shell/./create-user-rocky-marcio.sh
##########################################
echo "Configurar acesso usuario keite"
/root/shell/./create-user-rocky-keite.sh
##########################################
echo "Configurar acesso usuario otoniel"
/root/shell/./create-user-rocky-otoniel.sh
##########################################
echo "Configurar acesso usuario danfeijo"
/root/shell/./create-user-rocky-danfeijo.sh
##########################################
echo "Copiar as chaves privadas para a maquina Linux auxiliar"
scp *@$hostname marcio@143.106.108.5:/tmp
rm -rf *@$hostname
