#Preparando
echo " "
block_progress_bar 1
echo "Backup?"
read -rp "Nome do backup:  " -e -i "$(TZ=UTC+3 date +"%d-%m-%Y")" BACKUP
echo " "
draw_progress_bar 20
PATH_TO_BACKUP="~/MCPE-BACKUP";echo "$PATH_TO_BACKUP"
echo " "
TMP_UPDATE="~/mcpe-update";echo $TMP_UPDATE
draw_progress_bar 25

echo "verificando se a arquivos antingos no $(pwd)"
if [[ -d mcpe/ ]]; then
rm -rf mcpe/
fi
if [[ -e mcpe.zip ]];then
rm -rf mcpe.zip
fi
draw_progress_bar 34




# backup
zip $PATH_TO_BACKUP/$BACKUP.zip -r $PATH_TO_INSTALL

# BDS DOWNLOADS
wget "$BDS" -O mcpe.zip
draw_progress_bar 48

# descompactando 
unzip mcpe.zip -d mcpe
draw_progress_bar 50

#movendo









 	# separação dos arquivos
        echo "-------------------------------"
        mkdir "$TMP_UPDATE"
        draw_progress_bar 30
        
        
        #copia
        cp -rf "$PATH_TO_INSTALL/" "$PATH_TO_BACKUP"
        draw_progress_bar 36
        zip "$PATHBACKUP/$BACKUP-2".zip -r "$PATH_TO_INSTALL/"
        draw_progress_bar 38

        #copia de seguraça
        mkdir "$PATH_TO_BACKUP/"
        draw_progress_bar 40
        mkdir "$PATHBACKUP/"
        draw_progress_bar 43
        zip  "$PATHBACKUP/$BACKUP".zip -r "$PATH_TO_INSTALL/"
        draw_progress_bar 45

        if [[ -d $PATH_TO_INSTALL/ ]];then
        rm -rf $PATH_TO_INSTALL/
        draw_progress_bar 46
        fi

        #baixar a nova versão
        
        #removendo alguns arquivos
        rm -r mcpe/server.properties
        rm -r mcpe/whitelist.json
        draw_progress_bar 57
        # Movendo para o temp
        mv $PATH_TO_INSTALL/ /tmp/
        draw_progress_bar 60
        #copiar mundo e as configuraçoe
        cp -r "$PATH_TO_BACKUP/worlds" "mcpe/"
        draw_progress_bar 63
        cp "$PATH_TO_BACKUP/server.properties" "mcpe/"
        draw_progress_bar 64
        cp "$PATH_TO_BACKUP/whitelist.json" "mcpe/"
        draw_progress_bar 65

        #movendo
        mkdir $PATH_TO_INSTALL/
        draw_progress_bar 70
        cp -rf mcpe/* $PATH_TO_INSTALL/
        draw_progress_bar 80

        #remover arquivos antigos
        rm mcpe.zip
        draw_progress_bar 97
        rm -rf mcpe/
        draw_progress_bar 98
        rm -rf $PATH_TO_BACKUP
        draw_progress_bar 99
        rm -rf $TMP_UPDATE
        draw_progress_bar 100