#!/usr/bin/env bash

# Install nodejs plugin
asdf plugin-add nodejs

# Add keys for nodejs
sh ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
