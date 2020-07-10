#!/bin/bash 
GDRIVE_FOLDE="IDSh23"
PATH_TO_INSTALL="MINESh23"
PATH_TO_BACKUP="MINE2Sh23"
MAPS_DO="NAMESh23"
DATE="$(TZ=UTC+3 date +"%d-%m-%Y")"
backupsh23(){
        cd "$PATH_TO_INSTALL/" 
        echo "Fazendo backup do mapa"
        cd worlds/ 
        zip "$MAPS_DO-$DATE.zip" -r "$MAPS_DO"
        cp "$MAPS_DO-$DATE.zip" "$PATH_TO_BACKUP/"
        gdrive upload "$MAPS_DO-$DATE.zip" --parent "$GDRIVE_FOLDE"
        rm "$MAPS_DO.zip"
}
if [[ -e $PATH_TO_INSTALL/backup.txt ]]; then 
    echo "Com Backup, já já iniciamos seu servidor"
    cd "$PATH_TO_INSTALL/"
    LD_LIBRARY_PATH=. ./bedrock_server
    backupsh23
else 
    echo "Sem backup, já já iniciamos seu servidor"
    cd "$PATH_TO_INSTALL/"
    LD_LIBRARY_PATH=. ./bedrock_server
fi
exit 1