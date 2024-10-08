#!/usr/bin/env bash

# Export dotfiles folder
DOTFILES_FOLDER="$(pwd | grep -o '.*dotfiles')"

#shellcheck source=/dev/null
source "$DOTFILES_FOLDER"/symlinks/.exports

# Load functions
#shellcheck source=/dev/null
source "$DOTFILES_FOLDER"/lib/functions

_remove() {
    # ---------------------------------------------
    # Uninstall not needed anymore
    # ---------------------------------------------

    info "Remove step"
    brew uninstall --ignore-dependencies node

    info "Removing Hiddeb Bar"
    brew uninstall hiddenbar
}

_add() {
    # ---------------------------------------------
    # Install new tools
    # ---------------------------------------------

    info "Add step"

    info "Install Ice"
    brew install jordanbaird-ice
}

_configure() {
    # ---------------------------------------------
    # Install new tools
    # ---------------------------------------------

    info "Configure step"

    info "Configure new Symlinks"
    . "$DOTFILES_FOLDER"/scripts/symlinks.sh
}

_cleanup () {
    # ---------------------------------------------
    # Cleanup and finish
    # ---------------------------------------------

    info "Cleanup step"

    #shellcheck source=/dev/null
    . "$DOTFILES_FOLDER"/macos/cleanup.sh
}

execute() {
    _remove
    _add
    _configure
    _cleanup
}

execute 2>&1 | tee -a "$DOTFILE_LOG_FILE"