#!/usr/bin/env bash

# Specific setups for MacOS system

# dotfiles folder
DOTFILES_FOLDER="$(pwd | grep -o '.*dotfiles')"

# Load helper functions
#shellcheck source=/dev/null
source "$DOTFILES_FOLDER"/lib/functions

execute() {

    info "Cleanup will start"

    # update
    info "Update/Upgrade Brew"
    brew update
    brew upgrade

    info "Cleanup Brew"
    brew cleanup -s

    # now diagnotic
    info "Diagnostic Brew"
    brew doctor --verbose
    brew missing

}

execute  2>&1 | tee -a "$DOTFILE_LOG_FILE"