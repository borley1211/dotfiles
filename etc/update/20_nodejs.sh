#!/bin/bash
source ${DOTPATH:-~/Dotfiles}/etc/install

update_node_and_npm() {
    cd ~/ || return
    n lts
    npm install npm
    npm install
}

logexec update_node_and_npm
exit 0
