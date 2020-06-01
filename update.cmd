rem variaveis
set URL_update=https://minecraft.azureedge.net/bin-win/bedrock-server-1.14.60.5.zip
set PATH_TO_update=%HOMEPATH%\mcpe
set PATH_TO_BACKUP=%HOMEPATH%\mcpe-backup
set PATH_TO_ZIP=%HOMEPATH%\mcpe-backup-zip
rem backup mapa e outros
echo Comecando o Backup
echo 'Backup do mapa'
rm -rf mcpe/ >>update.log 2>&1
mkdir %PATH_TO_ZIP% >>update.log 2>&1
cp -r %PATH_TO_update%\ %PATH_TO_BACKUP% >>update.log 2>&1
zip\zip.exe a %PATH_TO_ZIP%\backup.zip %PATH_TO_update% >>update.log 2>&1
rm -rf %PATH_TO_update% >>update.log 2>&1
echo baixando a nova versão
wget.exe --no-check-certificate %URL_update% -O mcpe.zip >>update.log 2>&1
unzip mcpe.zip -d mcpe/ >>update.log 2>&1
rm -rf mcpe/whitelist.json >>update.log 2>&1
rm -rf mcpe/server.properties >>update.log 2>&1
echo Movendo o mapa e as configuracoes
mkdir %PATH_TO_update% >>update.log 2>&1
cp -r mcpe/* %PATH_TO_update% >>update.log 2>&1
rm -rf mcpe >>update.log 2>&1
cp -r %PATH_TO_BACKUP%\worlds %PATH_TO_update% >>update.log 2>&1
cp -r %PATH_TO_BACKUP%\whitelist.json %PATH_TO_update% >>update.log 2>&1
cp -r %PATH_TO_BACKUP%\server.properties %PATH_TO_update% >>update.log 2>&1
echo Pronto
pause