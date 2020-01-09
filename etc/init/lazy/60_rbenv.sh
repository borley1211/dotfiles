#!/bin/bash
source "${DOTPATH:-~/Dotfiles}/etc/install"

init_rbenv() {
    export PATH="$HOME/.rbenv/bin:$PATH"
    
    if ! [ -d "$HOME/.rbenv" ]; then
        git clone https://github.com/rbenv/rbenv.git ~/.rbenv
        ~/.rbenv/bin/rbenv init

        source ~/.bashrc

        curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash
    else
        log_fail "rbenv is already exists."
    fi
    
    source ~/.bashrc

    if ! [ -d "$HOME/.rbenv/plugins/ruby-build" ]; then
         mkdir -p "$(rbenv root)/plugins"
         git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
    fi
}

logexec init_rbenv
exit 0
