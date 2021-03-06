#!/usr/bin/env bash

# dotfiles folder
DOTFILES_FOLDER="$(pwd | grep -o '.*dotfiles')"

# Load helper functions
#shellcheck source=/dev/null
source "$DOTFILES_FOLDER/lib/functions"

install() {

    info "Installing npm tool 'fkill'"
    
    # Install
    npm install --global fkill-cli

    success "'fkill' installed."        
}

execute() {
    install
}

execute  2>&1 | tee -a "$DOTFILE_LOG_FILE"