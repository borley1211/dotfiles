#!/bin/bash
source "${DOTPATH:-~/Dotfiles}/etc/install"

init_rbenv() {
    if ! [ -d "~/.rbenv" ]; then
        git clone https://github.com/rbenv/rbenv.git ~/.rbenv
        ~/.rbenv/bin/rbenv init

        source "~/.bashrc"
        curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash
    else
        log_fail "rbenv is already exists."
    fi
}

log_exec init_rbenv
exit 0
