
clear co
echo "Segue abaixo alguns comandos que eu utilizo no meu arquivo Alias"
echo "Relembrando que esses comandos são focados em distros baseadas em Debian. Planejo fazer uma versão para o Arch em breve"

echo "# Git"
echo "alias g='git'"
echo "alias gck='git checkout'"
echo "alias gst='git status'"
echo "alias gps='git push'"
echo "alias gpl='git pull'"
echo "alias gcm='git commit'"

echo "# Shell"
echo "alias ls='exa --icons'"
echo "alias cat='bat'"
echo "alias find='fd'"
echo "alias grep='rg'"
echo "alias ps='procs'"
echo "alias mkdir='mkdir -pv'"
echo "alias ips='ip -c -br a'"

echo "### Distros baseadas em debian"
echo "alias upd='sudo apt update && sudo apt upgrade'"
  

#Instalar algumas dependências
echo -e "\033[34mDeseja instalar as dependências? (s/n)"
read resposta

if [ "$resposta" != "${resposta#[Ss]}" ] ;then
    echo "Instalando dependências..."
    sudo apt install git
    sudo apt install exa
    sudo apt install bat
else
    echo "Pulando a instalação das dependências..."
fi


#configurar bash
touch ~/alias.txt
chmod 777 ~/alias.txt
echo -e "# Git\nalias g='git'\nalias gck='git checkout'\nalias gst='git status'\nalias gps='git push'\nalias gpl='git pull'\nalias gcm='git commit'\n# Shell\nalias ls='exa --icons'\nalias cat='bat'\nalias find='fd'\nalias grep='rg'\nalias ps='procs'\nalias mkdir='mkdir -pv'\nalias ips='ip -c -br a'\n### Distros baseadas em debian\nalias upd='sudo apt update && sudo apt upgrade'" >> ~/alias.txt

if [ -f ~/.bashrc ]; then
    echo "source ~/alias.txt" >> ~/.bashrc
elif [ -f ~/.bash_profile ]; then
    echo "source ~/alias.txt" >> ~/.bash_profile
else
    echo "Nenhum arquivo de perfil do Bash encontrado."
fi

echo "Tudo pronto. Aproveite seus novos Alias!"
