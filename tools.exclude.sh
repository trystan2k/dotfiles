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
echo "Update Homebrew"
brew update

# Upgrade any already-installed formulae
echo "Upgrade Homebrew"
brew upgrade

# Core Utils
echo "Install coreutils"
brew install coreutils

# ---------------------------------------------
# Programming Languages and Frameworks
# ---------------------------------------------

# Git
echo "Install git"
brew install git

# Python 3
echo "Install python"
brew install python

# ---------------------------------------------
# Tools I use often
# ---------------------------------------------

# Yarn
echo "Install Yarn"
brew install yarn --ignore-dependencies

# Docker for containerization
echo "Install docker"
brew cask install docker

# ---------------------------------------------
# Useful tools
# ---------------------------------------------

# Station
echo "Install Station"
brew cask install station

# App Cleaner
echo "Install AppCleaner"
brew cask install appcleaner

# Chrome
echo "Install Chrome"
brew cask install google-chrome

# Firefox 
echo "Install Firefox"
brew cask install firefox

# Alfred
echo "Install Alfred"
brew cask install alfred

# Parallels
echo "Install Parallels"
brew cask install parallels

# Dozer
echo "Install Dozer"
brew cask install dozer

# Make requests with awesome response formatting
echo "Install httpie"
brew install httpie

# Show directory structure with excellent formatting
echo "Install tree"
brew install tree

# Hyper terminal
echo "Install hyper"
brew cask install hyper

# Sublime
echo "Install Sublime"
brew cask install sublime-text

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
brew tap homebrew/cask-fonts
brew cask install font-fira-code

# Nerd Font
echo "Install Nerd Font"
brew tap homebrew/cask-fonts
brew cask install font-hack-nerd-font

# My favorite text editor
echo "Install VS Code"
brew cask install visual-studio-code

# terminal-notifier
echo "Install Terminal Notifier"
brew install terminal-notifier

# fzf
echo "Install FZF"
brew install fzf

# ---------------------------------------------
# Cleanup and finish
# ---------------------------------------------

# Remove outdated versions from the cellar
echo "Brew Cleanup"
brew cleanup