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

    info "Removing ASDF"
    brew uninstall asdf
}

_add() {
    # ---------------------------------------------
    # Install new tools
    # ---------------------------------------------

    info "Add step"

    info "Install MISE"
    brew install mise

    info "Install libyaml"
    brew install libyaml
}

_configure() {
    # ---------------------------------------------
    # Install new tools
    # ---------------------------------------------

    info "Configure step"

    info "Configure MISE"
    . "$DOTFILES_FOLDER"/configure/mise-config.sh

    info "Remove .tools-version and .envrc files"
    rm "$HOME"/.tools-version
    rm "$HOME"/.envrc
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