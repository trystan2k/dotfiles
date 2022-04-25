#!/usr/bin/env bash

# Export dotfiles folder
DOTFILES_FOLDER="$(pwd | grep -o '.*dotfiles')"

# Load helper functions
#shellcheck source=/dev/null
source "$DOTFILES_FOLDER"/lib/functions

# Update brew
info "Update Brew"
brew update

# Upgrade brew
info "Upgrade Brew"
brew upgrade

# Cleanup
info "Cleanup"
brew cleanup