#!/bin/sh

case $(uname -s) in
    Linux*)
        sudo apt install git -y
        ;;
    Darwin*)
        git >/dev/null
        ;;
esac

# Create personal Repos folder and cd into it
mkdir -p ~/Documents/Thiago/Repos
cd ~/Documents/Thiago/Repos || exit

# Check if git is installed
if ! git --version; then    
    echo "Git needs to be installed before. Please follow system instructions to install git and try again"
    exit 1
fi

GITHUB_URL="https://github.com/trystan2k/dotfiles.git"

echo "Do you want to use SSH to clone the repo (y/n) ? (No will use HTTPS)"
read -r action
    case "$action" in
        y|Y )
            if [ ! -f "$HOME/.ssh/id_rsa.pub" ] ; then
                echo "The SSH key does not exist. Let´s create it."
                echo "Press enter to start"
                # shellcheck disable=SC2034
                read -r response
                ssh-keygen -t rsa -f "$HOME/.ssh/id_rsa" -q -P ""
            fi

            if [ ! -f "$HOME/.ssh/id_rsa.pub" ] ; then
                echo "There was an error creating or reading your SSH key at $HOME/.ssh/id_rsa.pub."
                echo "Please check if everything is ok and try again"
                exit 2
            fi

            echo "Now, copy the SSH and add to your GitHub account, to be able to clone the repository via SSH"
            echo "Once you have the key added, press enter to continue"
            echo ""
            cat "$HOME/.ssh/id_rsa.pub"
            echo "Press enter to start"
            # shellcheck disable=SC2034
            read -r response

            GITHUB_URL="git@github.com:trystan2k/dotfiles.git"
        ;;
        * )
        ;;
    esac            

# Clone dotfiles repo and cd into it
git clone $GITHUB_URL

cd dotfiles || exit

# Go to branch
git checkout master

# Cd into scripts folder and execute bootstrap
cd scripts || exit
bash bootstrap.sh