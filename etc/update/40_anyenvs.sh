#!/bin/bash
source ${DOTPATH:-~/Dotfiles}/etc/install

update_envs() {
    ENVDIRS=("${HOME}/.goenv" "${HOME}/.rbenv")

    for ENV in ${ENVDIRS};
    do
        cd "$ENV" || exit
        git fetch
        git pull
        cd || exit
    done
}

logexec update_envs || exit
