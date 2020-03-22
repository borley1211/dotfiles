source ${DOTPATH:-~/Dotfiles}/etc/install

init_cargo_pkgs() {
    source ~/.cargo/env
    cargo install cargo-update topgrade
    cargo install starship && ( echo 'eval $( starship init zsh )' >> "$HOME/.zshrc" )
}

logexec init_cargo_pkgs || exit
