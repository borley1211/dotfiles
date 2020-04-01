#!/bin/bash
source ${DOTPATH:-~/Dotfiles}/etc/install

init_npm_by_n() {
    if ! type "n" >/dev/null; then
        curl -L https://git.io/n-install | bash
    else
        log_info "It seems you've already installed n and npm. Exit."
    fi
    export PATH="${HOME}/n/bin:${PATH}"
    cd ~
    n lts
    npm --version
    npm install npm -g
    npm update
    npm doctor
    npm dedupe
    npm audit fix
}

#logexec init_npm_by_n || exit
