#!/bin/bash
clear
rm log.txt
rm mcpe.zip

#Software
BDS="$(wget -qO- https://raw.githubusercontent.com/Sirherobrine23/Minecraft-Bedrock-auto-install/linux/Update.txt)"
#caminho da instalação e do backup
PATH_TO_INSTALL="/mnt/d/Gitlab/Minecraft-Bedrock-auto-install/tes-backup-script/mcpe-teste/"
#Usuario
USUARIO=./
#OLD
#NEW

#Preparando
echo "Qual nome do Backup?"
      read -rp "  " -e -i "$(TZ=UTC+3 date +"%d-%m-%Y")" BACKUP

echo "Por padrão é no /home/Minecraft-Backup, mais esse diretorio será a apagado depois mantendo os novos no $PATH_TO_INSTALL"
      read -rp "Aonde vai ser o backup: " -e -i "/home/Minecraft-Backup" PATH_TO_BACKUP

echo "arquivos temporarios"
      read -rp "A onde vai ser a pasta temporaria: " -e -i "/tmp/mcpe-update" TMP_UPDATE

#---------------------------------------------------------------------------------------------------------
cat "$PATH_TO_INSTALL/mcpe/server.properties" | grep "level-name=" >> "$TMP_UPDATE/level.txt" ;
sed -i "s|level-name=||g" "$TMP_UPDATE/level.txt"
MAPA=$(cat $TMP_UPDATE/level.txt) >>$USUARIO/log.txt 2>&1 ;
#---------------------------------------------------------------------------------------------------------
echo " "
echo " "

#copia

#copia de seguraça

#exterminar versao antiga

#baixar a nova versão

#copiar mundo e as configuraçoes

#remover arquivos antigos