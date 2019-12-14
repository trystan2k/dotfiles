#!/usr/bin/env bash
install() {
    echo "Installing: ${1}..."
    sudo apt install -y $1 $2
}

installAppImage() {
    wget -O $PATH_TO_CUSTOM_APPS/$1.AppImage $2
    chmod u+x $PATH_TO_CUSTOM_APPS/$1.AppImage

    wget -O $PATH_TO_CUSTOM_APPS/$1.png $3   

    sudo sh -c "echo '[Desktop Entry]' > /usr/share/applications/$1.desktop"
    sudo sh -c "echo 'Encoding=UTF-8' >> /usr/share/applications/$1.desktop"
    sudo sh -c "echo 'Name=$1' >> /usr/share/applications/$1.desktop"
    sudo sh -c "echo 'Comment=$1' >> /usr/share/applications/$1.desktop"
    sudo sh -c "echo 'Exec=${PATH_TO_CUSTOM_APPS}/${1}.AppImage' >> /usr/share/applications/$1.desktop"
    sudo sh -c "echo 'Icon=${PATH_TO_CUSTOM_APPS}/${1}.png' >> /usr/share/applications/$1.desktop"
    sudo sh -c "echo 'Terminal=false' >> /usr/share/applications/$1.desktop"
    sudo sh -c "echo 'Type=Application' >> /usr/share/applications/$1.desktop"
    sudo sh -c "echo 'Categories=Application;' >> /usr/share/applications/$1.desktop"
    sudo sh -c "echo 'StartupNotify=true' >> /usr/share/applications/$1.desktop"

    echo "Finish installing ${1}. Press enter to continue"
}

installDebApp() {
    wget -O $PATH_TO_DOWNLOAD/$1.deb $2
    sudo apt install $PATH_TO_DOWNLOAD/$1.deb -y
    rm $PATH_TO_DOWNLOAD/$1.deb
}

mkdir -p "$PATH_TO_CUSTOM_APPS"

# ---------------------------------------------
# Package Managers and tools
# ---------------------------------------------

# Install homebrew if it is not installed
command -v brew > /dev/null 2>&1
if [ ! "$?" -eq 0 ] ; then
    echo "Homebrew not installed. Attempting to install Homebrew"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
	if [ ! "$?" -eq 0 ] ; then
		echo "Something went wrong. Exiting..." && exit 1
    else
        test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
        test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
        echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.exports.local 
        source ~/.exports.local
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

# Wget
echo "Install wget"
install wget

# Curl
echo "Install curl"
install curl

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
installDebApp Hyper https://releases.hyper.is/download/deb

# Sublime
echo "Install Sublime"
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
install sublime-text

# ---------------------------------------------
# ZSH and Oh-My-ZSH
# ---------------------------------------------

# Zsh 
echo "Install zsh"
install zsh

# GCC
echo "Install gcc"
brew install gcc

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
installDebApp VSCode https://go.microsoft.com/fwlink/?LinkID=760868

# fzf
echo "Install FZF"
brew install fzf

# ---------------------------------------------
# Cleanup and finish
# ---------------------------------------------

# Remove outdated versions from the cellar
echo "Brew Cleanup"
brew cleanup

echo "Apt remove"
sudo apt autoremove -y
