#!/usr/bin/env bash

# Install Quick Actions on MacOS

# dotfiles folder
DOTFILES_FOLDER="$(pwd | grep -o '.*dotfiles')"

# Load helper functions
#shellcheck source=/dev/null
source "$DOTFILES_FOLDER"/lib/functions

execute() {

    info "Copying Quick Actions"

    local DEST_FOLDER="$HOME/Library/Services"

    cp -R "$DOTFILES_FOLDER"/macos/quick-actions/*  "$DEST_FOLDER"

    success "Quick Actions copied with success"
}

execute
