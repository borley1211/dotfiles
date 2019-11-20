#!/bin/bash
source ${DOTPATH}/etc/install

init_prezto() {
    if [ ! "$(command -v zsh)" == "1" ]; then # if zsh exists
        # echo "zsh exists!"
        if [ ! -d ${ZDOTDIR:-$HOME}/.zprezto ]; then
            zsh -c "git clone --recursive https://github.com/sorin-ionescu/prezto.git ${ZDOTDIR:-$HOME}/.zprezto && setopt EXTENDED_GLOB; for rcfile in ${ZDOTDIR:-$HOME}/.zprezto/runcoms/^README.md(.N); do; ln -sv $rcfile ${ZDOTDIR:-$HOME}/.${rcfile:t}; done"
        else
            echo "NOTICE: Prezto is already exists."
        fi
    else
        echo "ERROR: You MUST run me again, after installing ZSH."
    fi
}

logexec init_prezto
