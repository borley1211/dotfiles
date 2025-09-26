#!/bin/bash
# echo "DEPRECATED"
# exit 0

# MAIN
#
install_dein() {
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Shougo/dein-installer.vim/master/installer.sh)"
    # For example, we just use `~/.cache/dein` as installation directory
    # if [ ! -d ~/.cache/dein ]; then
    #     sh ./installer.sh ~/.cache/dein
    # fi
    # rm ./installer.sh
}

install_dep_neovim() {
    pip install neovim vim-vint
}

# install_dein
install_dep_neovim
