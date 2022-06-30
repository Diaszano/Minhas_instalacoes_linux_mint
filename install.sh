#!/bin/bash
clear
# ---------------------------------------------------
sudo apt-get update -y
sudo apt-get upgrade -y 
sudo apt-get dist-upgrade -y 
# ---------------------------------------------------
clear
# ---------------------------------------------------
# Discord - https://discord.com/
# ---------------------------------------------------
nome=discord
pacote=$(dpkg --get-selections | grep "$nome" ) 
if [ -n "$pacote" ] ;
then echo
    echo "$nome ja esta instalado!"
    sleep 5
else echo
    echo "Instalando $nome"
    sudo apt update -y
    sudo apt upgrade -y
    wget "https://discord.com/api/download?platform=linux&format=deb" -O discord.deb
    sudo apt install ./discord.deb -y
    sudo rm discord.deb
    echo "Instalacao do $nome concluida"
    sleep 5
fi
# ---------------------------------------------------
clear
# ---------------------------------------------------
# Spotify - https://www.spotify.com/br/
# ---------------------------------------------------
nome=spotify
pacote=$(dpkg --get-selections | grep "$nome" ) 
if [ -n "$pacote" ] ;
then echo
    echo "$nome ja esta instalado!"
    sleep 5
else echo
    echo "Instalando $nome"
    curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add - 
    echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
    sudo apt-get update -y 
    sudo apt-get install $nome-client -y
    echo "Instalacao do $nome concluida"
    sleep 5
fi
# ---------------------------------------------------
clear
# ---------------------------------------------------
# Google Chrome - https://www.google.com/intl/pt-BR/chrome/
# ---------------------------------------------------
nome=google-chrome
pacote=$(dpkg --get-selections | grep "$nome" ) 
if [ -n "$pacote" ] ;
then echo
    echo "$nome ja esta instalado!"
    sleep 5
else echo
    echo "Instalando $nome"
    wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
    sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
    sudo apt-get update -y
    sudo apt install $nome-stable -y
    echo "Instalacao do $nome concluida"
    sleep 5
fi
# ---------------------------------------------------
clear
# ---------------------------------------------------
# DBeaver - https://dbeaver.io/
# ---------------------------------------------------
nome=dbeaver
pacote=$(dpkg --get-selections | grep "$nome" ) 
if [ -n "$pacote" ] ;
then echo
    echo "$nome ja esta instalado!"
    sleep 5
else echo
    echo "Instalando $nome"
    wget https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb
    sudo dpkg -i dbeaver-ce_latest_amd64.deb
    echo "Instalacao do $nome concluida"
    sleep 5
fi
# ---------------------------------------------------
clear
# ---------------------------------------------------
# Visual Studio Code - https://code.visualstudio.com/
# ---------------------------------------------------
nome=code
pacote=$(dpkg --get-selections | grep "$nome" ) 
if [ -n "$pacote" ] ;
then echo
    echo "$nome ja esta instalado!"
    sleep 5
else echo
    echo "Instalando $nome"
    sudo apt update
    sudo apt install software-properties-common apt-transport-https wget
    wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
    sudo apt-get install $nome -y
    echo "Instalacao do $nome concluida"
    sleep 5
fi
# ---------------------------------------------------
clear
# ---------------------------------------------------
# PYTHON 3.9 - https://www.python.org/
# ---------------------------------------------------
nome=python3.9
pacote=$(dpkg --get-selections | grep "$nome" ) 
if [ -n "$pacote" ] ;
then echo
    echo "$nome ja esta instalado!"
    sleep 5
else echo
    echo "Instalando $nome"
    sudo apt update && sudo apt upgrade -y
    sudo apt install software-properties-common -y
    sudo add-apt-repository ppa:deadsnakes/ppa
    sudo apt install python3.9 -y
    echo "Instalacao do $nome concluida"
    sleep 5
fi
# ---------------------------------------------------
clear
# ---------------------------------------------------
# PYTHON 3.10 - https://www.python.org/
# ---------------------------------------------------
nome=python3.10
pacote=$(dpkg --get-selections | grep "$nome" ) 
if [ -n "$pacote" ] ;
then echo
    echo "$nome ja esta instalado!"
    sleep 5
else echo
    echo "Instalando $nome"
    sudo apt update && sudo apt upgrade -y
    sudo apt install software-properties-common -y
    sudo add-apt-repository ppa:deadsnakes/ppa
    sudo apt install python3.10 -y
    echo "Instalacao do $nome concluida"
    sleep 5
fi
# ---------------------------------------------------
clear
# ---------------------------------------------------
# PIP - https://pypi.org/project/pip/
# ---------------------------------------------------
nome=pip
pacote=$(dpkg --get-selections | grep "$nome" ) 
if [ -n "$pacote" ] ;
then echo
    echo "$nome ja esta instalado!"
    sleep 5
else echo
    echo "Instalando $nome"
    sudo apt update && sudo apt upgrade -y
    sudo apt install python3-pip -y
    echo "Instalacao do $nome concluida"
    sleep 5
