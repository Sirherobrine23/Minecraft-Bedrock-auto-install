echo off

set URL_INSTALL=https://minecraft.azureedge.net/bin-win/bedrock-server-1.14.60.5.zip
set PATH_TO_INSTALL=%HOMEPATH%\mcpe
set WIN_DIR_C=C:/Users/Mathe/mcpe/


mkdir %WIN_DIR_C% ;
mkdir mcpe
wget.exe --no-check-certificate %URL_INSTALL% -O mcpe.zip ;
unzip mcpe.zip -d mcpe/

pause