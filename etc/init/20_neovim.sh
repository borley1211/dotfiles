#!bash
echo ""
echo "** RUNNING $(basename $0) **"

if ! type "nvim" "nvim.appimage" &>/dev/null; then
    mkdir -p "${HOME}/.local/bin"
    curl -o "$HOME/.local/bin/nvim" -LO https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
    chmod u+x $HOME/.local/bin/nvim
    echo "Installed nvim(as appimage)!"
else
    echo "You MUST install neovim manually."
fi

echo "** FINISHED **"
exit 0
