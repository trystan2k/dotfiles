#!/usr/bin/env bash

# dotfiles folder
DOTFILES_FOLDER="$(cd -P ..; pwd)"

# Load helper functions
source $DOTFILES_FOLDER/lib/functions

# ---------------------------------------------
# Plugins list
# ---------------------------------------------

direnvrc() {

    info "Link direnvrc file to ~/.config/direnv/direnvrc"
    ln -sv "${DOTFILES_FOLDER}/configure/direnvrc" $HOME/.config/direnv/direnvrc

    info "Allow .envrc file execution"
    asdf exec direnv allow $HOME/.envrc
}

execute() {
    direnvrc
}

execute  2>&1 | tee -a $DOTFILE_LOG_FILE
