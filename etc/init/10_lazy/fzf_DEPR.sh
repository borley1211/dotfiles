#!/bin/bash
echo "DEPRECATED"
exit 0

# MAIN
#
if [ ! -d "$HOME/.fzf" ]; then
    git clone https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
else
    echo "fzf is already exists."
fi
