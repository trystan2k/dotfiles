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

if [ ! -f $HOME/.ssh/id_rsa.pub ] ; then
    echo "The SSH key does not exist. Let´s create it."
    echo "Press any key to start"
    read -r response
    ssh-keygen -t rsa -f $HOME/.ssh/id_rsa -q -P ""
fi

if [ ! -f $HOME/.ssh/id_rsa.pub ] ; then
    echo "There was an error creating or reading your SSH key at $HOME/.ssh/id_rsa.pub."
    echo "Please check if everything is ok and try again"
    exit 2
fi

echo "Now, copy the SSH and add to your GitHub account, to be able to clone the repository via SSH"
echo "Once you have the key added, press any key to continue"
echo ""
cat $HOME/.ssh/id_rsa.pub
echo ""
read -r response

# Create personal Repos folder and cd into it
mkdir -p ~/Documents/Thiago/Repos
cd ~/Documents/Thiago/Repos

# Clone dotfiles repo and cd into it
git clone git@github.com:trystan2k/dotfiles.git

cd dotfiles

# Go to branch
git checkout release/5.1.0

# Cd into scripts folder and execute bootstrap
cd scripts
bash bootstrap.sh