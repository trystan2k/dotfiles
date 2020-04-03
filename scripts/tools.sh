#!/usr/bin/env bash

# dotfiles folder
DOTFILES_FOLDER="$(cd -P ..; pwd)"

# Load helper functions
source $DOTFILES_FOLDER/lib/functions


# ---------------------------------------------
# Install process
# ---------------------------------------------

install() {
    user "This utility will install useful tools using Homebrew/Git/others, according to the OS"
    user "Proceed? (y/n)"
    read resp
    if [ "$resp" = 'y' -o "$resp" = 'Y' ] ; then

        info "Install HomeBrew"
        . $DOTFILES_FOLDER/tools/homebrew.sh

        if [[ $OSTYPE == darwin* ]] ; then
            info "Installing tools for MacOS"

            # Update Homebrew recipes
            brew update

            # Install all our dependencies with bundle (See Brewfile)
            brew tap homebrew/bundle
            brew bundle $DOTFILES_FOLDER/tools/macos/Brewfile

        elif [[ $OSTYPE == linux* ]] ; then
            info "Installing tools for Linux"

            info "Setup APT before install"
            . $DOTFILES_FOLDER/tools/linux/AptSetup.sh

            while read file; do
                info "Installing $file"
                sudo apt update
                sudo apt install -y $1
            done < $DOTFILES_FOLDER/tools/linux/Aptfile

            info "Install other tools"

            for file in `/bin/ls $DOTFILES_FOLDER/tools/linux/*.sh |grep -v AptSteup.sh`; do 
                echo . $file
            done
        fi;

        info "Install Zinit"
        . $DOTFILES_FOLDER/tools/zinit.sh
    else
        warn "Tools installation cancelled by user"
    fi
}

# ---------------------------------------------
# Cleanup and finish
# ---------------------------------------------

cleanup() {
    # Remove outdated versions from the cellar
    info "Brew Cleanup"
    brew cleanup

    if [[ $OSTYPE == linux* ]] ; then
        info "Apt remove"
        sudo apt autoremove -y
    fi
}

execute() {
    install
    cleanup
}

execute
