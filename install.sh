#!/bin/sh

user () {
    printf "\r [ %s ] [ \033[34m????\033[0m ] ""$1"" \n" "$(date "+%Y-%m-%d %H:%M:%S")"
}

# Ask the user a Yes/No question
ask_question() {
    read -r "$(user "${1} (y/N) ")" user_selection
    case "$user_selection" in
        Y | y | Yes | YES | yes ) return 0; exit;;
        N | n | No | NO | no ) return 1; exit;;
        * ) return 2;;
    esac
}

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

if ask_question 'Do you want to use SSH to clone the repo (No will use HTTPS)?'; then
    if [ ! -f "$HOME/.ssh/id_rsa.pub" ] ; then
        echo "The SSH key does not exist. Let´s create it."
        echo "Press any key to start"
        read -r
        ssh-keygen -t rsa -f "$HOME/.ssh/id_rsa" -q -P ""
    fi

    if [ ! -f "$HOME/.ssh/id_rsa.pub" ] ; then
        echo "There was an error creating or reading your SSH key at $HOME/.ssh/id_rsa.pub."
        echo "Please check if everything is ok and try again"
        exit 2
    fi

    echo "Now, copy the SSH and add to your GitHub account, to be able to clone the repository via SSH"
    echo "Once you have the key added, press any key to continue"
    echo ""
    cat "$HOME/.ssh/id_rsa.pub"
    echo ""
    read -r

    GITHUB_URL="git@github.com:trystan2k/dotfiles.git"
fi

# Clone dotfiles repo and cd into it
git clone $GITHUB_URL

cd dotfiles || exit

# Go to branch
git checkout master

# Cd into scripts folder and execute bootstrap
cd scripts || exit
bash bootstrap.sh