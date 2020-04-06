#!/usr/bin/env bash

# dotfiles folder
DOTFILES_FOLDER="$(pwd | grep -o '.*dotfiles')"

# Load helper functions
#shellcheck source=/dev/null
source "$DOTFILES_FOLDER/lib/functions"

# ---------------------------------------------
# Plugins list
# ---------------------------------------------

direnvrc() {

    info "Link direnvrc file to ~/.config/direnv/direnvrc"
    mkdir -p "$HOME/.config/direnv"
    ln -sv "$DOTFILES_FOLDER/configure/direnvrc" "$HOME/.config/direnv/direnvrc"
}

execute() {
    direnvrc
}

execute  2>&1 | tee -a "$DOTFILE_LOG_FILE"
