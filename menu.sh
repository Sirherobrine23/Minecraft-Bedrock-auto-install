#!/bin/bash
clear
#--unistall
REMOVE=$(pwd)

#Debian - ubuntu
sudo apt install screen net-tools -y >>$USUARIO/log.txt 2>&1 ;

#Software
BDS="$(wget -qO- https://raw.githubusercontent.com/Sirherobrine23/Minecraft-Bedrock-auto-install/Beta/Update.txt)"

#caminho da instalação e do backup
PATH_TO_INSTALL="/home/Minecraft"
PATH_TO_BACKUP="/home/Minecraft-Backup"

#Usuario
USUARIO=$(cd ~/;pwd)

# Iniacialização
file=mcpe
FILE2=mcpe-start.sh


TMP=/home/Minecraft-temp
sudo mkdir $TMP >>$USUARIO/log.txt 2>&1 ;

# Remoção dos arquivo de log
sudo rm -rf $TMP/level.txt >>$USUARIO/log.txt 2>&1 ;

#Espaço
echo "o Diretorio do seu usuario é $USUARIO"
echo " "

#Root
if [ "$EUID" -ne 0 ]; then
	echo "Você não está executando o script com root ou sudo"
	exit 1
fi
if [[ -e /etc/debian_version ]]; then
	source /etc/os-release
	OS=$ID # debian or ubuntu
else
	echo "Você não tem instalado ou não esta com sistema Debian ou Ubuntu "
	exit 1
