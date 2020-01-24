#!/bin/bash
source ${DOTPATH:-~/Dotfiles}/etc/install

update_pkgs() {
    sudo aptitude-curses update
    sudo aptitude-curses full-upgrade --full-resolver
}

logexec update_pkgs || exit
