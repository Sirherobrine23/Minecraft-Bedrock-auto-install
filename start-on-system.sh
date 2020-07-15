#!/bin/bash

### BEGIN INIT INFO
# Provides:             BDS
# Required-Start:       $network
# Required-Stop:        
# Default-Start:        2 3 4 5
# Default-Stop:         
# Short-Description:    Minecraft BDS Server Auto Start
### END INIT INFO

NAME="BDS"
if [[ "$EUID" -ne 0 ]]; then
echo "Você não está executando o service com root ou sudo";exit 1
fi
DATE="$(TZ=UTC+3 date +"%H-%M-%S")"
DA2TE=""$(TZ=UTC+3 date +"%d/%m/%Y-%H-%M-%S")"
TM="/tmp/"
MKDIRID="IDSh23"
rm -rf "$TM/ID.txt"
gdrive mkdir $(echo $DA2TE) -p "$MKDIRID" >> "$TM/ID.txt"
sed -i "s| created||g" "$TM/ID.txt"
sed -i "s|Directory ||g" "$TM/ID.txt"
GDRIVE_FOLDE="$(cat $TM/ID.txt)"
# leste
PATH_TO_INSTALL="MINESh23"
PATH_TO_BACKUP="MINE2Sh23"
MAPS_DO="NAMESh23"
ALLNAME="$MAPS_DO-$DATE"
sh23backup(){
cd "$PATH_TO_INSTALL/worlds/"
zip "$ALLNAME.zip" -r "$MAPS_DO"
cp "$ALLNAME.zip" "$PATH_TO_BACKUP/"
gdrive upload "$ALLNAME.zip" --parent "$GDRIVE_FOLDE"
rm "$ALLNAME.zip"
}
startsh23(){
        sudo screen -dmS bedrock BDS
}
stopsh23(){
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
        sh23backup
}
restartsh23(){
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
        sh23backup
        screen -X -S bedrock quit
    echo "O servidor está ligado ágora:)"
    sleep 2
        screen -dmS bedrock
        screen -S bedrock -X stuff "./bedrock_server"
fi
}
status-sh23(){
    status_of_proc -p $PIDFILE "$NAME" "$NAME"
	exit $?
}
case "$1" in 
    start) startsh23 ;;
    stop) stopsh23 ;;
    restart) restartsh23;;
    *) echo "Usage: $0 {start | stop| restart}"
esac
exit 0 
