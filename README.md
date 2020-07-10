# Privacidade

Pelo amor de tudo, esse script não vai amazena a senha da sua conta do google, e o `Gdrive` foi copilado pelo e-mail que eu uso para o backup e uso pessoal, por problemas na minha conta comercial, ele terá um token que só acessar o google drive para backup do mapa, nada mais.

o Google auth fala que não é seguro, mais é um app do linux que acesssa o google drive que acessa e pode fazer Upload/Download de arquivos e ainda criar/apagas pastas, e ainda não foi verificado, o codigo fonte do Gdrive se encontra [Aqui](https://github.com/gdrive-org/gdrive).

# Antes de instalar olhe a Compatibilidade

    Por algum problema do meu script, no Ubuntu 20.0 o update.rc.d está dando algun problema mas o comando service ainda funciona, para que quiser use o Ubuntu 18.04 LTS que vai funcionar perfeitamente. Uma correção do script será feita mais rapida possivel.

    Debian 9 não foi testado, mais no Debian 10 está funcionando (Foi testado no Debian 10 com XFCE).

# Instalação do Minecraft Bedrock Server
Como foi feito para Ajudar na instalação do Minecraft Bedrock server para uma instalação de um simples linha do terminal.

por favor instale o **curl** para agilizar o instalador.

execute <code>sudo curl https://raw.githubusercontent.com/Sirherobrine23/Minecraft-Bedrock-auto-install/master/install.sh | bash ; cd installer</code>.

Este Script só agiliza a instalação do servidor para MCPE (Minecraft Bedrock).

atualmente opções para instalação:

    --install           | -i    - Instalação do BDS (Script Obrigatorio)
    --update            | -u    - Atualização do BDS (Opção quando houver uma atualização do Minecraft Bedrock)
    --backup            | -b    - Ativar o Backup do Mapa apos para o Servidor BDS (Opcional)
    --start-on-system   | -s    - Incializar o BDS a sistema iniciar e Deixar o BDS em segundo Plano (Script Obrigatorio)
    --ip                | -P    - Mostrar seu IPs
    --apache2 | --page  | -a    - Instalar o Apache2 para adicionar o Servidor ao acessae pelo Navegadores tipo o Chrome, Firefox ...
    --files             | -f    - Ativa acesso dos arquivos do Servidor via SMB (SAMBA) e FTP (VSFTPD)
    --update-script     | -u-s  - Atualizar o Script (Atualizações do script para correção de Bugs)
    --remover           | -r    - Remoção do Script, não será desistalado o BDS e outros programas já instalado