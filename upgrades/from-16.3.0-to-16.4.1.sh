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
}

_add() {
    # ---------------------------------------------
    # Install new tools
    # ---------------------------------------------

    info "Add step"

    info "Adding Ghostty Quick Action"
    local DEST_FOLDER="$HOME/Library/Services"

    cp -R "$DOTFILES_FOLDER"/macos/quick-actions/'Open in Ghostty Terminal.workflow'  "$DEST_FOLDER"
}

_configure() {
    # ---------------------------------------------
    # Install new tools
    # ---------------------------------------------

    info "Configure step"

    if [ ! -d "$PATH_TO_GLOBAL_NODE_MODULES" ]; then
        info "Create global node_modules folder"
        mkdir -p "$PATH_TO_GLOBAL_NODE_MODULES"
    fi

    info "Install npm global tools"
    #shellcheck source=/dev/null
    . "$DOTFILES_FOLDER"/tools/npm-global-tools.sh
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