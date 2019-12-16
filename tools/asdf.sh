#!/usr/bin/env bash

# Add keys for nodejs
sh ~/.asdf/plugins/nodejs/bin/import-release-team-keyring

# Install nodejs plugin
asdf plugin-add nodejs
