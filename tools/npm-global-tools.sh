#!/usr/bin/env bash

# dotfiles folder
DOTFILES_FOLDER="$(pwd | grep -o '.*dotfiles')"

# Load helper functions
#shellcheck source=/dev/null
source "$DOTFILES_FOLDER/lib/functions"

install() {

    info "Enabling corepack"

    corepack enable

    success "corepack enabled"

    info "Installing npm tool 'npkill'"

    # Install
    npm install --global npkill

    success "'npkill' installed."

    info "Installing npm tool 'fkill'"
    
    # Install
    npm install --global fkill-cli

    success "'fkill' installed."       

    info "Installing npm tool 'npmrc'"
    
    # Install
    npm install --global npmrc

    success "'npmrc' installed."          

    info "Installing npm tool 'qnm'"
    
    # Install
    npm install --global qnm

    success "'qnm' installed."      
}

execute() {
    install
}

execute  2>&1 | tee -a "$DOTFILE_LOG_FILE"