#!/bin/bash
#Git
echo "instalando o git e o curl";
sudo Apt install git dos2unix -y;
echo "Baixando o Instalador";
git clone https://github.com/Sirherobrine23/Minecraft-Bedrock-auto-install.git installer
sudo chmod a+x installer/menu.sh;
cd installer
dos2unix */*/*/*/*/*/*
echo "pronto. execute os comandos abaixo";
echo '"cd installer", "./menu.sh"';