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

    info "Pre Install for $1"

    if [[ $OSTYPE == linux* ]] ; then
        sudo add-apt-repository ppa:mozillateam/firefox-stable -y
        sudo apt update
    fi
}

## Post-installation required steps
postInstall() {
    info "Post Install for $1"
}

## Installation exeution. 
## No need to change from this line on

# Load functions
source ../configure/functions

execute() {
    # Pre install steps
    preInstall $TOOL_NAME

    # Install tool
    install "$OS_METHODS" $TOOL_NAME $EXTRA_INFO

    # Post install steps
    postInstall $TOOL_NAME
}

execute
