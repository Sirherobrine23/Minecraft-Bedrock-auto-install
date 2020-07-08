# Privacidade

Pelo amor de tudo, esse script não vai amazena a senha da sua conta do google, e o `Gdrive` foi copilado pelo e-mail que eu uso para o backup e uso pessoal, por problemas na minha conta comercial, ele terá um token que só acessar o google drive para backup do mapa, nada mais.

o Google auth fala que não é seguro, mais é um app do linux que acesssa o google drive que acessa e pode fazer Upload/Download de arquivos e ainda criar/apagas pastas, e ainda não foi verificado, o codigo fonte do Gdrive se encontra [Aqui](https://github.com/gdrive-org/gdrive).

# Instalação do Minecraft Bedrock Server

Como foi feito para Ajudar na instalação do Minecraft Bedrock server para uma instalação de um simples linha do terminal.

por favor instale o **curl** para agilizar o instalador.

execute <code>sudo curl https://raw.githubusercontent.com/Sirherobrine23/Minecraft-Bedrock-auto-install/master/install.sh | bash ; cd installer</code>.

Este Script só agiliza a instalação do servidor para MCPE (Minecraft Bedrock).

atualmente opções para instalação:

    --install  | --Instalação | --instalacao | --Install     - instalação do BDS
    ---update  | --Atualizar  | --Update     | --Update      - Atualização do BDS (BETA)
    --backup   | --Backup                                    - Ativar backups (BETA)
    --System   | --Sistema    | --system     | --sistema     - Adiciona um script para iniciar junto com sistema pelo service (BETA)
    --fundo    | --Fundo      | --Backgroud  | --background  - Adiciona um arquivo para "screen mcpe"
    --ip       | --Ip         | --IP         | --pi          - Mostre seu IPs Disponiveis Localmente e externo
    --Apache2  | apache2      | --Page       | --page        - Adicionar uma pagina para adicionar o servidor em um click
    --unistall | --remover                                   - remove a pasta installer