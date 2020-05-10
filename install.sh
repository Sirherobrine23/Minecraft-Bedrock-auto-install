#!/bin/bash
#Git
echo "instalando o git e o curl";
sudo Apt install git -y;
echo "Baixando o Instalador";
git clone https://github.com/Sirherobrine23/Minecraft-Bedrock-auto-install.git installer
sudo chmod a+x installer/menu;
echo "pronto. execute um dos comandos abaixo"
echo '"./installer/menu -h"'
echo 'ou "./menu -h"'