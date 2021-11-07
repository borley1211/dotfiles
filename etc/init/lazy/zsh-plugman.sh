#!/bin/bash
# echo "DEPRECATED"
# exit 0

# MAIN
#

init_zshrc() {
    if [[ -f "$HOME/.zshrc" ]]; then
        : > "$HOME/.zshrc"  # 初期化

        echo '# Load my rcs' >> "$HOME/.zshrc"
        echo 'source "$HOME/.zshrc.local"' >> "$HOME/.zshrc"
        echo 'source "$HOME/.zaliases"' >> "$HOME/.zshrc"
        echo '' >> "$HOME/.zshrc"
    fi
}

init_prezto() {
    if [ ! "$(command -v zsh)" == "1" ]; then # if zsh exists
        # echo "zsh exists!"
        if [ ! -d ${ZDOTDIR:-$HOME}/.zprezto ]; then
            zsh -c "git clone --recursive https://github.com/sorin-ionescu/prezto.git ${ZDOTDIR:-$HOME}/.zprezto && setopt EXTENDED_GLOB; for rcfile in ${ZDOTDIR:-$HOME}/.zprezto/runcoms/^README.md(.N); do; ln -sfv $rcfile ${ZDOTDIR:-$HOME}/.${rcfile:t}; done"
        else
            echo "NOTICE: Prezto is already exists."
        fi
    else
        echo "ERROR: You MUST run me again, after installing ZSH."
    fi
    init_zshrc
}

init_zinit() {
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"

    echo '# Load zinit'
    echo 'source "$DOTPATH/zinitrc.zsh"' >> "$HOME/.zshrc"
    echo '' >> "$HOME/.zshrc"
}

init_sheldon() {
    source ~/.cargo/env
    cargo install sheldon

    echo '# Load sheldon' >> "$HOME/.zshrc"
    echo 'eval "$(sheldon source)"' >> "$HOME/.zshrc"
    echo '' >> "$HOME/.zshrc"
}

init_zshrc
init_sheldon
