#!/bin/bash
source ${DOTPATH:-~/Dotfiles}/etc/install

install_zsh() {
    sudo apt-get install zsh chsh -y
}

logexec install_zsh
