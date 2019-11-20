#!/bin/bash
source ${DOTPATH:-~/Dotfiles}/etc/install

update_and_upgrade() {
    apt-get update
    apt-get upgrade -y
}

su - <<EOSU
logexec update_and_upgrade
EOSU
