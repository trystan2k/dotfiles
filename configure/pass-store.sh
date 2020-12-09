#!/usr/bin/env bash

# dotfiles folder
DOTFILES_FOLDER="$(pwd | grep -o '.*dotfiles')"

# Load helper functions
#shellcheck source=/dev/null
source "$DOTFILES_FOLDER/lib/functions"

configureGPG() {
    info "Initialize gpg"

    gpg --gen-key
}

passstore() {
    info "Initialize pass-store"

    passstore=$(which pass)

    if [ -z "$passstore" ]
    then
        fail "Could not found 'pass'. Is it installed ?"
    fi    

    user "Enter a key to be used as the name of the store:"
    read -r masterpass

    pass init "$masterpass"
}

execute() {
    configureGPG
    passstore
}

execute  2>&1 | tee -a "$DOTFILE_LOG_FILE"
