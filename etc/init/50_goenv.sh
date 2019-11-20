#!/bin/bash
source "${DOTPATH:-${HOME}/Dotfiles}/etc/install"

install_goenv() {
    git clone https://github.com/syndbg/goenv.git ~/.goenv
}

logexec install_goenv
