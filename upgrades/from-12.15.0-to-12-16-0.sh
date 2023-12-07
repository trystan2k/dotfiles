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

    info "Uninstall meetingbar"
    brew uninstall meetingbar

    info "Uninstall overkill"
    brew uninstall overkill

    info "Uninstall unclack"
    brew uninstall unclack

    info "Uninstall caffeine"
    brew uninstall caffeine
}

_add() {
    # ---------------------------------------------
    # Install new tools
    # ---------------------------------------------

    info "Add step"

    info "Install orbstack"
    brew install orbstack
}

_configure() {
    # ---------------------------------------------
    # Install new tools
    # ---------------------------------------------

    info "Configure step"
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