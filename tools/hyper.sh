#!/usr/bin/env bash

## Variables definitions

# Tool name
TOOL_NAME=hyper

# Tool extra information
EXTRA_INFO="https://releases.hyper.is/download/deb"

# Install methods by OS
OS_METHODS="darwin:cask linux:debFile"

## Pre-installation required steps
preInstall() {

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

