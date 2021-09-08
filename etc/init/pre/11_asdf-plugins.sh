#!/bin/bash
# echo "DEPRECATED"
# exit 0

# MAIN
#

# activate
. $HOME/.asdf/asdf.sh

# plugin dependencies
sudo apt install -y dirmngr gpg curl gawk

# add plugins
asdf plugin add python
asdf plugin add golang

# install latest versions
asdf install python latest

asdf install golang latest
asdf reshim golang

# set global version
asdf global python latest
asdf global golang latest