fi
case $1 in
   "--install") 
      if [[ $OS == 'ubuntu' ]]; then
                  #banner
                  cat banner.txt;
                  # Prerequisite
                  echo "  ";
                  echo "Instalando os Pré-reuisitos para o  ubuntu";
                  echo -ne "#                         (01%)\r";
                  sudo apt install -y wget unzip >>$USUARIO/log.txt 2>&1 ;
                  echo -ne "##                        (02%)\r";
                  echo " ";
                  echo "Criando diretorio do servidor no $PATH_TO_INSTALL"
                  sudo mkdir $PATH_TO_INSTALL >>$USUARIO/log.txt 2>&1 ;
                  #Download do arquivos servidor
                  echo -ne "#####                     (20%)\r";
                  echo "Baixando o Software do Servidor";
                  sudo wget $BDS -O $PATH_TO_INSTALL/mcpe.zip >>$USUARIO/log.txt 2>&1 ;
                  echo -ne "########                  (40%)\r";
                  echo "Instalando o Servidor";
                  sudo unzip -o $PATH_TO_INSTALL/mcpe.zip -d $PATH_TO_INSTALL/mcpe >>$USUARIO/log.txt 2>&1 ;
                  sudo rm -rf $PATH_TO_INSTALL/mcpe.zip;
                  echo -ne "#############             (50%)\r";
                  #config
                  rm -rf $PATH_TO_INSTALL/mcpe/server.properties >>$USUARIO/log.txt 2>&1 ;
                  rm -rf $PATH_TO_INSTALL/mcpe/whitelist.json >>$USUARIO/log.txt 2>&1 ;
                  cp -r ./server.properties $PATH_TO_INSTALL/mcpe/ >>$USUARIO/log.txt 2>&1 ;
                  cp -r ./whitelist.json $PATH_TO_INSTALL/mcpe/ >>$USUARIO/log.txt 2>&1 ;
                  echo -ne "#######################   (100%)\r";
                  echo -ne "####### completo ######   (100%)\r";
                  echo "O log está no arquivo $USUARIO/log.txt ou /tmp/install.log"
      elif [[ $OS == 'debian' ]]; then
                  #banner
                  cat banner.txt;
                  # Prerequisite
                  echo "  ";
                  echo "Instalando os Pré-reuisitos para o debian";
                  echo -ne "#                         (01%)\r";
                  sudo apt install -y wget unzip >>$USUARIO/log.txt 2>&1 ;
                  echo -ne "##                        (02%)\r";
                  echo " ";
                  echo "Criando o Diretorio do servidor no $PATH_TO_INSTALL";
                  sudo mkdir $PATH_TO_INSTALL >>$USUARIO/log.txt 2>&1 ;
                  #Download do arquivos servidor
                  echo "Baixando o Software do Servidor";
                  sudo wget $BDS -O $PATH_TO_INSTALL/mcpe.zip >>$USUARIO/log.txt 2>&1 ;
                  echo -ne "########                  (40%)\r";
                  sudo unzip -o $PATH_TO_INSTALL/mcpe.zip -d $PATH_TO_INSTALL/mcpe >>$USUARIO/log.txt 2>&1 ;
                  sudo rm -rf $PATH_TO_INSTALL/mcpe.zip;
                  echo -ne "#############             (50%)\r";
                  #config
                  rm -rf $PATH_TO_INSTALL/mcpe/server.properties >>$USUARIO/log.txt 2>&1 ;
                  rm -rf $PATH_TO_INSTALL/mcpe/whitelist.json >>$USUARIO/log.txt 2>&1 ;
                  cp -r ./server.properties $PATH_TO_INSTALL/mcpe/ >>$USUARIO/log.txt 2>&1 ;
                  cp -r ./whitelist.json $PATH_TO_INSTALL/mcpe/ >>$USUARIO/log.txt 2>&1 ;
                  echo -ne "#######################   (100%)\r";
                  echo -ne "####### completo ######   (100%)\r";
                  echo "O log está no arquivo $USUARIO/log.txt ou /tmp/install.log"
      fi
      ;;
      "--update")

      BACKUP="$(TZ=UTC+3 date +"%d-%m-%Y")"
      # Nome do mapa
      cat "$PATH_TO_INSTALL/mcpe/server.properties" | grep "level-name=" > "$TMP/level.txt" ; sed -i "s|level-name=||g" "$TMP/level.txt" >>$USUARIO/log.txt 2>&1 ;
      MAPA=$(cat $TMP/level.txt) >>$USUARIO/log.txt 2>&1 ;
            if [[ $OS == 'ubuntu' ]]; then
                        #banner
                        cat banner.txt;
                        #Copiando
                        echo -ne "Atualizando versão do Ubuntu\r"
                        sleep 2
                        echo -ne "Começado\r"
                        echo -ne "                          (0%)\r";
                        sudo mkdir $PATH_TO_BACKUP >>$USUARIO/log.txt 2>&1 ;
                        sudo mkdir $PATH_TO_BACKUP/$BACKUP >>$USUARIO/log.txt 2>&1 ;            
                        echo -ne "#                         (1%)\r";
                        sudo cp -r $PATH_TO_INSTALL/mcpe/worlds/* $PATH_TO_BACKUP/$BACKUP >>$USUARIO/log.txt 2>&1 ;
                        sudo cp $PATH_TO_INSTALL/mcpe/server.properties $PATH_TO_BACKUP/$BACKUP >>$USUARIO/log.txt 2>&1 ;
                        sudo cp $PATH_TO_INSTALL/mcpe/whitelist.json $PATH_TO_BACKUP/$BACKUP >>$USUARIO/log.txt 2>&1 ;
                        #Movendo versão antiga para $TMP
                        echo -ne "##                       (10%)\r";
                        
                        sudo mv $PATH_TO_INSTALL $TMP >>$USUARIO/log.txt 2>&1 ;
                        #Baixando
                        sudo rm -rf $PATH_TO_INSTALL/mcpe.zip >>$USUARIO/log.txt 2>&1 ;
                        sudo wget $BDS -O $PATH_TO_INSTALL/mcpe.zip >>$USUARIO/log.txt 2>&1 ;
                        sudo unzip -o $PATH_TO_INSTALL/mcpe.zip -d $PATH_TO_INSTALL/mcpe >>$USUARIO/log.txt 2>&1 ;
                        sudo rm -r $PATH_TO_INSTALL/mcpe.zip >>$USUARIO/log.txt 2>&1 ;
                        echo -ne "###########              (50%)\r";
                        #Criando Diretorios
                        sudo mkdir $PATH_TO_INSTALL >>$USUARIO/log.txt 2>&1 ;
                        sudo mkdir $PATH_TO_INSTALL/mcpe >>$USUARIO/log.txt 2>&1 ;
                        
                        #Copiando mapa para nova versão
                        sudo rm -rf $PATH_TO_INSTALL/worlds >>$USUARIO/log.txt 2>&1 ;
                        sudo rm -rf $PATH_TO_INSTALL/server.properties >>$USUARIO/log.txt 2>&1 ;
                        sudo rm -rf $PATH_TO_INSTALL/whitelist.json >>$USUARIO/log.txt 2>&1 ;
                        sudo cp -r $PATH_TO_BACKUP/$BACKUP/$MAPA $PATH_TO_INSTALL/mcpe/worlds/ >>$USUARIO/log.txt 2>&1 ;
                        sudo cp $PATH_TO_BACKUP/$BACKUP/server.properties $PATH_TO_INSTALL/mcpe/ >>$USUARIO/log.txt 2>&1 ;
                        sudo cp $PATH_TO_BACKUP/$BACKUP/whitelist.json $PATH_TO_INSTALL/mcpe/ >>$USUARIO/log.txt 2>&1 ;

                        sudo rm -rf $PATH_TO_INSTALL/mcpe/worlds/server.properties >>$USUARIO/log.txt 2>&1 ;
                        sudo rm -rf $PATH_TO_INSTALL/mcpe/worlds/whitelist.json >>$USUARIO/log.txt 2>&1 ;
                        sudo rm -r $PATH_TO_BACKUP
                        echo -ne "#######################   (100%)\r";
                        echo -ne "###### Completo #######   (100%)\r";
                        echo "O log está no arquivo $USUARIO/log.txt ou /tmp/install.log"
            elif [[ $OS == 'debian' ]]; then
                        #banner
                        cat banner.txt;
                        echo -ne "Atualizando versão do Debian\r"
                        sleep 2
                        echo -ne "Começado\r"
                        #Copiando
                        echo -ne "                          (0%)\r";
                        sudo mkdir $PATH_TO_BACKUP >>$USUARIO/log.txt 2>&1 ;
                        sudo mkdir $PATH_TO_BACKUP/$BACKUP >>$USUARIO/log.txt 2>&1 ;            
                        echo -ne "#                         (1%)\r";
                        sudo cp -r $PATH_TO_INSTALL/mcpe/worlds/* $PATH_TO_BACKUP/$BACKUP >>$USUARIO/log.txt 2>&1 ;
                        sudo cp $PATH_TO_INSTALL/mcpe/server.properties $PATH_TO_BACKUP/$BACKUP >>$USUARIO/log.txt 2>&1 ;
                        sudo cp $PATH_TO_INSTALL/mcpe/whitelist.json $PATH_TO_BACKUP/$BACKUP >>$USUARIO/log.txt 2>&1 ;
                        #Movendo versão antiga para $TMP
                        echo -ne "##                       (10%)\r";
                        
                        sudo mv $PATH_TO_INSTALL $TMP >>$USUARIO/log.txt 2>&1 ;
                        #Baixando
                        sudo rm -rf $PATH_TO_INSTALL/mcpe.zip >>$USUARIO/log.txt 2>&1 ;
                        sudo wget $BDS -O $PATH_TO_INSTALL/mcpe.zip >>$USUARIO/log.txt 2>&1 ;
                        sudo unzip -o $PATH_TO_INSTALL/mcpe.zip -d $PATH_TO_INSTALL/mcpe >>$USUARIO/log.txt 2>&1 ;
                        sudo rm -r $PATH_TO_INSTALL/mcpe.zip >>$USUARIO/log.txt 2>&1 ;
                        echo -ne "###########              (50%)\r";
                        #Criando Diretorios
                        sudo mkdir $PATH_TO_INSTALL >>$USUARIO/log.txt 2>&1 ;
                        sudo mkdir $PATH_TO_INSTALL/mcpe >>$USUARIO/log.txt 2>&1 ;
                        
                        #Copiando mapa para nova versão
                        sudo rm -rf $PATH_TO_INSTALL/worlds >>$USUARIO/log.txt 2>&1 ;
                        sudo rm -rf $PATH_TO_INSTALL/server.properties >>$USUARIO/log.txt 2>&1 ;
                        sudo rm -rf $PATH_TO_INSTALL/whitelist.json >>$USUARIO/log.txt 2>&1 ;
                        sudo cp -r $PATH_TO_BACKUP/$BACKUP/$MAPA $PATH_TO_INSTALL/mcpe/worlds/ >>$USUARIO/log.txt 2>&1 ;
                        sudo cp $PATH_TO_BACKUP/$BACKUP/server.properties $PATH_TO_INSTALL/mcpe/ >>$USUARIO/log.txt 2>&1 ;
                        sudo cp $PATH_TO_BACKUP/$BACKUP/whitelist.json $PATH_TO_INSTALL/mcpe/ >>$USUARIO/log.txt 2>&1 ;

                        sudo rm -rf $PATH_TO_INSTALL/mcpe/worlds/server.properties >>$USUARIO/log.txt 2>&1 ;
                        sudo rm -rf $PATH_TO_INSTALL/mcpe/worlds/whitelist.json >>$USUARIO/log.txt 2>&1 ;
                        sudo rm -r $PATH_TO_BACKUP
                        echo -ne "#######################   (100%)\r";
                        echo -ne "###### Completo #######   (100%)\r";
                        echo "O log está no arquivo $USUARIO/log.txt ou /tmp/install.log"
            fi
      ;;
      "--screen") 
            #install
            echo "Instalando o Screen ";
            sudo apt install -y screen ;
            sudo bash menu --ubuntu;
            sudo mv mcpe /sbin/ ; sudo chmod a+x /sbin/mcpe;
            echo "DICA: Para deixar o servidor em segundo plano aperte CRTL + A + D. deixara em segundo plano para voltar basta executar o comando screen -r"
      ;;
      "--start-file")
            #Config File
            rm -rf /tmp/level.txt
            rm -rf /sbin/mcpe
            cat $FILE2 > "$file"
            cat $PATH_TO_INSTALL/mcpe/server.properties | grep "level-name=" > /tmp/level.txt ; sed -i "s|level-name=||g" "/tmp/level.txt"
            sed -i "s|DIRE|$PATH_TO_INSTALL|g" "$file";
            sed -i "s|MAPASS|$(cat /tmp/level.txt)|g" "$file"
            sed -i "s|PATH_TO_INSTALL|$PATH_TO_INSTALL|g" "$file"
            sudo mv "$file" /sbin/mcpe ; sudo chmod a+x /sbin/mcpe ; 
            echo " "
            echo "Para deixar o servidor em segundo plano aperte CRTL + A + D. deixara em segundo plano para voltar basta executar o comando screen -r"
      ;;
      "--start-on-system")

	if [[ -e /sbin/mcpe ]]; then
            echo "Percebi que já tem o --start-file pronto."
            echo "montando o arquivos para que tudo nos ajude"
            sudo cp start-on-system.sh /etc/init.d/mcpe;
            echo "copiando o arquivo";
            sudo chmod a+x /etc/init.d/mcpe;
            update-rc.d mcpe defaults
            echo "pronto ele inicia junto com sistema(Beta), o comando abaixo pode ajudar"
            echo 'sudo service mcpe start | stop | restart'
            echo " "
	else
            #Config File
            echo "percebir que não executou --start-file, sem problema vamos fazer isso agora!"
            echo "montando o arquivo necessario espere"
            rm -rf /tmp/level.txt
            rm -rf /sbin/mcpe
            cat $FILE2 > "$file"
            cat $PATH_TO_INSTALL/mcpe/server.properties | grep "level-name=" > /tmp/level.txt ; sed -i "s|level-name=||g" "/tmp/level.txt"
            sed -i "s|DIRE|$PATH_TO_INSTALL|g" "$file";
            sed -i "s|MAPASS|$(cat /tmp/level.txt)|g" "$file"
            sed -i "s|PATH_TO_INSTALL|$PATH_TO_INSTALL|g" "$file"
            sudo mv "$file" /sbin/mcpe ; sudo chmod a+x /sbin/mcpe ;
            echo "arquivo pronto"
            echo "agora o outro arquivo"
            #pos
            sudo rm -rf /etc/init.d/mcpe
            sudo cp start-on-system.sh /etc/init.d/mcpe;
            echo "copiando o arquivo";
            sudo chmod a+x /etc/init.d/mcpe;
            update-rc.d mcpe defaults
            echo "pronto ele inicia junto com sistema(Beta) o comando abaixo pode ajudar"
            echo 'sudo service mcpe start | stop | restart'
            echo " "
	fi
      ;;
      "--ip")

      #Comando --ip variaveis
            IP_V4=$(ip addr | grep 'inet' | grep -v inet6 | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | grep -oE '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | head -1)
            SEARCH_IPV6=$(ip -6 route ls | grep default | grep -Po '(?<=dev )(\S+)' | head -1)
            IP_V6=$(ifconfig $SEARCH_IPV6 | grep "inet6" | awk -F' ' '{print $2}' | awk '{print $1}') 
            IP_PUBLICO=$(wget -qO- http://ipecho.net/plain)
            #Echo's
                  echo "Seu IPv4 é $IP_V4 para Jogar localmente , e o Seu IPv6 é $(echo -ne $IP_V6)"
                  echo " "
                  echo "Caso Queira Jogar Remotamento com alguém Abra as Portas 19132 e 19133 no seu Roteador ou seu Firewall, seu IPv4 Publico é $IP_PUBLICO"
                  echo "Também verifique se sua operadora ou provedor libera as portas do servidor. contate-os"
            echo " ";
      ;;
      "--unistall") sudo rm -rf $REMOVE
      ;;
      *) cat help.txt ; echo " ";
      exit 1
      ;;
esac

echo "qualquer erro no script me comunique no https://github.com/Sirherobrine23/Minecraft-Bedrock-auto-install/issues"
sudo rm -rf mcpe.zip
