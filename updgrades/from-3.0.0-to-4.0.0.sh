#!/usr/bin/env bash

# Load functions
source ../configure/functions

_remove() {
    # ---------------------------------------------
    # Uninstall not needed anymore
    # ---------------------------------------------

    # Zplug
    echo "Uninstall zplug"
    brew uninstall zplug
}

_add() {
    # ---------------------------------------------
    # Install new tools
    # ---------------------------------------------

    # Ack
    echo "Install ack"
    brew install ack

    # Zplugin
    echo "Install Zplugin"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"
}

_cleanup () {
    # ---------------------------------------------
    # Cleanup and finish
    # ---------------------------------------------

    # Remove outdated versions from the cellar
    echo "Brew Cleanup"
    brew cleanup
}

execute() {
    _remove
    _add
    _cleanup
}

execute 2>&1 | tee -a $DOTFILE_LOG_FILE