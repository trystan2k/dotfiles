
#!/usr/bin/env bash

# Install Quick Actions on MacOS

# dotfiles folder
DOTFILES_FOLDER="$(cd -P ..; pwd)"

# Load helper functions
source $DOTFILES_FOLDER/lib/functions

execute() {

    info "Copying Quick Actions"

    local DEST_FOLDER="$HOME/Library/Services"

    cp -R $DOTFILES_FOLDER/macos/quick-actions/*  $DEST_FOLDER

    success "Quick Actions copied with success"
}

execute