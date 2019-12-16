#!/usr/bin/env bash

CURRENT_NODE_VERSION=8.9.4

# Install nodejs plugin
asdf plugin-add nodejs

# Install yarn plugin
asdf plugin-add yarn

# Add keys for nodejs
sh ~/.asdf/plugins/nodejs/bin/import-release-team-keyring

# Install current node version
asdf install nodejs $CURRENT_NODE_VERSION

# Set current node version as global version
asdf global nodejs $CURRENT_NODE_VERSION

