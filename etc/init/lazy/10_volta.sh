#!/bin/bash
# echo "DEPRECATED"
# exit 0

# MAIN
#

curl https://get.volta.sh | bash
volta install node
volta completions zsh > ~/.zfunc/_volta
