#!/bin/bash
#Git
echo "instalando o git e o curl";
sudo apt install git dos2unix -y;
echo "Baixando o Instalador";
git clone https://github.com/Sirherobrine23/Minecraft-Bedrock-auto-install.git -b linux installer
cd installer
sudo chmod a+x menu.sh;
echo "pronto. execute os comandos abaixo:";
echo 'bash menu.sh';
