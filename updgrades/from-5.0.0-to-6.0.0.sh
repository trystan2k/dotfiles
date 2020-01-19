#!/usr/bin/env bash

# Load functions
source $DOTFILES_FOLDER/lib/functions

_remove() {
    # ---------------------------------------------
    # Uninstall not needed anymore
    # ---------------------------------------------
}

_add() {
    # ---------------------------------------------
    # Install new tools
    # ---------------------------------------------

    info "Install fx tool"
    . $DOTFILES_FOLDER/tools/fx.sh

    info "Install ASDF Direnv plugin and set it to global"
    asdf install direnv 2.20.0
    asdf global direnv 2.20.0
}

_configure() {
    # ---------------------------------------------
    # Install new tools
    # ---------------------------------------------

    info "Configure ASDF Direnv plugin"
    . $DOTFILES_FOLDER/configre/direnv-config.sh
}

_cleanup () {
    # ---------------------------------------------
    # Cleanup and finish
    # ---------------------------------------------

}

execute() {
    _remove
    _add
    _configure
    _cleanup
}

execute 2>&1 | tee -a $DOTFILE_LOG_FILE