#!/usr/bin/env bash

## Variables definitions

# Tool name
TOOL_NAME=fonts

# Tool extra information
EXTRA_INFO=

# Install methods by OS
OS_METHODS="linux:apt"

## Installation exeution. 

# Load functions
source ../configure/functions

## Functions definitions
_firacode() {

    if [[ $OSTYPE == darwin* ]] ; then
        info "Install Fira Code"
        brew tap homebrew/cask-fonts
        brew cask install font-fira-code
    elif [[ $OSTYPE == linux* ]] ; then
        sudo apt --fix-broken install
        sudo add-apt-repository universe
        sudo apt-get update
        install $OS_METHODS fonts-firacode
    fi

}

_hacknerd() {

    if [[ $OSTYPE == darwin* ]] ; then
        info "Install Hack Nerd"
        brew tap homebrew/cask-fonts
        brew cask install font-hack-nerd-font
    elif [[ $OSTYPE == linux* ]] ; then

        mkdir -p $HOME/.local/share/fonts/ 
        wget -O $HOME/.local/share/fonts/Hack_Regular_Nerd_Font_Complete.ttf https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete.ttf
        fc-cache -f -v
        install $OS_METHODS fonts-hack-ttf    
    fi

}

execute() {
    _firacode
    _hacknerd
}

execute



