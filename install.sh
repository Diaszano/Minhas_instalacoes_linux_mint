#!/bin/bash
# ------------------------------------------------------------------------- #
#                                                                           #
# Autor:        Lucas Dias                                                  #
# CO-Autor:     Dionatan Simioni                                            #
# Referência:   https://github.com/Diolinux/pop-os-postinstall              #
#                                                                           #
# ------------------------------------------------------------------------- #
# ----------------------------- VARIÁVEIS --------------------------------- #
# CORES
VERMELHO='\e[1;91m'
VERDE='\e[1;92m'
SEM_COR='\e[0m'
# DEB SOFTWARES
PROGRAMAS_DEB=(
    virtualbox
    gparted
    vlc
    code
    git
    ubuntu-restricted-extras
    software-properties-common
    apt-transport-https
    ca-certificates
    preload
    pipenv
    curl
    python3.8
    python3.9
    python3.10
    nodejs
    npm
    tmux
    insomnia
    docker-compose
    qbittorrent
)
PROGRAMAS_FLATPAK=(
    com.obsproject.Studio
    org.gimp.GIMP
    com.spotify.Client
    org.telegram.desktop
    org.gnome.Boxes
    org.qbittorrent.qBittorrent
)
# LINKS
URL_DISCORD="https://discord.com/api/download?platform=linux&format=deb"
URL_DBEAVER="https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb"
URL_CHROME="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
# ------------------------------ FUNÇÕES ---------------------------------- #
system_update(){
    sudo apt update -y
}

system_upgrade(){
    system_update
    sudo apt dist-upgrade -y
}

system_clean(){
    system_upgrade -y
    flatpak update -y
    sudo apt autoclean -y
    sudo apt autoremove -y
}

verificar_internet(){
    if ! ping -c 1 8.8.8.8 -q &> /dev/null; then
        echo -e "${VERMELHO}[ERROR] - Seu computador"\
                "não tem conexão com a Internet."\
                "Verifique a rede.${SEM_COR}"
        exit 1
    else
        echo -e "${VERDE}[INFO] - Conexão com a Internet"\
                "funcionando normalmente.${SEM_COR}"
    fi
}

install_pre-requisitos(){
    system_upgrade
    sudo apt install wget -y
    # Discord
    wget -c "$URL_DISCORD" -O "discord.deb" 
    # DBeaver
    wget -c "$URL_DBEAVER" -O "dbeaver.deb" 
    # Google Chrome
    wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
    sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
    system_update
    # Visual Studio Code
    wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
    system_update
    # PYTHON
    sudo apt install software-properties-common -y
    sudo add-apt-repository ppa:deadsnakes/ppa
    system_update
    # NODE JS 
    curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
    system_update
    # Insomnia 
    echo "deb [trusted=yes arch=amd64] https://download.konghq.com/insomnia-ubuntu/ default all" | sudo tee -a /etc/apt/sources.list.d/insomnia.list
    system_update
    # Docker
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
    system_update
    apt-cache policy docker-ce -y
    system_update
    # Qbittorrent
    sudo add-apt-repository ppa:qbittorrent-team/qbittorrent-stable -y
    system_update
}

pos-install(){
    # Docker
    sudo usermod -aG docker ${USER}
    sudo - ${USER}
    sudo usermod -aG docker username
    # PRELOAD
    sudo service preload restart
    # 
    system_clean
    # 
    rm -r *.deb
}

install_apps(){
    verificar_internet
    install_pre-requisitos
    # Instalando pacotes .deb baixados na sessão anterior ##
    echo -e "${VERDE}[INFO] - Instalando pacotes .deb baixados${SEM_COR}"
    sudo dpkg -i *.deb -y

    # Instalar programas no apt
    echo -e "${VERDE}[INFO] - Instalando pacotes apt do repositório${SEM_COR}"

    for nome_do_programa in ${PROGRAMAS_DEB[@]}; do
        if ! dpkg -l | grep -q $nome_do_programa; then
            sudo apt install "$nome_do_programa" -y
        else
            echo "[INSTALADO] - $nome_do_programa"
        fi
    done

    # Instalar programas no Flatpak
    echo -e "${VERDE}[INFO] - Instalando pacotes Flatpak${SEM_COR}"

    for nome_do_programa in ${PROGRAMAS_FLATPAK[@]}; do
        flatpak install "$nome_do_programa" -y
    done

    # PIP
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
    # Google Chrome
    nome=google-chrome
    pacote=$(dpkg --get-selections | grep "$nome" ) 
    if [ -n "$pacote" ] ;
    then echo
        echo "$nome ja esta instalado!"
        sleep 5
    else echo
        echo "Instalando $nome"
        sudo apt install $nome-stable -y
        echo "Instalacao do $nome concluida"
        sleep 5
    fi
    # Install Rclone 
    curl https://rclone.org/install.sh | sudo bash
    # 
    pos-install
    clear
}
# ---------------------------------------------------
install_apps
## finalização
echo -e "${VERDE}[INFO] - Script finalizado, instalação concluída! :)${SEM_COR}"
