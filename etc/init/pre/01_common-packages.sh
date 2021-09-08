#!/bin/bash
# echo "DEPRECATED"
# exit 0

# MAIN
#

COMMON_PKGS=( "ripgrep" "zfs-fuse" "fontconfig" "vim" "aptitude" "fonts-noto-cjk-extra" "nautilus" "llvm" )

sudo apt install -y "${COMMON_PKGS[@]}"