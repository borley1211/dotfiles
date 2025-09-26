#!/bin/bash
# shellcheck disable=1091

# echo "DEPRECATED"
# exit 0

# MAIN
#

# activate
source "$HOME"/.asdf/asdf.sh

# plugin dependencies
sudo apt install -y dirmngr gpg curl gawk

# add plugins
asdf plugin add python
asdf plugin add golang

# install latest versions

# Python
install_python_by_asdf() {
    # - dependencies
    sudo apt install -y build-essential libbz2-dev libdb-dev \
        libreadline-dev libffi-dev libgdbm-dev liblzma-dev \
        libncursesw5-dev libsqlite3-dev libssl-dev \
        zlib1g-dev uuid-dev tk-dev
    asdf install python latest
    asdf reshim python
    asdf global python latest
}
install_python_by_asdf

# Golang
install_golang_by_asdf() {
    asdf install golang latest
    asdf reshim golang
    asdf global golang latest
}
install_golang_by_asdf
