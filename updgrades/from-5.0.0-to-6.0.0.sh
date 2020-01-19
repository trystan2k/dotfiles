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

    info "Install fx tool"
    . $DOTFILES_FOLDER/tools/fx.sh

    info "Install ASDF Direnv plugin and set it to global"
    asdf plugin-add direnv
    asdf install direnv 2.20.0
    asdf global direnv 2.20.0
}

_configure() {
    # ---------------------------------------------
    # Install new tools
    # ---------------------------------------------

    info "Configure step"

    info "Execute symlinks"
    . $DOTFILES_FOLDER/scripts/symlinks.sh

    info "Configure ASDF Direnv plugin"
    . $DOTFILES_FOLDER/configure/direnv-config.sh
}

_cleanup () {
    # ---------------------------------------------
    # Cleanup and finish
    # ---------------------------------------------

    info "Cleanup step"

}

execute() {
    _remove
    _add
    _configure
    _cleanup
}

execute 2>&1 | tee -a $DOTFILE_LOG_FILE