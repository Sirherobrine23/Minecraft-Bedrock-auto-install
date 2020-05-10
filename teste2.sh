            
#Variaveis
  
SERVER_URL="https://minecraft.azureedge.net/bin-linux/bedrock-server-1.14.60.5.zip"
SERVER_UPDATE="$(wget -qO- https://raw.githubusercontent.com/Sirherobrine23/Minecraft-Bedrock-auto-install/master/Update.txt)"
PATH_TO_INSTALL="/mnt/d/teste/Minecraft"
PATH_TO_BACKUP="/mnt/d/teste/Minecraft-Backup"
IP_V4=$(hostname -i)
IP_V6=$(hostname -I)
IP_PUBLICO=$(wget -qO- ifconfig.me)
file=mcpe
FILE2=mcpe-start.txt
MAPA=$(cat $TMP/level.txt)
BACKUP="$(TZ=UTC+3 date +"%d-%m-%Y")"
TMP=/mnt/d/teste/tmp
rm -rf $TMP/*
cat "$PATH_TO_INSTALL/mcpe/server.properties" | grep "level-name=" > "$TMP/level.txt" ; sed -i "s|level-name=||g" "$TMP/level.txt";

            #Copiando
            sudo mkdir $PATH_TO_BACKUP 2>> log.txt;
            sudo mkdir $PATH_TO_BACKUP/$BACKUP 2>> log.txt;            
            sudo cp -r $PATH_TO_INSTALL/mcpe/worlds/* $PATH_TO_BACKUP/$BACKUP 2>> log.txt;
            sudo cp $PATH_TO_INSTALL/mcpe/server.properties $PATH_TO_BACKUP/$BACKUP 2>> log.txt;
            sudo cp $PATH_TO_INSTALL/mcpe/whitelist.json $PATH_TO_BACKUP/$BACKUP 2>> log.txt;
            
            #Movendo versão antiga para $TMP
            sudo mv $PATH_TO_INSTALL $TMP 2>> log.txt;
            
            #Baixando
#            sudo wget $SERVER_UPDATE -O $PATH_TO_INSTALL/mcpe.zip 2>> log.txt;
#            sudo unzip $PATH_TO_INSTALL/mcpe.zip -d $PATH_TO_INSTALL/mcpe 2>> log.txt;
#            sudo rm -r $PATH_TO_INSTALL/mcpe.zip 2>> log.txt;

            #Criando Diretorios
            sudo mkdir $PATH_TO_INSTALL 2>> log.txt;
            sudo mkdir $PATH_TO_INSTALL/mcpe 2>> log.txt;
            
            #Copiando mapa para nova versão
             sudo rm -rf $PATH_TO_INSTALL/worlds 2>> log.txt;
             sudo rm -rf $PATH_TO_INSTALL/server.properties 2>> log.txt;
             sudo rm -rf $PATH_TO_INSTALL/whitelist.json 2>> log.txt;
            sudo cp -r $PATH_TO_BACKUP/$BACKUP/$MAPA $PATH_TO_INSTALL/mcpe/worlds/ 2>> log.txt;
            sudo cp $PATH_TO_BACKUP/$BACKUP/server.properties $PATH_TO_INSTALL/mcpe/ 2>> log.txt;
            sudo cp $PATH_TO_BACKUP/$BACKUP/whitelist.json $PATH_TO_INSTALL/mcpe/ 2>> log.txt;

            sudo rm -rf $PATH_TO_INSTALL/mcpe/worlds/server.properties 2>> log.txt;
            sudo rm -rf $PATH_TO_INSTALL/mcpe/worlds/whitelist.json 2>> log.txt;