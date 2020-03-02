#!/bin/bash
source ${DOTPATH:-~/Dotfiles}/etc/install

install_zsh() {
    sudo apt-get install zsh -y
    chsh -s /bin/zsh
}

logexec install_zsh
exit 0
