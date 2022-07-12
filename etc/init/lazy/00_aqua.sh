#!/bin/bash
# echo "DEPRECATED"
# exit 0

# MAIN
#
if [ ! -d "$HOME/.local/bin/aqua" ]; then
    curl -sSfL \
    https://raw.githubusercontent.com/aquaproj/aqua-installer/v0.6.0/aqua-installer |
    bash -s -- -i ~/.local/bin/aqua
else
    echo "aqua is already exists."
fi
