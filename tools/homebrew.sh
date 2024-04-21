#!/usr/bin/env bash

# dotfiles folder
DOTFILES_FOLDER="$(pwd | grep -o '.*dotfiles')"

# Load functions
#shellcheck source=/dev/null
source "$DOTFILES_FOLDER"/lib/functions

execute() {

    # Install homebrew if it is not installed
    if ! command -v brew >/dev/null 2>&1; then

        info "Homebrew not installed. Attempting to install Homebrew"

        case "$OSTYPE" in
            darwin*)  
                /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
                result=$?
                ;;
            *)        
                warn "OS type: $OSTYPE not supported. Exiting..." 
                result=1
                ;;
        esac

        if [ ! "$result" -eq 0 ] ; then
            fail "Error installing Homebrew. Exiting..." && exit 1
        fi    

    fi

    # Execute brew update
    info "Executing brew update"
    brew update

    # Execute brew upgrade
    info "Executing brew upgrade"
    brew upgrade

    success "Homebrew installation finished"

}

execute
