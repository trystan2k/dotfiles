#!/usr/bin/env bash

# dotfiles folder
DOTFILES_FOLDER="$(cd -P ..; pwd)"

## Variables definitions

# Tool name
TOOL_NAME=tree

# Tool extra information
EXTRA_INFO=

# Install methods by OS
OS_METHODS="darwin:brew"

## Pre-installation required steps
preInstall() {
    info "Pre Install for $1"
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
