# Privacidade

Pelo amor de tudo, esse script não vai amazena a senha da sua conta do google, e o `Gdrive` foi copilado pelo e-mail que eu uso para o backup e uso pessoal, por problemas na minha conta comercial, ele terá um token que só acessar o google drive para backup do mapa, nada mais.

o Google auth fala que não é seguro, mais é um app do linux que acesssa o google drive que acessa e pode fazer Upload/Download de arquivos e ainda criar/apagas pastas, e ainda não foi verificado, o codigo fonte do Gdrive se encontra [Aqui](https://github.com/gdrive-org/gdrive).

# Instalação do Minecraft Bedrock Server

Como foi feito para Ajudar na instalação do Minecraft Bedrock server para uma instalação de um simples linha do terminal.

por favor instale o **curl** para agilizar o instalador.

execute <code>sudo curl https://raw.githubusercontent.com/Sirherobrine23/Minecraft-Bedrock-auto-install/master/install.sh | bash ; cd installer</code>.

Este Script só agiliza a instalação do servidor para MCPE (Minecraft Bedrock).

atualmente opções para instalação:

    --install   | --Instalação* | --instalacao* | --Install*    | -i | -I   - Instalação do BDS
    --update*   | --Atualizar*  | --Update*     | --Update*     | -u | -U   - Atualização do BDS
    --backup*   | --Backup*     | -b            | -B                        - Ativar o Backup do Mapa apos para o Servidor
    --System    | --Sistema     | --system      | --sistema     | -S | -s   - Incializar o BDS a sistema iniciar (BETA)
    --fundo*    | --Fundo*      | --Backgroud*  | --background* | -f | -F   - Deixar o BDS em segundo Plano (Exencial)
    --ip | --Ip | --IP          | --pi          | -p            | -P        - Mostrar seu IPs
    --Apache2   | apache2       | --Page        | --page        | -a | -A   - Instalar o Apache2 para adicionar o Servidor ao acessae pelo Navegador de Internet
    --externo   | -e            | -E                                        - Ativa acesso dos arquivos do Servidor via smb (SAMBA) e Ftp (VSFTPD)
    --script    | --Script      | -S            | -s                        - Atualizar o Script (BETA)
    --unistall  | --remover     | -r            | -R                        - Remoção do Script, não será desistalado o BDS e outros programas já instalado