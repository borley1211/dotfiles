# shellcheck disable=SC2139,SC2148
alias relogin="exec $SHELL -l"
alias reshell="exec $SHELL"

function gogh() {
    bash -c "$(curl -fsSL https://git.io/vQgMr)"
}
##test
# gogh

alias edit="$EDITOR"
