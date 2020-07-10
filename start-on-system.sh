#!/bin/bash

### BEGIN INIT INFO
# Provides:             BDS
# Required-Start:       $all
# Required-Stop:        
# Default-Start:        2 3 4 5
# Default-Stop:         
# Short-Description:    Minecraft BDS Server Auto Start
### END INIT INFO

if [[ "$EUID" -ne 0 ]]; then
echo "Você não está executando o service com root ou sudo";exit 1
fi
GDRIVE_FOLDE="IDSh23"
PATH_TO_INSTALL="MINESh23"
PATH_TO_BACKUP="MINE2Sh23"
MAPS_DO="NAMESh23"
DATE="$(TZ=UTC+3 date +"%d-%m-%Y")"
backupsh232() {
        cd "$PATH_TO_INSTALL/" 
        echo "Fazendo backup do mapa"
        cd worlds/
        zip "$MAPS_DO-$DATE.zip" -r "$MAPS_DO"
        cp "$MAPS_DO-$DATE.zip" "$PATH_TO_BACKUP/"
        gdrive upload "$MAPS_DO-$DATE.zip" --parent "$GDRIVE_FOLDE"
        rm "$MAPS_DO.zip"
}
startsh23() {
        sudo screen -dmS bedrock mcpe-server
}
stopsh23() {
        screen -Rd bedrock -X stuff
        sleep 5
        screen -Rd bedrock -X stuff
        sleep 1
        screen -Rd bedrock -X stuff
        sleep 1
        screen -Rd bedrock -X stuff
        sleep 1
        screen -Rd bedrock -X stuff
        sleep 1
        screen -Rd bedrock -X stuff
        sleep 1
        screen -Rd bedrock -X stuff
        screen -X -S bedrock quit
        backupsh232
}
restartsh23() {

if ! screen -list | grep -q "bedrock"; then
    echo "Servidor não está ligado ou Não foi possivel reinicia."
else
    echo "Reiniciando o servidor em 30 segundos"
        screen -Rd bedrock -X stuff
    sleep 25
        screen -Rd bedrock -X stuff
    sleep 1
        screen -Rd bedrock -X stuff
    sleep 1
        screen -Rd bedrock -X stuff
    sleep 1
        screen -Rd bedrock -X stuff
    sleep 1
        screen -Rd bedrock -X stuff
    sleep 1
        screen -Rd bedrock -X stuff
        screen -X -S bedrock quit
    echo "O servidor está ligado ágora:)"
    sleep 2
        screen -dmS bedrock
        screen -S bedrock -X stuff "./bedrock_server"
fi
}
case "$1" in 
    start) startsh23 ;;
    stop) stopsh23 ;;
    restart) restartsh23;;
    *) echo "Usage: $0 {start | stop| restart}"
esac
exit 0 
