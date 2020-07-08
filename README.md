# Instalação do Minecraft Bedrock Server no Linux (Ubuntu/Debian)

Como foi feito para Ajudar na instalação do Minecraft Bedrock server para uma instalação de um simples linha do terminal.

por favor instale o **curl** para agilizar o instalador. execute 
```
sudo curl https://raw.githubusercontent.com/Sirherobrine23/Minecraft-Bedrock-auto-install/Instalador/Linux-install.sh | bash ; cd installer
```

---

# Instalação do Minecraft Bedrock para Windows (Windows 10)

#### Descontinuado mas será reescrito para ser executado em powershell

Execute o seguinte comando no cmd.

```
curl https://raw.githubusercontent.com/Sirherobrine23/Minecraft-Bedrock-auto-install/Instalador/Windows-Install.cmd | cmd
```

---

# No linux temos as sequintes opções

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
#### Testado no ubuntu e no debian não sei se vai funciona em outras distros que utilizam o apt.
