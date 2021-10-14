#!/usr/bin/env bash

# dotfiles folder
DOTFILES_FOLDER="$(pwd | grep -o '.*dotfiles')"

# Load helper functions
#shellcheck source=/dev/null
source "$DOTFILES_FOLDER/lib/functions"

# ---------------------------------------------
# Apps list
# ---------------------------------------------

apps=(
    553245401 # Friendly Streaming Browser
    1474276998 # HP Smart
)

# ---------------------------------------------
# Install process
# ---------------------------------------------

preInstall() {
    if ! mas account >/dev/null; then
        echo "Please open App Store and sign in using your Apple ID ...."
        until mas account >/dev/null; do
            sleep 5
        done
    fi
}

install() {
    info "Installing MAS apps"
    
    for app in "${apps[@]}"; 
    do 
        app_name=$(mas info "$app" | head -n 1)
        if ! mas list | grep "$app" >/dev/null; then
            info "Installing $app_name"
            mas install "$app" >/dev/null
            success "App $app_name installed."
        else
            warn "App $app_name already installed."
        fi  
    done
}

execute() {
    install
}

execute  2>&1 | tee -a "$DOTFILE_LOG_FILE"
