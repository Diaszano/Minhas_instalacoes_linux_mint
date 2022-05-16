#!/bin/bash
clear
# ---------------------------------------------------
sudo apt-get update -y
sudo apt-get upgrade -y 
sudo apt-get dist-upgrade -y 
# ---------------------------------------------------
clear
# ---------------------------------------------------
nome=preload
pacote=$(dpkg --get-selections | grep "$nome" ) 
if [ -n "$pacote" ] ;
then echo
    echo "$nome ja esta instalado!"
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
nome=git
pacote=$(dpkg --get-selections | grep "$nome" ) 
if [ -n "$pacote" ] ;
then echo
    echo "$nome ja esta instalado!"
else echo
    echo "Instalando $nome"
    sudo apt-get install $nome -y
    echo "Instalacao do $nome concluida"
    sleep 5
fi
# ---------------------------------------------------
clear
# ---------------------------------------------------
nome=rclone
pacote=$(dpkg --get-selections | grep "$nome" ) 
if [ -n "$pacote" ] ;
then echo
    echo "$nome ja esta instalado!"
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