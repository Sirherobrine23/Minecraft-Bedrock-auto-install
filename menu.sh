#!/bin/bash

if [[ -e /etc/debian_version ]]; then
	source /etc/os-release
	OS=$ID # debian or ubuntu
else
	echo "Você não tem instalado ou não esta com sistema Debian ou Ubuntu "
	exit 1
fi
if [ "$(uname -m)" = "x86_64" ];then
    echo "Processador (X64) AMD64, continuando"
else
    echo "Seu processador não é uma AMD64 (X64) ele é um $(uname -m)"
    exit 1
fi

REMOVE=$(pwd)

#Usuario
USUARIO=$(echo $HOME)

#Root
if [ "$EUID" -ne 0 ]; then
	echo "Você não está executando o script com root ou sudo"
	exit 0
fi
if [[ $OS == 'ubuntu' ]]; then
    echo "Ubuntu detectado instalando algumas recomendações espere ..."
       apt install screen unzip dos2unix jq zip net-tools -y >>$USUARIO/log.txt 2>&1 ;
elif [[ $OS == 'debian' ]]; then
	 apt install screen unzip zip dos2unix jq net-tools -y >>$USUARIO/log.txt 2>&1 ;
else
      exit 1
fi


#pode ser aqui ali ou DEBIAN
TMP=/home/Minecraft-temp
 mkdir $TMP >>$USUARIO/log.txt 2>&1 ;

# Remoção dos arquivo de log
 rm -rf $TMP/level.txt >>$USUARIO/log.txt 2>&1 ;

echo "o Diretorio do seu usuario é $USUARIO"
echo "Começamos ás $(TZ=UTC+3 date +"%H:%M:%S")"
echo " "
echo "--------------"
echo " "

# --------------- Codigo ------------------------------


variaveis_predefinidas(){
BDS="$(wget -qO- https://script.sirherobrine23.org/BDS.txt)"
echo "Atualmente temos os sequinte link download: $BDS"

if [[ -e installed.txt ]]; then
      PATH_TO_INSTALL="$(cat installed.txt)" 
      echo "Depois voçê pode alterar o diretorio no arquivo 'installed.txt'"
      echo " "
      echo " "
else
      read -rp "a onde vai ser instalado: " -e -i "/home/minecraft" PATH_TO_INSTALL
      touch installed.txt -a $PATH_TO_INSTALL
      echo "$PATH_TO_INSTALL" >> installed.txt
      echo " "
      echo " "
fi

cat $PATH_TO_INSTALL/server.properties | grep "level-name=" > /tmp/level.txt ; sed -i "s|level-name=||g" "/tmp/level.txt"
    level=$(dos2unix /tmp/port.txt;cat /tmp/level.txt)
    read -rp "Qual é o nome do Mapa (Só confimação do nome): " -e -i "$level" MAPA_DO_SERVIDOR
    cat $PATH_TO_INSTALL/server.properties | grep "server-port=" > /tmp/port.txt ; sed -i "s|server-port=||g" "/tmp/port.txt"
    PORTAD=$(dos2unix /tmp/port.txt;cat /tmp/port.txt)

}

json(){
     PATH_TO_INSTALL="$(cat install.json | jq ".install.dir" | sed 's|"||g')"
     BDS="$(wget -qO- $(cat install.json | jq ".global.url_download" | sed 's|"||g'))"
     PORTAD="$(cat install.json | jq ".global.port" | sed 's|"||g')"
     MAPA_DO_SERVIDOR="$(cat install.json | jq ".global.name_map" | sed 's|"||g')"
     level="$(cat install.json | jq ".global.name_map" | sed 's|"||g')"
}

# Usando arquivo json

if [[ -e install.json ]];then
json
else
variaveis_predefinidas
fi

