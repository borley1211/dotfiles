#!/bin/bash
source ${DOTPATH:-~/Dotfiles}/etc/install

update_and_upgrade() {
    sudo apt-get update
    sudo apt-get upgrade -y
}

logexec update_and_upgrade
exit 0
