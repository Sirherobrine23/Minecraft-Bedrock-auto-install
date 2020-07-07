#! /bin/sh

### BEGIN INIT INFO
# Provides:             BDS
# Required-Start:       $all
# Required-Stop:        
# Default-Start:        2 3 4 5
# Default-Stop:         
# Short-Description:    Minecraft BDS Server Auto Start
### END INIT INFO

startsh23() {
        echo "Para deixar o servidor em segundo plano aperte CRTL + A + D. deixara em segundo plano para voltar basta executar o comando screen -r"
        sudo screen -S bedrock mcpe-server
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
        echo "Agora o Servidor está parado."
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

if [ "$EUID" -ne 0 ]; then
	echo "Você não está executando o service com root ou sudo"
	exit 1
fi
case "$1" in 
    start) startsh23 ;;
    stop) stopsh23 ;;
    restart) restartsh23;;
    *) echo "Usage: $0 {start | stop| restart}"
esac

exit 0 
