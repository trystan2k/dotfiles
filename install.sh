#!/usr/bin/env bash

if [[ $OSTYPE == linux* ]] ; then
    sudo apt install git
elif [[ $OSTYPE == darwin* ]] ; then
    git
fi

# Install homebrew if it is not installed
which git 1>&/dev/null

# Check if git is installed
if [ ! "$?" -eq 0 ] ; then
    echo "Git needs to be installed before. Please follow system instructions to install git and try again"
    exit 1
fi

# Create personal Repos folder and cd into it
mkdir -p ~/Documents/Thiago/Repos
cd ~/Documents/Thiago/Repos

# Clone dotfiles repo and cd into it
git clone https://github.com/trystan2k/dotfiles.git
cd dotfiles

# Go to branch
git checkout release/5.1.0

# Cd into scripts folder and execute bootstrap
cd scripts
. bootstrap.sh