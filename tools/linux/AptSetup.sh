#!/usr/bin/env bash

# Add necessary dependency
sudo apt-get install software-properties-common -y
sudo apt-get update

# Docker repository
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88   
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt-get update

# Firefox repository
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys A6DCF7707EBC211F
sudo apt-add-repository "deb http://ppa.launchpad.net/ubuntu-mozilla-security/ppa/ubuntu bionic main"
sudo apt-get update

# Font Firacode repository
sudo apt --fix-broken install
sudo apt-add-repository universe
sudo apt-get update

# Font hard nerd
mkdir -p $HOME/.local/share/fonts/ 
wget -O $HOME/.local/share/fonts/Hack_Regular_Nerd_Font_Complete.ttf https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete.ttf
fc-cache -f -v

# Sublime file
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

# Update apt repositories
sudo apt-get update