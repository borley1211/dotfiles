#!/bin/bash
# echo "DEPRECATED"
# exit 0

# MAIN
#

PKGS=("ripgrep" "zfs-fuse" "fontconfig" "vim" "aptitude" "nautilus" "llvm" "synaptic" "jq")

sudo apt install -y "${PKGS[@]}"
