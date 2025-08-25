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
    npmig npkill

    success "'npkill' installed."

    info "Installing npm tool 'fkill'"
    
    # Install
    npmig fkill-cli

    success "'fkill' installed."       

    info "Installing npm tool 'npmrc'"
    
    # Install
    npmig npmrc

    success "'npmrc' installed."          

    info "Installing npm tool 'qnm'"
    
    # Install
    npmig qnm

    success "'qnm' installed."     
    
    info "Installing npm tool 'gemini'"

    # Install
    npmig @google/gemini-cli

    success "'@google/gemini-cli' installed."

    info "Installing npm tool 'task-master-ai'"

    # Install
    npmig task-master-ai

    success "'task-master-ai' installed."
    
    info "Installing npm tool 'repomix'"

    # Install
    npmig repomix 

    success "'repomix' installed."
}

execute() {
    install
}

execute  2>&1 | tee -a "$DOTFILE_LOG_FILE"