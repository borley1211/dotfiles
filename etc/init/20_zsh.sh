#!/usr/bin/bash
source ../install

install_zsh() {
    if can_use_sudo; then
        sudo apt-get install zsh chsh -y
    else
        apt-get install zsh chsh -y
    fi
}

logexec install_zsh
