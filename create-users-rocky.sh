#!/bin/bash
##########################################
##########################################
#echo "Configurar acesso usuario ludgero"
#/root/shell/rocky/./create-user-rocky-ludgero.sh
##########################################
echo "Configurar acesso usuario marcio"
/root/shell/rocky/./create-user-rocky-marcio.sh
##########################################
echo "Configurar acesso usuario keite"
/root/shell/rocky/./create-user-rocky-keite.sh
##########################################
#echo "Configurar acesso usuario otoniel"
#/root/shell/rocky/./create-user-rocky-otoniel.sh
##########################################
echo "Configurar acesso usuario danfeijo"
/root/shell/rocky/./create-user-rocky-danfeijo.sh
##########################################
# Capturar o nome da maquina
hostname=$(hostname)
echo "Copiar as chaves privadas para a maquina Linux auxiliar"
scp *@$hostname marcio@143.106.190.136:/home/marcio/temp
rm -rf *@$hostname
/root/shell/rocky/./config-rocky.sh
