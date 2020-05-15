set URL_INSTALL=https://minecraft.azureedge.net/bin-linux/bedrock-server-1.14.60.5.zip
set PATH_TO_INSTALL=%HOMEPATH%\mcpe
set WIN_DIR_C=C:/Users/Mathe/mcpe/mcpe.zip


mkdir %PATH_TO_INSTALL%
wget.exe %URL_INSTALL% -O %WIN_DIR_C%/mcpe/mcpe.zip
unzip -o "%PATH_TO_INSTALL%\mcpe\mcpe.zip" -d "%PATH_TO_INSTALL%\mcpe"