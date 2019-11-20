#!/bin/bash
source ${DOTPATH:-~/Dotfiles}/etc/install

init_alsa() {
    sudo apt-get -o APT::Install-Suggests=true install alsa-base alsa-firmware alsa-utils alsamixer libasound2-dev -y
    sudo gpasswd -a ${USER} audio 
    sudo systemctl daemon-reload
    sudo systemctl enable --now alsa-utils
}

logexec init_alsa
