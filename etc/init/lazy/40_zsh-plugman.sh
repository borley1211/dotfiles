#!/bin/bash
# shellcheck disable=2154,1090,2016

# echo "DEPRECATED"
# exit 0

# MAIN
#

init_zshrc() {
    if [[ -f "$HOME/.zshrc" ]]; then
        : >"$HOME/.zshrc" # 初期化

        {
            echo '# Load my rcs'
            echo 'source "$HOME/.zshrc.local"'
            echo 'source "$HOME/.zaliases"'
            echo ''
        } >>"$HOME/.zshrc"
    fi
}

init_prezto() {
    if [ ! "$(command -v zsh)" == "1" ]; then # if zsh exists
        # echo "zsh exists!"
        if [ ! -d "${ZDOTDIR:-$HOME}"/.zprezto ]; then
            zsh -c "git clone --recursive https://github.com/sorin-ionescu/prezto.git ${ZDOTDIR:-$HOME}/.zprezto && setopt EXTENDED_GLOB; for rcfile in ${ZDOTDIR:-$HOME}/.zprezto/runcoms/^README.md(.N); do; ln -sfv $rcfile ${ZDOTDIR:-$HOME}/.${rcfile:t}; done"
        else
            echo "NOTICE: Prezto is already exists."
        fi
    else
        echo "ERROR: You MUST run me again, after installing ZSH."
    fi
    init_zshrc
}

init_zi() {
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/z-shell/zi/master/doc/install.sh)"

    echo '# Load zi'
    echo 'source "$DOTPATH/zirc.zsh"' >>"$HOME/.zshrc"
    echo '' >>"$HOME/.zshrc"
}

init_sheldon() {
    source ~/.cargo/env
    cargo install sheldon

    {
        echo '# Load sheldon'
        echo 'eval "$(sheldon source)"'
        echo ''
    } >>"$HOME/.zshrc"
}

init_zshrc
init_zi
# init_sheldon
