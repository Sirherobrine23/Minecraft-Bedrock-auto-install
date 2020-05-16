@echo off

rem variaveis
set URL_INSTALL=https://minecraft.azureedge.net/bin-win/bedrock-server-1.14.60.5.zip >>install.log 2>&1
set PATH_TO_INSTALL=%HOMEPATH%\mcpe >>install.log 2>&1
set WIN_DIR_C=C:/Users/Mathe/mcpe/ >>install.log 2>&1


echo "Baixando os arquivos e fazendo os prerequisitos"
rm -rf mcpe >>install.log 2>&1
mkdir %WIN_DIR_C% >>install.log 2>&1
mkdir mcpe >>install.log 2>&1
wget.exe --no-check-certificate %URL_INSTALL% -O mcpe.zip >>install.log 2>&1
unzip mcpe.zip -d mcpe/ >>install.log 2>&1
rm -rf mcpe/whitelist.json >>install.log 2>&1
rm -rf mcpe/server.properties >>install.log 2>&1
wget.exe --no-check-certificate https://raw.githubusercontent.com/Sirherobrine23/Minecraft-Bedrock-auto-install/Beta/server.properties -O mcpe/server.properties >>install.log 2>&1
wget.exe --no-check-certificate https://raw.githubusercontent.com/Sirherobrine23/Minecraft-Bedrock-auto-install/Beta/whitelist.json -O mcpe/whitelist.json >>install.log 2>&1

rem cp -r mcpe/* %PATH_TO_INSTALL%