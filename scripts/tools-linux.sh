#!/usr/bin/env bash
install() {
    which $1 &> /dev/null

    if [ ! "$?" -eq 0 ] ; then
        echo "Installing: ${1}..."
        sudo apt install -y $1 $2
    else
        echo "Already installed: ${1}"
    fi
}

installAppImage() {
    wget -O $PATH_TO_CUSTOM_APPS/$1.AppImage $2
    chmod u+x $PATH_TO_CUSTOM_APPS/$1.AppImage

    wget -O $PATH_TO_CUSTOM_APPS/$1.png $3   

    echo "[Desktop Entry]" > /usr/share/applications/$1.desktop
    echo "Encoding=UTF-8" >> /usr/share/applications/$1.desktop
    echo "Name=$1" >> /usr/share/applications/$1.desktop
    echo "Comment=$1" >> /usr/share/applications/$1.desktop
    echo "Exec=${PATH_TO_CUSTOM_APPS}/${1}.AppImage" >> /usr/share/applications/$1.desktop
    echo "Icon=${PATH_TO_CUSTOM_APPS}/${1}.png" >> /usr/share/applications/$1.desktop
    echo "Terminal=false" >> /usr/share/applications/$1.desktop
    echo "Type=Application" >> /usr/share/applications/$1.desktop
    echo "Categories=Application;" >> /usr/share/applications/$1.desktop
    echo "StartupNotify=true" >> /usr/share/applications/$1.desktop
}

installDebApp() {
    wget -O $PATH_TO_DOWNLOAD/$1.deb $2
    sudo gdebi $PATH_TO_DOWNLOAD/$1.deb
    rm $PATH_TO_DOWNLOAD/$1.deb
}

mkdir -p "$PATH_TO_CUSTOM_APPS"

# ---------------------------------------------
# Package Managers and tools
# ---------------------------------------------

# Install homebrew if it is not installed
which brew 1>&/dev/null
if [ ! "$?" -eq 0 ] ; then
    echo "Homebrew not installed. Attempting to install Homebrew"
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
	if [ ! "$?" -eq 0 ] ; then
		echo "Something went wrong. Exiting..." && exit 1
	fi
fi

# Install gdebi to take care of .deb packages
install gdebi-core

# Install add-apt-repository
install software-properties-common

sudo apt update

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

# Docker for containerization
echo "Install docker"
install docker.io

# ---------------------------------------------
# Useful tools
# ---------------------------------------------

# Station
echo "Install Station"
installAppImage Station https://dl.getstation.com/download/linux_64?filetype=AppImage https://avatars2.githubusercontent.com/u/27734877?s=200&v=4

# Chrome
echo "Install Chrome"
installDebApp Chrome https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

# Firefox 
echo "Install Firefox"
sudo add-apt-repository ppa:mozillateam/firefox-stable -y
sudo apt update
sudo apt install -y firefox

# Hyper terminal
echo "Install hyper"
installDepApp Hyper https://hyper-updates.now.sh/download/linux_deb

# Sublime
echo "Install Sublime"
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-text

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
sudo apt --fix-broken install
sudo add-apt-repository universe
sudo apt-get update
install fonts-firacode

# Nerd Font
echo "Install Nerd Font"
install fonts-hack-ttf

# My favorite text editor
echo "Install VS Code"
install code

# fzf
echo "Install FZF"
brew install fzf

# ---------------------------------------------
# Cleanup and finish
# ---------------------------------------------

# Remove outdated versions from the cellar
echo "Brew Cleanup"
brew cleanup