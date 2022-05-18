#!/bin/bash
clear
# ---------------------------------------------------
sudo apt-get update -y
sudo apt-get upgrade -y 
sudo apt-get dist-upgrade -y 
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
    sudo apt install python3-pip -y
    echo "Instalacao do $nome concluida"
    sleep 5
fi
# ---------------------------------------------------
clear
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
    sudo apt-get install $nome -y
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
sudo apt autoremove -y
# ---------------------------------------------------
clear
# ---------------------------------------------------
exit