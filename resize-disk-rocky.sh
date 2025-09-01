#!/bin/bash
#
# Criar o Volume utilizando a partição criada anteriormente.
sudo pvcreate /dev/sda3
#
# Extende o volume do disco atual
sudo vgextend rl /dev/sda3
#
# Adiciona o espaco
sudo lvextend -l +100%FREE /dev/mapper/rl-root
#
# Faz o resize em real-time
sudo xfs_growfs /dev/mapper/rl-root
#
# Confere o novo tamanho no disco
sudo df -h
