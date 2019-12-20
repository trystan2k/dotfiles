#!/usr/bin/env bash

## Variables definitions

# Tool name
TOOL_NAME=firefox

# Tool extra information
EXTRA_INFO=

# Install methods by OS
OS_METHODS="darwin:cask linux:apt"

## Pre-installation required steps
preInstall() {

    if [[ $OSTYPE == linux* ]] ; then
        sudo add-apt-repository ppa:mozillateam/firefox-stable -y
        sudo apt update
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

