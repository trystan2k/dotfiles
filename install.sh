#!/bin/sh

case $(uname -s) in
    Linux*)
        sudo apt install git -y
        ;;
    Darwin*)
        git
        ;;
esac

# Check if git is installed
git --version
if [ ! $? -eq 0 ] ; then
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
bash bootstrap.sh