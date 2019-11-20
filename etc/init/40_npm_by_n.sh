#!/usr/bin/bash
source "../install"

init_npm_by_n() {
    if ! type "n" >/dev/null; then
        curl -L https://git.io/n-install | bash
        exec ${SHELL:-/usr/bin/bash}
    else
        log_info "It seems you've already installed n and npm. Exit."
    fi
    n lts
    npm --version
    npm install npm
    npm update
}
