<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE fontconfig SYSTEM "../fonts.dtd">
<fontconfig>
  <!--  /etc/fonts/conf.d/20-unhint-small-dejavu-lgc-sans.conf

        Disable hinting manually at smaller sizes (< 8ppem)
        This is a copy of the Bistream Vera fonts fonts rule, as DejaVu is
        derived from Vera.

	The Bistream Vera fonts have GASP entries suggesting that hinting be
	disabled below 8 ppem, but FreeType ignores those, preferring to use
	the data found in the instructed hints. The initial Vera release
	didn't include the right instructions in the 'prep' table.
 -->
  <match target="font">
    <test name="family">
      <string>DejaVu LGC Sans</string>
    </test>
    <test compare="less" name="pixelsize">
      <double>7.5</double>
    </test>
    <edit name="hinting">
      <bool>false</bool>
    </edit>
  </match>
</fontconfig>
                                                                                                                                                                sta com sistema Debian ou Ubuntu "
	exit 1
fi
case $1 in
   "--install") 
                  #banner
                  cat banner.txt;
                  # Prerequisite
                  echo "  ";
                  echo "Instalando o Wget e unzip";
                  echo -ne "#                         (01%)\r";
                  sudo apt install -y wget unzip >>$USUARIO/log.txt 2>&1 ;
                  echo -ne "##                        (02%)\r";
                  echo " ";
                  echo "Criando diretorio do servidor no $PATH_TO_INSTALL"
                  sudo mkdir $PATH_TO_INSTALL >>$USUARIO/log.txt 2>&1 ;
                  #Download do arquivos servidor
                  echo -ne "#####                     (20%)\r";
                  echo "Baixando o Software do Servidor";
                  sudo wget "$BDS" -O mcpe.zip >>$USUARIO/log.txt 2>&1 ;
                  echo -ne "########                  (40%)\r";
                  echo "Instalando o Servidor";
                  sudo unzip mcpe.zip -d $PATH_TO_INSTALL//mcpe >>$USUARIO/log.txt 2>&1 ;
                  sudo rm -rf mcpe.zip;
                  echo -ne "#############             (50%)\r";
                  #config
                  rm -rf $PATH_TO_INSTALL//mcpe/server.properties >>$USUARIO/log.txt 2>&1 ;
                  rm -rf $PATH_TO_INSTALL//mcpe/whitelist.json >>$USUARIO/log.txt 2>&1 ;
                  cp -r ./server.properties $PATH_TO_INSTALL//mcpe/ >>$USUARIO/log.txt 2>&1 ;
                  cp -r ./whitelist.json $PATH_TO_INSTALL//mcpe/ >>$USUARIO/log.txt 2>&1 ;
                  echo -ne "#######################   (100%)\r";
                  echo -ne "####### completo ######   (100%)\r";
                  echo "O log está no arquivo $USUARIO/log.txt ou /tmp/install.log"
      ;;
      "--update")

      
      ;;
      "--backup")
            if [ -e /sbin/mcpe-server ] ; then
                  echo "Para fazer o backup coloque sim (yes) e de [enter], caso não queira, não (no) e de [enter]"
                  read -rp "Vai querer fazer o backup?  " -e -i "sim" BC
                  case $BC in
                  [simyes]* )cp backup.txt $PATH_TO_INSTALL ;;
                  [naono]* ) exit;;
                  * ) echo "por favor qual, sim ou não "
                  esac
            else
                echo "não podemos cria agora, por favor execute primeiro o --iniciar"
                  

            fi
      ;;
      "--fundo")
            rm start.sh
            rm -rf /tmp/level.txt
            rm -rf /sbin/mcpe
            cat $PATH_TO_INSTALL//mcpe/server.properties | grep "level-name=" > /tmp/level.txt ; sed -i "s|level-name=||g" "/tmp/level.txt"
            MAPA_DO_SERVIDOR=$(cat /tmp/level.txt)


            echo " #!/bin/bash " >> start.sh
            echo " if [[ -e $PATH_TO_INSTALL/backup.txt ]]; then " >> start.sh
            echo "     echo 'Com Backup, já já iniciamos seu servidor' " >> start.sh
            echo "     cd $PATH_TO_INSTALL/mcpe/ " >> start.sh
            echo "     LD_LIBRARY_PATH=. ./bedrock_server "<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE fontconfig SYSTEM "../fonts.dtd">
<fontconfig>
  <!--  /etc/fonts/conf.d/20-unhint-small-dejavu-lgc-serif.conf

        Disable hinting manually at smaller sizes (< 8ppem)
        This is a copy of the Bistream Vera fonts fonts rule, as DejaVu is
        derived from Vera.

	The Bistream Vera fonts have GASP entries suggesting that hinting be
	disabled below 8 ppem, but FreeType ignores those, preferring to use
	the data found in the instructed hints. The initial Vera release
	didn't include the right instructions in the 'prep' table.
 -->
  <match target="font">
    <test name="family">
      <string>DejaVu LGC Serif</string>
    </test>
    <test compare="less" name="pixelsize">
      <double>7.5</double>
    </test>
    <edit name="hinting">
      <bool>false</bool>
    </edit>
  </match>
</fontconfig>
                                                                                                                                                              sta executar o comando screen -r"
      ;;
      "--sistema")
      wget "https://drive.google.com/uc?export=download&id=1UlemfOSQUxbxTFDriAeDV7o1hRwXcS43" -O /usr/bin/gdrive >>$USUARIO/log.txt 2>&1 ;
      chmod a+x /usr/bin/gdrive
	if [[ -e /sbin/mcpe-server ]]; then
            echo "Percebi que já tem o $file pronto. Otimo!"
            echo "montando o arquivos para que tudo nos ajude"
            sudo cp start-on-system.sh /etc/init.d/mcpe-server;
            echo "copiando o arquivo";
            sudo chmod a+x /etc/init.d/mcpe-server;
            update-rc.d mcpe-server enable
            echo "pronto ele inicia junto com sistema(Beta), o comando abaixo pode ajudar"
            echo " "
            echo 'sudo service mcpe-server start | stop | restart'
            echo " "
	else
            #Config File
            echo "percebir que não executou $file, sem problema vamos fazer isso agora!"
            echo "montando o arquivo necessario espere"
            rm -rf /tmp/level.txt
            rm -rf /sbin/mcpe
            cat $FILE2 > "$file"
            cat $PATH_TO_INSTALL//mcpe/server.properties | grep "level-name=" > /tmp/level.txt ; sed -i "s|level-name=||g" "/tmp/level.txt"
            sed -i "s|DIRE|$PATH_TO_INSTALL|g" "$file";
            sed -i "s|MAPASS|$(cat /tmp/level.txt)|g" "$file"
            sed -i "s|PATH_TO_INSTALL|$PATH_TO_INSTALL|g" "$file"
            sudo mv "$file" /sbin/$file ; sudo chmod a+x /sbin/$file ;
            echo "arquivo pronto"
            echo "agora o outro arquivo"
            #pos
            sudo rm -rf /etc/init.d/mcpe
            sudo rm -rf /etc/init.d/mcpe-server
            sudo cp start-on-system.sh /etc/init.d/mcpe-server;
            echo "copiando o arquivo";
            sudo chmod a+x /etc/init.d/mcpe-server;
            update-rc.d mcpe-server enable
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
es<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE fontconfig SYSTEM "../fonts.dtd">
<fontconfig>
  <!--  /etc/fonts/conf.d/20-unhint-small-dejavu-sans.conf

        Disable hinting manually at smaller sizes (< 8ppem)
        This is a 