installbysh23(){
    
    
    #banner
    cat banner.txt;
    # Prerequisite
    echo "  ";

    #Download do arquivos servidor
    echo "Baixando o Software do Servidor";
     wget "$BDS" -O mcpe.zip >>$USUARIO/log.txt 2>&1 ;

    echo "Instalando o Servidor";
     unzip mcpe.zip -d mcpe/ >>$USUARIO/log.txt 2>&1 ;
     rm -rf mcpe.zip;

    #config
    echo "Configuração Base"
    rm -rf mcpe/server.properties >>$USUARIO/log.txt 2>&1 ;
    rm -rf mcpe/whitelist.json >>$USUARIO/log.txt 2>&1 ;
    cp -r ./server.properties mcpe/ >>$USUARIO/log.txt 2>&1 ;
    cp -r ./whitelist.json mcpe/ >>$USUARIO/log.txt 2>&1 ;

    #Movendo
    echo "Movendo para o $PATH_TO_INSTALL"
    rm -rf $PATH_TO_INSTALL
    mkdir $PATH_TO_INSTALL
    cp -r mcpe/* $PATH_TO_INSTALL/
    echo "Limpando alguns arquivos"
    rm -rf mcpe/
    echo "O log está no arquivo $USUARIO/log.txt"
}
updatebysh23(){
    
    
    
    cat banner.txt
        #Preparando
        echo " "
        echo "Backup?"
        read -rp "Nome do backup:  " -e -i "$(TZ=UTC+3 date +"%d-%m-%Y")" BACKUP
        echo " "
        PATH_TO_BACKUP="~/MCPE-BACKUP";echo "$PATH_TO_BACKUP"
        echo " "
        TMP_UPDATE="~/mcpe-update";echo $TMP_UPDATE
        PATHBACKUP="$(cd ~/;pwd)/mcpe-Backup";echo $PATHBACKUP
 	# separação dos arquivos
        echo "-------------------------------"
        mkdir "$TMP_UPDATE"
        #---------------------------------------------------------------------------------------------------------
        cat "$PATH_TO_INSTALL/server.properties" | grep "level-name=" >> "$TMP_UPDATE/level.txt" ;
        sed -i "s|level-name=||g" "$TMP_UPDATE/level.txt"
        MAPA=$(cat $TMP_UPDATE/level.txt) >>$USUARIO/log.txt 2>&1 ;
        #---------------------------------------------------------------------------------------------------------
        echo " "
        echo " "

        echo "verificando se a arquivos antingos no $(pwd)"
        if [[ -d mcpe/ ]]; then
        rm -rf mcpe/
        fi
        if [[ -e mcpe.zip ]];then
        rm -rf mcpe.zip
        fi

        #copia
        cp -rf "$PATH_TO_INSTALL/" "$PATH_TO_BACKUP"

        zip "$PATHBACKUP/$BACKUP-2".zip -r "$PATH_TO_INSTALL/"

        #copia de seguraça
        mkdir "$PATH_TO_BACKUP/"
        mkdir "$PATHBACKUP/"
        zip  "$PATHBACKUP/$BACKUP".zip -r "$PATH_TO_INSTALL/"

        if [[ -d $PATH_TO_INSTALL/ ]];then
        rm -rf $PATH_TO_INSTALL/
        fi

        #baixar a nova versão
        wget "$BDS" -O mcpe.zip
        unzip mcpe.zip -d mcpe

        #removendo alguns arquivos
        rm -r mcpe/server.properties
        rm -r mcpe/whitelist.json

        # Movendo para o temp
        mv $PATH_TO_INSTALL/ /tmp/

        #copiar mundo e as configuraçoe
        cp -r "$PATH_TO_BACKUP/worlds" "mcpe/"
        cp "$PATH_TO_BACKUP/server.properties" "mcpe/"
        cp "$PATH_TO_BACKUP/whitelist.json" "mcpe/"

        #movendo
        mkdir $PATH_TO_INSTALL/
        cp -rf mcpe/* $PATH_TO_INSTALL/

        #remover arquivos antigos
        rm mcpe.zip
        rm -rf mcpe/
        rm -rf $PATH_TO_BACKUP
        rm -rf $TMP_UPDATE
}
backupbysh23(){
      
      if [ -e /usr/sbin/BDS ] ; then
      echo "Para fazer o backup coloque sim (yes) e de [enter], caso não queira, não (no) e de [enter]"
      read -rp "Vai querer fazer o backup?  " -e -i "sim" BC
            case $BC in
            sim | yes ) touch $PATH_TO_INSTALL/backup.txt -a $PATH_TO_INSTALL ; echo "Vamos configurar agora o Gdrive, precisamos fazer um login na sua conta do google. nenhum dado será amarzenado pelo script." ; sleep2 ; gdrive about  ;;
            nao | no ) exit;;
            * ) echo "não houve escolha, saindo ..."; exit
            esac
      else
      echo "não podemos cria agora, por favor execute primeiro o --fundo"
      fi
}
ipbysh23(){
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
}
apache2-installbysh23(){

      #Instalação do apache2
      echo "Instalando o Apache2"
       apt update >> /dev/null 2>&1 
       apt install apache2 -y >> /dev/null 2>&1 

      # Removendo pasta HTML e Adicionando denovo
      rm -rf /var/www/html/
      mkdir /var/www/html/

      # Pegando as config
      echo "Agora vamos começar a configurar o nova pagina do Apache"
      sleep 2
      echo "Vamos precicar de algumas informações como:"
      echo "Dominio caso você tenha"
      echo "nome que aparacera na Pagina. etc ..."
      sleep 3
      
      read -rp "Qual será o dominio ou nos da o IP publico: " -e -i "$(wget -qO- http://ipecho.net/plain)" IPDOMAIN
      read -rp "Qual é o nome que aparacera na pagina: " -e -i "$(cat /tmp/level.txt)" MAINSERVERNAME

      # Montando as Configurações
      sed -i "s|ENDEREÇODOSERVIDOROUIP|$IPDOMAIN|g" "./html-files/index.html"
      sed -i "s|MAINSERVERNAME|$MAPA_DO_SERVIDOR|g" "./html-files/index.html"
      sed -i "s|PORTASERVER|$PORTAD|g" "./html-files/index.html"

      # Movendo as configurações
      cp -rf ./html-files/* /var/www/html/
}
externobysh23(){
      
      # vsftp and Samba
       apt install -y vsftpd samba >> /dev/null 2>&1 ;

      #config
      sed -i "s|PATHTOISNTALL|$PATH_TO_INSTALL|g" "./smb.conf"
      sed -i "s|root||g" "/etc/ftpusers"

      rm /etc/samba/smb.conf
      cp -rf ./smb.conf /etc/samba/
      cp -rf ./vsftp.conf /etc/vsftpd.conf

      service smbd restart
      service vsftpd restart

echo "Para adicionar um usuario no Smb use smbpasswd -a username"
echo "Para usar o ftp não precisar de nada a mais para configura só ter um usuario no sistema"

}

#

fundobysh23(){
    echo " "
        rm /usr/sbin/BDS
        rm -rf /tmp/level.txt
        rm -rf /sbin/mcpe
        rm -rf /usr/sbin/BDS
        rm -rf /usr/sbin/mcpe
        
            # -- Config --
                cp fundo.sh /tmp/
                MINE2Sh23="/home/MCPE-Backups"
                read -rp "Qual é o ID da pasta no google Drive caso fará backup para A Nuven (Exemplo: 1-FWzQJWhhJK_00ETU4uVOg6R5c5p_yMP)? " -e -i "" ID
                read -rp "Aonde você vai quere colocar os Backups Locais (Caso queira)? " -e -i "$MINE2Sh23" MINE2Sh23
                mkdir $MINE2Sh23
                sed -i "s|ID|$ID|g" "/tmp/fundo.sh";
                sed -i "s|MINE|$PATH_TO_INSTALL|g" "/tmp/fundo.sh";
                sed -i "s|NAME|$MAPA_DO_SERVIDOR|g" "/tmp/fundo.sh";
                sed -i "s|2MINESh23|$MINE2Sh23|g" "/tmp/fundo.sh";
                cp -rf /tmp/fundo.sh /usr/sbin/BDS
                 chmod a+x /usr/sbin/BDS
            # -- Config --
    echo " "
}
sistemabysh23(){
      
      wget "https://drive.google.com/uc?export=download&id=1UlemfOSQUxbxTFDriAeDV7o1hRwXcS43" -O /usr/bin/gdrive >>$USUARIO/log.txt 2>&1 ;
      chmod a+x /usr/bin/gdrive

# ---------------------------------------    
    echo " "
        rm -rf /usr/sbin/mcpe-server
            rm -rf /sbin/mcpe-server
            rm -rf /sbin/BDS
        rm -rf /usr/sbin/BDS
        rm -rf /tmp/level.txt
        
            # -- Config --
                cp fundo.sh /tmp/
                MINE2Sh23="/var/www/html"
                
                if [[ -e IDs.txt ]];then
                ID="$(cat IDs.txt)"
                else
                    read -rp "Qual é o ID da pasta no google Drive caso fará backup para A Nuven (Exemplo: 1-FWzQJWhhJK_00ETU4uVOg6R5c5p_yMP)? " -e -i "" ID
                    echo "$ID" > IDs.txt
                    dos2unix IDs.txt
                fi
                if [[ -e pasta.txt ]];then
                    MINE2Sh23="$(cat ~/pasta.txt)"
                else
                    read -rp "Aonde você vai quere colocar os Backups Locais (Caso queira)? " -e -i "$MINE2Sh23" MINE2Sh23
                    echo $MINE2Sh23 > pasta.txt
                    dos2unix pasta.txt
                fi
                mkdir $MINE2Sh23
                sed -i "s|IDSh23|$ID|g" "/tmp/fundo.sh";
                sed -i "s|MINESh23|$PATH_TO_INSTALL|g" "/tmp/fundo.sh";
                sed -i "s|NAMESh23|$MAPA_DO_SERVIDOR|g" "/tmp/fundo.sh";
                sed -i "s|MINE2Sh23|$MINE2Sh23|g" "/tmp/fundo.sh";
                cp -rf /tmp/fundo.sh /usr/sbin/BDS
                 chmod a+x /usr/sbin/BDS
            # -- Config --
    echo " "
    



    # ---------------------------------------

    echo "Iniciando as Configurações do arquivo para Inicialização junto com o Sistema"
         cp start-on-system.sh /tmp/systemsh23.sh;
            sed -i "s|IDSh23|$ID|g" "/tmp/systemsh23.sh";
            sed -i "s|MINESh23|$PATH_TO_INSTALL|g" "/tmp/systemsh23.sh";
            sed -i "s|NAMESh23|$MAPA_DO_SERVIDOR|g" "/tmp/systemsh23.sh";
            sed -i "s|MINE2Sh23|$MINE2Sh23|g" "/tmp/systemsh23.sh";
         cp "/tmp/systemsh23.sh" "/etc/init.d/BDS";
    echo "copiando o arquivo";
         chmod a+x /etc/init.d/BDS;
        update-rc.d BDS defaults
        update-rc.d BDS enable
    echo "pronto ele inicia junto com sistema, o comando abaixo pode ajudar"
    echo " "
    echo ' service BDS start|stop|restart'
    echo " "
    echo "Para desativar o Inicio altomatico execute $0 --remover-service ou  $0 -R"
    echo "Para quem quiser iniciar manualmente:"
    echo "Execute 'screen BDS'"
    echo "E para deixar o servidor em segundo plano aperte CRTL + A + D. deixara em segundo plano para voltar basta executar o comando screen -r"
}
#
removerservicesh23(){
update-rc.d BDS defaults-disabled
update-rc.d BDS disable
rm -rf /etc/init.d/BDS
}
#
script-update(){
      curl https://script.sirherobrine23.org/BDS-Script.sh | bash
}
crontabsh23(){


read -rp "Por favor nos informe uma data via crontab!(Exemplo 0 23 * * *, voce tamém pode usar o https://crontab.guru/#0_23_*_*_*) " -e -i "0 23 * * *" CRON
mkdir /bc/
#                 
if [[ -e IDs.txt ]];then
ID="$(cat IDs.txt)"
else
    read -rp "Qual é o ID da pasta no google Drive caso fará backup para A Nuven (Exemplo: 1-FWzQJWhhJK_00ETU4uVOg6R5c5p_yMP)? " -e -i "" ID
    echo "$ID" > IDs.txt
    dos2unix IDs.txt
fi
if [[ -e pasta.txt ]];then
    MINE2Sh23="$(cat pasta.txt)"
else
    read -rp "Aonde você vai quere colocar os Backups Locais (Caso queira)? " -e -i "$MINE2Sh23" MINE2Sh23
    echo $MINE2Sh23 > pasta.txt
    dos2unix pasta.txt
fi
mkdir $MINE2Sh23
cp -rf backup-mcpe.sh /tmp/backup.sh
sed -i "s|IDSh23|$ID|g" "/tmp/fundo.sh";
sed -i "s|MINESh23|$PATH_TO_INSTALL|g" "/tmp/backup.sh";
sed -i "s|NAMESh23|$MAPA_DO_SERVIDOR|g" "/tmp/backup.sh";
sed -i "s|MINE2Sh23|$MINE2Sh23|g" "/tmp/backup.sh";
rm -rf /bc/backup-mcpe.sh
cp -rf /tmp/backup.sh /bc/backup-mcpe.sh
# 
echo "adiciona essa linha a seguir no crontab"
echo "$CRON bash /bc/backup-mcpe.sh"
read -rp "De [ENTER] para continua" -e -i "" NULL
crontab -e
}


# Escolha --------------  ***  -----------
case $1 in
--install | -i )  installbysh23 ;;
--update | -u ) updatebysh23 ;;
--backup | -b ) backupbysh23 ;;
--start-on-system | -s ) sistemabysh23 ;;
--ip | -P ) ipbysh23 ;;
--apache2 | --page | -a ) apache2-installbysh23 ;;
--files | -f ) externobysh23 ;;
--update-script | -ds ) script-update ;;
--remover-service | -R ) removerservicesh23 ;;
--crontab | -c ) crontabsh23 ;;
--remover | -r )  rm -rf "$REMOVE";;
--help | -h ) cat help.txt ; echo " ";;
--teste ) echo "$0 $1 $2 $3 $4 $5";;
*) echo "Exeute $0 --help - o comando $0 $1 não existe aqui";echo " "
esac



# --------------- Codigo ------------------------------

echo " "
echo "--------------"
echo " "
echo "qualquer erro no script me comunique no https://github.com/Sirherobrine23/Minecraft-Bedrock-auto-install/issues"
echo "Terminamos as $(TZ=UTC+3 date +"%H:%M:%S")"
 rm -rf mcpe.zip
echo " "
