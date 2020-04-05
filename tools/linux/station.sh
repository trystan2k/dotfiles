#!/usr/bin/env bash

# dotfiles folder
DOTFILES_FOLDER="$(cd -P .. || exit; pwd)"

## Variables definitions

# Tool name
TOOL_NAME=station

# Tool extra information
EXTRA_INFO="https://dl.getstation.com/download/linux_64?filetype=AppImage https://avatars2.githubusercontent.com/u/27734877?s=200&v=4"

# Install methods by OS
OS_METHODS="linux:appImage"

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
#shellcheck source=/dev/null
source "$DOTFILES_FOLDER"/lib/functions

execute() {
    # Pre install steps
    preInstall $TOOL_NAME

    # Install tool
    install "$OS_METHODS" $TOOL_NAME "$EXTRA_INFO"

    # Post install steps
    postInstall $TOOL_NAME
}

execute
