#!/usr/bin/env bash

# Export dotfiles folder
DOTFILES_FOLDER="$(cd -P ..; pwd)"

source $DOTFILES_FOLDER/symlinks/.exports
source $DOTFILES_FOLDER/lib/functions

# Load functions
source $DOTFILES_FOLDER/lib/functions

_remove() {
    # ---------------------------------------------
    # Uninstall not needed anymore
    # ---------------------------------------------

    info "Remove step"
}

_add() {
    # ---------------------------------------------
    # Install new tools
    # ---------------------------------------------

    info "Add step"   
}

_configure() {
    # ---------------------------------------------
    # Install new tools
    # ---------------------------------------------

    info "Configure step"

    info "Backup current ZSH History file"
    mv "${HOME}/.zsh_history" "${HOME}/.zsh_history_bad"
}

_cleanup () {
    # ---------------------------------------------
    # Cleanup and finish
    # ---------------------------------------------

    info "Cleanup step"

    . $DOTFILES_FOLDER/macos/cleanup.sh
}

execute() {
    _remove
    _add
    _configure
    _cleanup
}

execute 2>&1 | tee -a $DOTFILE_LOG_FILE