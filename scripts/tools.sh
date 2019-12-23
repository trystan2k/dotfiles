#!/usr/bin/env bash

# Load functions
source ../configure/functions

# ---------------------------------------------
# Tools list
# ---------------------------------------------

# Core softwares list
core=(
    homebrew
    snapd
    apt-transport-https
    software-properties-common
    gdebi-core
    git
    subversion
    wget
    curl
    dirmngr
    gcc
    coreutils
    gpg
    jq
    zsh
    ack
)

# Tools list
tools=(
    asdf
    docker
    station
    appcleaner
    google-chrome
    firefox
    alfred
    parallels
    dozer
    httpie
    tree
    hyper
    sublime-text
    zplugin
    autojump
    fonts
    visual-studio-code
    terminal-notifier
    fzf    
    postman
)

# ---------------------------------------------
# Install process
# ---------------------------------------------

install() {
    user "This utility will install useful tools using Homebrew/Git/others, according to the OS"
    user "Proceed? (y/n)"
    read resp
    if [ "$resp" = 'y' -o "$resp" = 'Y' ] ; then
        info "Installing core tools"
        for i in "${core[@]}"; 
        do 
            . ../tools/"${i}.sh"
        done

        info "Installing other tools"
        for i in "${tools[@]}"; 
        do 
            . ../tools/"${i}.sh"
        done
    else
        warn "Tools installation cancelled by user"
    fi
}

# ---------------------------------------------
# Cleanup and finish
# ---------------------------------------------

cleanup() {
    # Remove outdated versions from the cellar
    info "Brew Cleanup"
    brew cleanup

    if [[ $OSTYPE == linux* ]] ; then
        info "Apt remove"
        sudo apt autoremove -y
    fi
}

execute() {
    install
    cleanup
}

execute
