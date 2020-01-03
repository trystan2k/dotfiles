#!/usr/bin/env bash

# Load helper functions
source $DOTFILES_FOLDER/configure/functions

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