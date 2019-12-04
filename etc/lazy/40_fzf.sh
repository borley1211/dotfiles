#!/bin/bash
source ${DOTPATH:-~/Dotfiles}/etc/install

init_fzf() {
    if [ ! -d "$HOME/.fzf" ]; then
        git clone https://github.com/junegunn/fzf.git ~/.fzf
        ~/.fzf/install
    else
        echo "fzf is already exists."
    fi
}

logexec init_fzf
exit 0
