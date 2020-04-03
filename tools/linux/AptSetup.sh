#!/usr/bin/env bash

# Docker repository
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88   
sudo apt-add-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"

# Firefox repository
sudo add-apt-repository ppa:mozillateam/firefox-stable -y

# Font Firacode repository
sudo apt --fix-broken install
sudo add-apt-repository universe

# Font hard nerd
mkdir -p $HOME/.local/share/fonts/ 
wget -O $HOME/.local/share/fonts/Hack_Regular_Nerd_Font_Complete.ttf https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete.ttf
fc-cache -f -v

# Sublime file
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

# Update apt repositories
sudo apt-get update