#!/usr/bin/bash
source "../install"

init_alsa() {
    if can_use_sudo; then
        sudo apt-get -o APT::Install-Suggests=true install alsa-base alsa-firmware alsa-source alsa-utils alsamixer libasound2-dev -y
        sudo gpasswd -a ${USER} audio
        sudo systemctl daemon-reload
        sudo systemctl enable --now alsa-utils
    else
        apt-get -o APT::Install-Suggests=true install alsa-base alsa-firmware alsa-utils alsamixer libasound2-dev -y
        gpasswd -a ${USER} audio
        systemctl daemon-reload
        systemctl enable --now alsa-utils
    fi
}

logexec init_alsa
