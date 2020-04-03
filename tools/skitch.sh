#!/usr/bin/env bash

# dotfiles folder
DOTFILES_FOLDER="$(cd -P ..; pwd)"

## Variables definitions

# Tool name
TOOL_NAME=skitch

# Tool description
TOOL_DESCRIPTION="Get your point across with fewer words using annotation, shapes and sketches, so that your ideas become reality faster."

# Tool extra information
EXTRA_INFO=

# Install methods by OS
OS_METHODS="darwin:cask"

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
