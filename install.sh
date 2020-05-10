#!/bin/bash
#banner
cat banner.txt;

#Variaveis
SERVER_URL="https://minecraft.azureedge.net/bin-linux/bedrock-server-1.14.60.5.zip"
PATH_TO_INSTALL="/var/www"



# Prerequisite
echo "  ";
echo "Instalando os Pré-reuisitos para o debian, ubuntu";
echo -ne "#                         (01%)\r";
sudo apt install -y wget git unzip > log.txt > /dev/null 2>&1;
echo -ne "##                        (02%)\r";
sudo mkdir $PATH_TO_INSTALL > /dev/null 2>&1;
#Download do arquivos servidor
sudo wget $SERVER_URL -O $PATH_TO_INSTALL/mcpe.zip > log.txt > /dev/null 2>&1;
echo -ne "########                  (40%)\r";
sudo unzip $PATH_TO_INSTALL/mcpe.zip -d $PATH_TO_INSTALL/mcpe > log.txt > /dev/null 2>&1;
sudo rm -r $PATH_TO_INSTALL/mcpe.zip;
echo -ne "#############             (50%)\r";
#config
rm $PATH_TO_INSTALL/mcpe/server.properties
rm $PATH_TO_INSTALL/mcpe/whitelist.json
cp -r ./server.properties $PATH_TO_INSTALL/mcpe/
cp -r ./whitelist.json $PATH_TO_INSTALL/mcpe/
echo -ne "\n #######################   (100%)\r";
echo -ne "\n completo                 (100%)\r";