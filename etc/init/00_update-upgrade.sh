#!/usr/bin/bash
source ../install

update_and_upgrade() {
    if can_use_sudo; then
        sudo apt-get update
        sudo apt-get upgrade -y
    else
        apt-get update
        apt-get upgrade -y
    fi
}

logexec update_and_upgrade
