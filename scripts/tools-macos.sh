#!/usr/bin/env bash

source ../.macos

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

# GPG
echo "Install gpg"
brew install gpg

# ---------------------------------------------
# Programming Languages and Frameworks
# ---------------------------------------------

# Git
echo "Install git"
brew install git

# Python 3
echo "Install python"
brew install python

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
# ZSH and Zplug
# ---------------------------------------------

# Zsh 
echo "Install zsh"
brew install zsh

# Zplug
echo "Instal Zplug"
brew install zplug

# ZSH Plugins
echo "Install autojump"
brew install autojump

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