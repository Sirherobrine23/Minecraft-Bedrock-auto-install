#!/bin/bash
cd DIRE/mcpe/
LD_LIBRARY_PATH=. ./bedrock_server
echo 'Fazendo backup do mapa'
cd worlds/ ; zip $(TZ=UTC+3 date +"%d-%m-%Y-%H-%M-%S")-"MAPASS".zip -r "MAPASS"
desc=$(TZ=UTC+3 date +"%d-%m-%Y-%H-%M-%S")
cd backup ; git add . ; git commit -m "$desc" ; git push
exit 1