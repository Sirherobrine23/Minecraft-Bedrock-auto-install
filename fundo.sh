#!/bin/bash 
GDRIVE_FOLDE="ID"
PATH_TO_INSTALL="MINE"
MAPS_DO="NAME"
DATE="$(TZ=UTC+3 date +"%d-%m-%Y")"
backup-sh23() {
        cd "$PATH_TO_INSTALL/" 
        echo "Fazendo backup do mapa"
        cd worlds/ ; zip "$MAPS_DO-$DATE.zip" -r "$MAPS_DO"
        gdrive upload "$MAPS_DO-$DATE.zip" --parent "$GDRIVE_FOLDE"
        rm "$MAPS_DO.zip"
}
    if [[ -e $PATH_TO_INSTALL/backup.txt ]]; then 
        echo "Com Backup, já já iniciamos seu servidor"
        cd "$PATH_TO_INSTALL/"
        LD_LIBRARY_PATH=. ./bedrock_server
        backup-sh23
    else 
        echo "Sem backup, já já iniciamos seu servidor"
        cd "$PATH_TO_INSTALL/"
        LD_LIBRARY_PATH=. ./bedrock_server
    fi
exit 1