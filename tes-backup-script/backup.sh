#!/bin/bash
clear
rm log.txt
rm mcpe.zip
rm -rf mcpe/

#Debian - ubuntu
sudo apt install screen net-tools -y >>$USUARIO/log.txt 2>&1 ;

#Software
BDS="$(wget -qO- https://raw.githubusercontent.com/Sirherobrine23/Minecraft-Bedrock-auto-install/linux/Update.txt)"

#caminho da instalação e do backup
PATH_TO_INSTALL="/home/Minecraft"

#Usuario
USUARIO=./

#OLD

#NEW

                        #banner
                        #cat banner.txt;
                        
                        #Preparando



                        echo "Qual nome do Backup?"
                              read -rp "Backup:  " -e -i "$(TZ=UTC+3 date +"%d-%m-%Y")" BACKUP
                        echo "Por padrão é no /home/Minecraft-Backup, mais esse diretorio será a apagado depois mantendo os novos no $PATH_TO_INSTALL"
                              read -rp "Aonde vai ser o backup: " -e -i "/home/Minecraft-Backup" PATH_TO_BACKUP
                        echo "arquivos temporarios"
                              read -rp "A onde vai ser a pasta temporaria: " -e -i "./TMP_UPDATE" TMP_UPDATE
                              # Nome do mapa
                              cat "$PATH_TO_INSTALL//mcpe/server.properties" | grep "level-name=" > "$TMP_UPDATE/level.txt" ; sed -i "s|level-name=||g" "$TMP_UPDATE/level.txt" >>$USUARIO/log.txt 2>&1 ;
                              MAPA=$(cat $TMP_UPDATE/level.txt) >>$USUARIO/log.txt 2>&1 ;
                              echo " "
                              echo " "

                        #Criando
                        echo  "Pronto para Começa a atualizar"
                        sleep 2
                        echo  "Criando o diretorio";
                        sudo mkdir $PATH_TO_BACKUP >>$USUARIO/log.txt 2>&1 ;
                        sudo mkdir $PATH_TO_BACKUP/$BACKUP >>$USUARIO/log.txt 2>&1 ;     
                        sudo mkdir $TMP_UPDATE >>$USUARIO/log.txt 2>&1 ;       
                        
                        #copiando
                        echo  "Copiando para o Backup";
                        sudo cp -r "$PATH_TO_INSTALL//mcpe/worlds/$MAPA" "$PATH_TO_BACKUP/$BACKUP/worlds/$MAPA" >>$USUARIO/log.txt 2>&1 ;
                        sudo cp "$PATH_TO_INSTALL//mcpe/server.properties" "$PATH_TO_BACKUP/$BACKUP" >>$USUARIO/log.txt 2>&1 ;
                        sudo cp "$PATH_TO_INSTALL//mcpe/whitelist.json" "$PATH_TO_BACKUP/$BACKUP" >>$USUARIO/log.txt 2>&1 ;
                        
                        #Movendo versão antiga para $TMP_UPDATE
                        echo  "Movendo Versão antiga para o $TMP_UPDATE";
                        sudo mv $PATH_TO_INSTALL/mcpe/ $TMP_UPDATE >>$USUARIO/log.txt 2>&1 ;
                        
                        #Baixando
                        echo  "Baixando a nova versão"
                        sudo wget "$BDS" -O mcpe.zip >>$USUARIO/log.txt 2>&1 ;

                        #Extraindo
                        echo  "Extraindo a nova Versão"
                        sudo unzip -o mcpe.zip -d mcpe >>$USUARIO/log.txt 2>&1 ;
                        
                        sudo rm -rf ./mcpe/server.properties >>$USUARIO/log.txt 2>&1 ;
                        sudo rm -rf ./mcpe/whitelist.json >>$USUARIO/log.txt 2>&1 ;

                        echo "cpp"
                        sudo cp -r $PATH_TO_BACKUP/$BACKUP/$MAPA ./mcpe/worlds/$MAPA >>$USUARIO/log.txt 2>&1 ;
                        sudo cp $PATH_TO_BACKUP/$BACKUP/server.properties ./mcpe/ >>$USUARIO/log.txt 2>&1 ;
                        sudo cp $PATH_TO_BACKUP/$BACKUP/whitelist.json ./mcpe/ >>$USUARIO/log.txt 2>&1 ;

                        
                        #Preparando
                        echo  "Preparando nova versão"

                        #Pos
                        echo  "Removendo os arquivos baixados"
                        sudo rm -r mcpe.zip >>$USUARIO/log.txt 2>&1 ;
                        
                        #Criando Diretorios
                        sudo mkdir $PATH_TO_INSTALL >>$USUARIO/log.txt 2>&1 ;                        

                        #sudo rm -r $PATH_TO_BACKUP