#!/bin/bash
# Capturar o nome da maquina
hostname=`hostname`
##########################################
echo "Configurar acesso usuario ludgero"
/root/shell/./create-user-rocky-ludgero.sh
##########################################
echo "Configurar acesso usuario marcio"
/root/shell/./create-user-marcio.sh
##########################################
echo "Configurar acesso usuario keite"
/root/shell/./create-user-keite.sh
##########################################
echo "Configurar acesso usuario otoniel"
/root/shell/./create-user-otoniel.sh
##########################################
echo "Configurar acesso usuario danfeijo"
/root/shell/./create-user-danfeijo.sh
##########################################
echo "Copiar as chaves privadas para a maquina Linux auxiliar"
scp *@$hostname marcio@143.106.108.5:/tmp
