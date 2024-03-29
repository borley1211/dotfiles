#!/bin/bash
# echo "DEPRECATED"
# exit 0

# MAIN
#
install_neovim_as_appimage() {
    if ! type "nvim" "nvim.appimage" &>/dev/null; then
        if is_linux; then
            mkdir -p "${HOME}/.local/bin"
            curl -o "${HOME}/.local/bin/nvim" -LO https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
            chmod u+x "${HOME}"/.local/bin/nvim
            log_pass "Installed nvim(as appimage)!"
        else # is_mac
            brew install neovim
            log_pass "Installed nvim!"
        fi
    else
        log_info "Have you already installed NeoVim?"
        log_info "If NO, You MUST install NeoVim manually."
    fi
}

install_neovim_from_ppa() {
    sudo add-apt-repository ppa:neovim-ppa/stable -y
    sudo apt upgrade -y
    sudo apt install neovim -y

}

install_neovim_from_ppa
