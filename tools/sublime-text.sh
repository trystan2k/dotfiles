#!/usr/bin/env bash

## Variables definitions

# Tool name
TOOL_NAME=sublime-text

# Tool extra information
EXTRA_INFO=

# Install methods by OS
OS_METHODS="darwin:cask linux:apt"

## Pre-installation required steps
preInstall() {

    if [[ $OSTYPE == linux* ]] ; then
        wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
        echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
        sudo apt-get update
    fi
}

## Post-installation required steps
postInstall() {
    
}

## Installation exeution. 
## No need to change from this line on

# Load functions
source ../scripts/functions.sh

# Redirect logs to file
startLogRedirect 

# Pre install steps
preInstall

# Install tool
install "$OS_METHODS" $TOOL_NAME $EXTRA_INFO

# Post install steps
postInstall

# Restore log redirection
stopLogRedirect

