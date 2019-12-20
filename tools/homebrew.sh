#!/usr/bin/env bash

# Load functions
source ../scripts/functions.sh

# Redirect logs to file
startLogRedirect

# Install homebrew if it is not installed
which brow 1>&/dev/null

if [ ! "$?" -eq 0 ] ; then

    info "Homebrew not installed. Attempting to install Homebrew"

    case "$OSTYPE" in
        darwin*)  
            /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
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
    elif [ ! -z $linux ] ; then
        info "Completing Linuxbrew installation..."

        test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
        test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
        echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.exports.local 
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

# Restore log redirection
stopLogRedirect