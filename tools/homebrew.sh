#!/usr/bin/env bash

# dotfiles folder
DOTFILES_FOLDER="$(cd -P .. || exit; pwd)"

# Load functions
#shellcheck source=/dev/null
source "$DOTFILES_FOLDER"/lib/functions

execute() {

    # Install homebrew if it is not installed
    if which brew 1>&/dev/null ; then

        info "Homebrew not installed. Attempting to install Homebrew"

        case "$OSTYPE" in
            darwin*)  
                sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
                result=$?
                ;;
            linux*)   
                linux=1
                sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
                result=$?
                ;;   
            *)        
                warn "Unknown OS type: $OSTYPE" 
                result=1
                ;;
        esac

        if [ ! "$result" -eq 0 ] ; then
            fail "Error installing Homebrew. Exiting..." && exit 1
        elif [[ -n $linux ]] ; then
            info "Completing Linuxbrew installation..."

            test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
            test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
            echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.exports.local 
            #shellcheck source=/dev/null
            source ~/.exports.local
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
