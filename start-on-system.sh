#!/bin/bash
if [ "$EUID" -ne 0 ]; then
	echo "Você não está executando o service com root ou sudo"
	exit 1
fi
case "$1" in 
    start)
       echo "Para deixar o servidor em segundo plano aperte CRTL + A + D. deixara em segundo plano para voltar basta executar o comando screen -r"
       sudo screen -S bedrock mcpe
       ;;
    stop)
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
       ;;
    restart)
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
    ;;
    *)
       echo "Usage: $0 {start|stop|reboot|restart}"
esac

exit 0 