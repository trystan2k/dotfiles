#!/usr/bin/env bash

# dotfiles folder
DOTFILES_FOLDER="$(cd -P ..; pwd)"

## Variables definitions

# Tool name
TOOL_NAME=visual-studio-code

# Tool extra information
EXTRA_INFO="--classic"

# Install methods by OS
OS_METHODS="darwin:cask linux:snap"

## Pre-installation required steps
preInstall() {
    info "Pre Install for $1"

    if [[ $OSTYPE == linux* ]] ; then
        TOOL_NAME=code
    fi
}

## Post-installation required steps
postInstall() {
    info "Post Install for $1"
}

## Installation exeution. 
## No need to change from this line on

# Load functions
source $DOTFILES_FOLDER/lib/functions

execute() {
    # Pre install steps
    preInstall $TOOL_NAME

    # Install tool
    install "$OS_METHODS" $TOOL_NAME $EXTRA_INFO

    # Post install steps
    postInstall $TOOL_NAME
}

execute
