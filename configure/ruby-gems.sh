#!/usr/bin/env bash

# dotfiles folder
DOTFILES_FOLDER="$(cd -P ..; pwd)"

# Load helper functions
source $DOTFILES_FOLDER/lib/functions

_configureColorLs() {

    info "Installing gem 'colorls'"
    
    # Install
    gem install colorls

    success "'colorls' gem installed."        
}

execute() {
    _configureColorLs
}

execute  2>&1 | tee -a $DOTFILE_LOG_FILE