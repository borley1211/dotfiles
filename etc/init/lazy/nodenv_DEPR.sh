#!/bin/bash
echo "DEPRECATED"
exit 0

# MAIN
#
VERSION="12.16.2"
nodenv install "$VERSION"
nodenv rehash
nodenv global "$VERSION"
git clone https://github.com/nodenv/node-build-update-defs.git "$(nodenv root)"/plugins/node-build-update-defs
