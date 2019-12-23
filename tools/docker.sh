#!/usr/bin/env bash

# dotfiles folder
DOTFILES_FOLDER="$(cd -P ..; pwd)"

## Variables definitions

# Tool name
TOOL_NAME=docker

# Tool extra information
EXTRA_INFO=

# Install methods by OS
OS_METHODS="darwin:cask linux:apt"

## Pre-installation required steps
preInstall() {
    info "Pre Install for $1"

    if [[ $OSTYPE == linux* ]] ; then
        curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
        sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
        sudo apt-get update
        
        TOOL_NAME=docker-ce
        
        install $OS_METHODS docker-ce-cli containerd.io
    fi
}

## Post-installation required steps
postInstall() {
    info "Post Install for $1"
}

## Installation exeution. 
## No need to change from this line on

# Load functions
source $DOTFILES_FOLDER/configure/functions

execute() {
    # Pre install steps
    preInstall $TOOL_NAME

    # Install tool
    install "$OS_METHODS" $TOOL_NAME $EXTRA_INFO

    # Post install steps
    postInstall $TOOL_NAME
}

execute
