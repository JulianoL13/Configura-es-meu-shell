#!/bin/bash


MENU() {
PS3="└──> Menu : "
options=(
    "1 - Configurar alias"
    "2 - Mostrar comandos alterados/criados"
    "3 - Sair"
)
select opt in "${options[@]}"
do
    case $opt in
        "1 - Configurar alias")
            CONFIG_BASH
            ;;
        "2 - Mostrar comandos alterados/criados")
            SHOWCMDS
            ;;
        "3 - Sair")
            exit 0
            ;;
        *)
            echo "Opção inválida: $REPLY"
            ;;
    esac
done

    }


CONFIG_BASH() {
    #Configurando dependências
    echo -e "\031[34mDeseja instalar as dependências? (Y/n)"
    read resposta

    if [ -z "$resposta" ] || [ "$resposta" != "${resposta#[SsYy]}" ] ;then
        echo "Instalando dependências..."
        sudo apt install git
        sudo apt install exa
        sudo apt install bat
    else
        echo "Pulando a instalação das dependências..."
    fi    

    #Configurando o bash
    touch ~/alias.txt
    chmod 777 ~/alias.txt
    echo -e "# Git\nalias g='git'\nalias gck='git checkout'\nalias gst='git status'\nalias gps='git push'\nalias gpl='git pull'\nalias gcm='git commit'\n# Shell\nalias ls='exa --icons'\nalias cat='bat'\nalias find='fd'\nalias grep='rg'\nalias ps='procs'\nalias mkdir='mkdir -pv'\nalias ips='ip -c -br a'\n### Distros baseadas em debian\nalias upd='sudo apt update && sudo apt upgrade'" >> ~/alias.txt

    if [ -f ~/.bashrc ]; then
        echo "source ~/alias.txt" >> ~/.bashrc
    elif [ -f ~/.bash_profile ]; then
        echo "source ~/alias.txt" >> ~/.bash_profile
    elif [ -f ~/.zshrc ]; then
        echo "source ~/alias.txt" >> ~/.zshrc
    else
        echo "Nenhum arquivo de perfil do Bash encontrado."
    fi
    echo "Tudo pronto. Aproveite seus novos Alias!"
}


SHOWCMDS() {
echo -e "\033[34m# Git"
echo -e "\033[34malias g='git'"
echo -e "\033[34malias gck='git checkout'"
echo -e "\033[34malias gst='git status'"
echo -e "\033[34malias gps='git push'"
echo -e "\033[34malias gpl='git pull'"
echo -e "\033[34malias gcm='git commit'"

echo -e "\033[34m# Shell"
echo -e "\033[34malias ls='exa --icons'"
echo -e "\033[34malias cat='bat'"
echo -e "\033[34malias find='fd'"
echo -e "\033[34malias grep='rg'"
echo -e "\033[34malias ps='procs'"
echo -e "\033[34malias mkdir='mkdir -pv'"
echo -e "\033[34malias ips='ip -c -br a'"

echo -e "\033[34m### Distros baseadas em debian"
echo -e "\033[34malias upd='sudo apt update && sudo apt upgrade'"
}

###Início###

clear 
echo -e "\033[34mSegue abaixo um script que estou desenvolvendo para facilitar a utilização de sistemas Linux, principalmente para iniciantes"
echo -e "\033[34mRelembrando que esses comandos são focados em distros baseadas em Debian. Planejo fazer uma versão para o Arch em breve"
echo -e "\033[34mRepositório: https://github.com/JulianoL13/Configura-es-meu-shell.git"
