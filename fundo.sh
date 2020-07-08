#!/bin/bash 
GDRIVE_FOLDE=ID
PATH_TO_INSTALL=MINE
MAPS_DO=NAME

if [[ -e $PATH_TO_INSTALL/backup.txt ]]; then 
    echo "Com Backup, já já iniciamos seu servidor"
    cd $PATH_TO_INSTALL/ 
    LD_LIBRARY_PATH=. ./bedrock_server 
    cd $PATH_TO_INSTALL/ 
    echo "Fazendo backup do mapa"
    cd worlds/ ; zip $MAPS_DO.zip -r $MAPS_DO
    gdrive upload --parent $GDRIVE_FOLDE $MAPS_DO.zip 
    rm $MAPS_DO.zip
else 
    echo "Sem backup, já já iniciamos seu servidor"
    cd $PATH_TO_INSTALL/
    LD_LIBRARY_PATH=. ./bedrock_server
fi
exit 1