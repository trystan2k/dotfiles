#!/usr/bin/env bash

# dotfiles folder
DOTFILES_FOLDER="$(pwd | grep -o '.*dotfiles')"

## Variables definitions

# Tool name
TOOL_NAME=postman

# Tool extra information
EXTRA_INFO=

# Install methods by OS
OS_METHODS="linux:snap"

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

execute() {
    # Pre install steps
    preInstall "$TOOL_NAME"

    # Install tool
    install "$OS_METHODS" $TOOL_NAME "$EXTRA_INFO"

    # Post install steps
    postInstall "$TOOL_NAME"
}

_is_func_imported() {

    typeset TYPE_RESULT="$(type -t user)"

    if [ "$TYPE_RESULT" != 'function' ]; then
        #shellcheck source=/dev/null
        source "$DOTFILES_FOLDER"/lib/functions
    fi
}

_is_func_imported

execute
