#!/usr/bin/env bash

# Load functions
source ../scripts/functions.sh

# Redirect logs to file
startLogRedirect 

# ---------------------------------------------
# Tools list
# ---------------------------------------------

# Core softwares list
core=(
    homebrew
    apt-transport-https
    software-properties-common
    gdebi-core
    git
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
)

# ---------------------------------------------
# Install process
# ---------------------------------------------

info "Installing core tools"
for i in "${core[@]}"; 
do 
    sh ../tools/"${i}.sh"
done

info "Installing other tools"
for i in "${tools[@]}"; 
do 
    sh ../tools/"${i}.sh"
done

# ---------------------------------------------
# Cleanup and finish
# ---------------------------------------------

# Remove outdated versions from the cellar
info "Brew Cleanup"
brew cleanup

if [[ $OSTYPE == linux* ]] ; then
    info "Apt remove"
    sudo apt autoremove -y
fi

# Restore log redirection
stopLogRedirect