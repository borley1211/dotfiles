#!/bin/bash
# echo "DEPRECATED"
# exit 0

# MAIN
#

# clone
git clone https://github.com/asdf-vm/asdf.git ~/.asdf
# recommends for asdf
sudo apt install -y automake autoconf libreadline-dev libncurses-dev libssl-dev libyaml-dev libxslt-dev libffi-dev libtool unixodbc-dev
# link completions
ln -s ~/.asdf/completions/_asdf ~/.zfunc/
