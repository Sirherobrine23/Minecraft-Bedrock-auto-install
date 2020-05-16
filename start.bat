echo off

set URL_INSTALL=https://minecraft.azureedge.net/bin-win/bedrock-server-1.14.60.5.zip
set PATH_TO_INSTALL=%HOMEPATH%\mcpe
set WIN_DIR_C=C:/Users/Mathe/mcpe/mcpe.zip


mkdir %WIN_DIR_C% ;
wget.exe --no-check-certificate %URL_INSTALL% -O mcpe.zip ;
unzip -o mcpe.zip -d %WIN_DIR_C%/mcpe/ ;