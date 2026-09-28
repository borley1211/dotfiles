# shellcheck disable=SC2148
alias relogin='exec $SHELL -l'
alias reshell='exec $SHELL'

function gogh() {
    bash -c "$(curl -fsSL https://git.io/vQgMr)"
}
##test
# gogh

alias edit='$EDITOR'

function destyle-ansi() {
    # destyle-ansi - Trim ANSI Control Sequence from text
    #   Source - https://stackoverflow.com/a/30938702
    #   Posted by sandy_1111, modified by community. See post 'Timeline' for change history
    #   Retrieved 2025-12-05, License - CC BY-SA 3.0

    sed -r \
        -e 's/\x1B\[[0-9;?]*[ -\/]*[@-~]//g' \
        -e 's/\x1B\][^\x1B]*\x1B\\//g' \
        -e 's/\x1B[P^_][^\x1B]*\x1B\\//g' \
        "$@"
}
