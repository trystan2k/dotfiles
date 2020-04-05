#!/usr/bin/env bash

# Load helper functions
#shellcheck source=/dev/null
source "$DOTFILES_FOLDER"/lib/functions

# Update brew
info "Update Brew"
brew update

# Upgrade brew
info "Upgrade Brew"
brew upgrade

# Update brew casks
info "Update brew casks"
brew cask upgrage

# Cleanup
info "Cleanup"
brew cleanup