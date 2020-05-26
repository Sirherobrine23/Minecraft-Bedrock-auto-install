#!/bin/bash
if [[ -e DIRE/backup.txt ]]; then
    echo "Sem backup, já já iniciamos seu servidor"
    cd DIRE/mcpe/
    LD_LIBRARY_PATH=. ./bedrock_server
else
    echo "Com Backup, já já iniciamos seu servidor"
    cd DIRE/mcpe/
    LD_LIBRARY_PATH=. ./bedrock_server
    #New
    cd DIRE/mcpe/
    echo 'Fazendo backup do mapa'
    DATE=$(TZ=UTC+3 date +"%d-%m-%Y-%H-%M-%S")
    GDRIVE_FOLDE=ID-DA-PASTA-NO-GOOGLE-DRIVE
    cd worlds/ ; zip $DATE-"MAPASS".zip -r "MAPASS" 
    gdrive upload --parent $GDRIVE_FOLDE $DATE-MAPASS.zip
    rm $DATE-Sirherobrine23.zip
fi

exit 1