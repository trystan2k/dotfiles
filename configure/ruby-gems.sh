#!/usr/bin/env bash

# dotfiles folder
DOTFILES_FOLDER="$(pwd | grep -o '.*dotfiles')"

# Load helper functions
#shellcheck source=/dev/null
source "$DOTFILES_FOLDER/lib/functions"

_configureColorLs() {

    info "Installing gem 'colorls'"
    
    # Install
    gem install colorls

    success "'colorls' gem installed."        
}

execute() {
    _configureColorLs
}

execute  2>&1 | tee -a "$DOTFILE_LOG_FILE"