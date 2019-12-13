#!/usr/bin/env bash
install() {
    which $1 &> /dev/null

    if [ $? -ne 0 ]; then
        echo "Installing: ${1}..."
        sudo apt install -y $1 $2
    else
        echo "Already installed: ${1}"
    fi
}

mkdir -p "$PATH_TO_CUSTOM_APPS"

sudo apt update

# Install homebrew if it is not installed
which brew 1>&/dev/null
if [ ! "$?" -eq 0 ] ; then
    echo "Homebrew not installed. Attempting to install Homebrew"
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
	if [ ! "$?" -eq 0 ] ; then
		echo "Something went wrong. Exiting..." && exit 1
	fi
fi

# ---------------------------------------------
# Programming Languages and Frameworks
# ---------------------------------------------

# Git
echo "Install git"
install git

# Python 3
echo "Install python"
install python3.7

# ---------------------------------------------
# Tools I use often
# ---------------------------------------------

# Yarn
echo "Install Yarn"
install yarn --no-install-recommends

# ---------------------------------------------
# Useful tools
# ---------------------------------------------


# ---------------------------------------------
# ZSH and Oh-My-ZSH
# ---------------------------------------------

# Zsh 
echo "Install zsh"
brew install zsh

# ZSH Plugins
echo "Install zsh-autosuggestions zsh-syntax-highlighting thefuck autojump"
brew install zsh-autosuggestions zsh-syntax-highlighting thefuck autojump

# OhMyZSH
echo "Install Oh-My-ZSH"
curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

# zsh-syntax-highlighting
echo "Install zsh-syntax-highlighting"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# zsh-autosuggestions
echo "Install zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# powerlevel9k
echo "Install powerlevel10k"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k

# NVM
echo "Install nvm"
git clone https://github.com/lukechilds/zsh-nvm ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-nvm

# The Fire Code font
# https://github.com/tonsky/FiraCode
# This method of installation is
# not officially supported, might install outdated version
# Change font in terminal preferences
echo "Install Fira Code"
sudo add-apt-repository universe
sudo apt-get update
install fonts-firacode

# Nerd Font
echo "Install Nerd Font"
install fonts-hack-ttf

# fzf
echo "Install FZF"
brew install fzf

# ---------------------------------------------
# Cleanup and finish
# ---------------------------------------------

# Remove outdated versions from the cellar
echo "Brew Cleanup"
brew cleanup