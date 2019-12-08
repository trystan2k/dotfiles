#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Install homebrew if it is not installed
which brew 1>&/dev/null
if [ ! "$?" -eq 0 ] ; then
	echo "Homebrew not installed. Attempting to install Homebrew"
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	if [ ! "$?" -eq 0 ] ; then
		echo "Something went wrong. Exiting..." && exit 1
	fi
fi

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

# Core Utils
brew install coreutils

# ---------------------------------------------
# Programming Languages and Frameworks
# ---------------------------------------------

# Git
brew install git

# NVM
brew install nvm

# Python 3
brew install python

# ---------------------------------------------
# Tools I use often
# ---------------------------------------------

# Yarn
brew install yarn --without-node --ignore-dependencies

# Docker for containerization
brew cask install docker

# ---------------------------------------------
# Useful tools
# ---------------------------------------------

# Make requests with awesome response formatting
brew install httpie

# Show directory structure with excellent formatting
brew install tree

# Hyper terminal
brew cask install hyper

# ---------------------------------------------
# ZSH and Oh-My-ZSH
# ---------------------------------------------

# Zsh 
brew install zsh

# ZSH Plugins
brew install zsh-autosuggestions zsh-syntax-highlighting thefuck autojump

# OhMyZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# powerlevel9k
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

# The Fire Code font
# https://github.com/tonsky/FiraCode
# This method of installation is
# not officially supported, might install outdated version
# Change font in terminal preferences
brew tap caskroom/fonts
brew cask install font-fira-code

# Nerd Font
brew tap homebrew/cask-fonts
brew cask install font-hack-nerd-font

# My favorite text editor
brew cask install visual-studio-code

# terminal-notifier
brew install terminal-notifier

# fzf
brew install fzf

# ---------------------------------------------
# Cleanup and finish
# ---------------------------------------------

# Remove outdated versions from the cellar
brew cleanup