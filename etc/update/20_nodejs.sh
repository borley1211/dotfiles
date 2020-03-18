#!/bin/bash
source ${DOTPATH:-~/Dotfiles}/etc/install

update_node_and_npm() {
    cd ~/ || return
    n lts
    npm install npm
    npm install
    npm update --depth=20
    npm audit fix
    npm dedupe
    npm doctor
}

logexec update_node_and_npm || exit
