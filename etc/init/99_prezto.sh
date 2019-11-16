#!/usr/bin/bash
echo ""
echo "** RUNNING $(basename $0) **"

if [ ! "$(command -v zsh)" == "1" ]  # if zsh exists
then
    # echo "zsh exists!"
    if [ ! -d ${ZDOTDIR:-$HOME}/.zprezto ]; then
        zsh -c "git clone --recursive https://github.com/sorin-ionescu/prezto.git '${ZDOTDIR:-$HOME}/.zprezto' && setopt EXTENDED_GLOB; for rcfile in '${ZDOTDIR:-$HOME}'/.zprezto/runcoms/^README.md(.N); do; ln -sv '$rcfile' '${ZDOTDIR:-$HOME}/.${rcfile:t}'; done"
    else
        echo "NOTICE: Prezto is already exists."
    fi
else
    echo "ERROR: You MUST run me again, after installing ZSH."
fi

echo "** FINISHED **"
exit 0