fi
# ---------------------------------------------------
clear
# ---------------------------------------------------
# PIPENV - https://pypi.org/project/pipenv/
# ---------------------------------------------------
nome=pipenv
pacote=$(dpkg --get-selections | grep "$nome" ) 
if [ -n "$pacote" ] ;
then echo
    echo "$nome ja esta instalado!"
    sleep 5
else echo
    echo "Instalando $nome"
    sudo apt update && sudo apt upgrade -y
    sudo apt install $nome -y
    echo "Instalacao do $nome concluida"
    sleep 5
fi
# ---------------------------------------------------
clear
# ---------------------------------------------------
# NODE JS - https://nodejs.org/en/
# ---------------------------------------------------
nome=nodejs
pacote=$(dpkg --get-selections | grep "$nome" ) 
if [ -n "$pacote" ] ;
then echo
    echo "$nome ja esta instalado!"
    sleep 5
else echo
    echo "Instalando $nome"
    curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
    sudo apt-get install -y $nome
    echo "Instalacao do $nome concluida"
    sleep 5
fi
# ---------------------------------------------------
clear
# ---------------------------------------------------
# NPM - https://www.npmjs.com/
# ---------------------------------------------------
nome=npm
pacote=$(dpkg --get-selections | grep "$nome" ) 
if [ -n "$pacote" ] ;
then echo
    echo "$nome ja esta instalado!"
    sleep 5
else echo
    echo "Instalando $nome"
    sudo apt-get install $nome -y
    echo "Instalacao do $nome concluida"
    sleep 5
fi
# ---------------------------------------------------
clear
# ---------------------------------------------------
# TMUX - https://github.com/tmux/tmux/wiki
# ---------------------------------------------------
nome=tmux
pacote=$(dpkg --get-selections | grep "$nome" ) 
if [ -n "$pacote" ] ;
then echo
    echo "$nome ja esta instalado!"
    sleep 5
else echo
    echo "Instalando $nome"
    sudo apt-get install $nome -y
    echo "Instalacao do $nome concluida"
    sleep 5
fi
# ---------------------------------------------------
clear
# ---------------------------------------------------
# PRELOAD - https://pt.wikipedia.org/wiki/Preload
# ---------------------------------------------------
nome=preload
pacote=$(dpkg --get-selections | grep "$nome" ) 
if [ -n "$pacote" ] ;
then echo
    echo "$nome ja esta instalado!"
    sleep 5
else echo
    echo "Instalando $nome"
    sudo apt-get install $nome -y
    sudo service preload restart
    echo "Instalacao do $nome concluida"
    sleep 5
fi
# ---------------------------------------------------
clear
# ---------------------------------------------------
# GIT - https://git-scm.com/
# ---------------------------------------------------
nome=git
pacote=$(dpkg --get-selections | grep "$nome" ) 
if [ -n "$pacote" ] ;
then echo
    echo "$nome ja esta instalado!"
    sleep 5
else echo
    echo "Instalando $nome"
    sudo apt-get install $nome -y
    echo "Instalacao do $nome concluida"
    sleep 5
fi
# ---------------------------------------------------
clear
# ---------------------------------------------------
# Insomnia - https://docs.insomnia.rest/
# ---------------------------------------------------
nome=insomnia
pacote=$(dpkg --get-selections | grep "$nome" ) 
if [ -n "$pacote" ] ;
then echo
    echo "$nome ja esta instalado!"
    sleep 5
else echo
    echo "Instalando $nome"
    sudo apt update && sudo apt upgrade -y
    echo "deb [trusted=yes arch=amd64] https://download.konghq.com/insomnia-ubuntu/ default all" | sudo tee -a /etc/apt/sources.list.d/insomnia.list
    sudo apt update && sudo apt upgrade -y
    sudo apt install $nome -y
    echo "Instalacao do $nome concluida"
    sleep 5
fi
# ---------------------------------------------------
clear
# ---------------------------------------------------
# RCLONE - https://rclone.org/
# ---------------------------------------------------
nome=rclone
pacote=$(dpkg --get-selections | grep "$nome" ) 
if [ -n "$pacote" ] ;
then echo
    echo "$nome ja esta instalado!"
    sleep 5
else echo
    echo "Instalando $nome"
    curl https://rclone.org/install.sh | sudo bash
    echo "Instalacao do $nome concluida"
    sleep 5
fi
# ---------------------------------------------------
clear
# ---------------------------------------------------
# Docker - https://www.docker.com/
# ---------------------------------------------------
nome=docker
pacote=$(dpkg --get-selections | grep "$nome" ) 
if [ -n "$pacote" ] ;
then echo
    echo "$nome ja esta instalado!"
    sleep 5
else echo
    echo "Instalando $nome"
    sudo apt update -y
    sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
    sudo apt update -y
    apt-cache policy docker-ce -y
    sudo apt install docker-ce -y
    sudo usermod -aG docker ${USER}
    sudo - ${USER}
    sudo usermod -aG docker username
    echo "Instalacao do $nome concluida"
    sleep 10
fi
# ---------------------------------------------------
clear
# ---------------------------------------------------
sudo apt-get update -y
sudo apt-get upgrade -y 
sudo apt-get dist-upgrade -y 
# ---------------------------------------------------
clear
# ---------------------------------------------------
sudo apt autoremove -y
# ---------------------------------------------------
clear
# ---------------------------------------------------
exit