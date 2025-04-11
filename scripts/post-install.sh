#!/usr/bin/env bash

# dotfiles folder
DOTFILES_FOLDER="$(pwd | grep -o '.*dotfiles')"

# Load helper functions
#shellcheck source=/dev/null
source "$DOTFILES_FOLDER"/lib/functions
#shellcheck source=/dev/null
source "$DOTFILES_FOLDER"/symlinks/.exports

# ---------------------------------------------
# Post Install process
# ---------------------------------------------

postinstall() {
    
    info "Install NPM global tools"
    if ask_question 'Do you want to install NPM global tools?'; then
        #shellcheck source=/dev/null
        . "$DOTFILES_FOLDER"/tools/npm-global-tools.sh
    fi   
}

execute() {
    postinstall
}

execute