#!/usr/bin/env bash

# dotfiles folder
DOTFILES_FOLDER="$(pwd | grep -o '.*dotfiles')"

# Load helper functions
#shellcheck source=/dev/null
source "$DOTFILES_FOLDER"/lib/functions
#shellcheck source=/dev/null
source "$DOTFILES_FOLDER"/symlinks/.exports

# ---------------------------------------------
# Install process
# ---------------------------------------------

install() {
    if ask_question 'Do you want to install all tools using Homebrew/Git/others?'; then

        info "Install HomeBrew"
        #shellcheck source=/dev/null
        . "$DOTFILES_FOLDER"/tools/homebrew.sh

        if [[ $OSTYPE == darwin* ]] ; then
            info "Installing tools for MacOS"

            # Update Homebrew recipes
            brew update

            user "Install tools for 'work' or 'personal' machine?"
            read -r COMPUTER_NAME

            if [ "$COMPUTER_NAME" != "work" ] && [ "$COMPUTER_NAME" != "work" ] ; then
                COMPUTER_NAME="personal"
            fi

            info "Installing tools for '$COMPUTER_NAME' machine"

            # Install common tools
            brew bundle -v --file="$DOTFILES_FOLDER"/tools/macos/Brewfile

            # Install tools for 'work' or 'personal' machine
            brew bundle -v --file="$DOTFILES_FOLDER"/tools/macos/Brewfile."$COMPUTER_NAME"
        fi;

        info "Install Zinit"
        #shellcheck source=/dev/null
        . "$DOTFILES_FOLDER"/tools/zinit.sh
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

    # Remove node installed in system
    info "Removing Node installed in system"
    brew uninstall --ignore-dependencies node
}

# ---------------------------------------------
# Configure tools
# ---------------------------------------------
configure() {

    info "MISE Configure"
    if ask_question 'Do you want to configure Mise?'; then
        #shellcheck source=/dev/null
        . "$DOTFILES_FOLDER"/configure/mise-config.sh
    fi

    info "Configure Password store"
    if ask_question 'Do you want to configure password store ?'; then
        #shellcheck source=/dev/null
        . "$DOTFILES_FOLDER"/configure/pass-store.sh
    fi      

    info "Fix ZSH permissions"
    if ask_question 'Do you want execute the script to fix possible ZSH permissions issue?'; then
        #shellcheck source=/dev/null
        sudo chmod -R 755 /usr/local/share/zsh
        sudo chown -R root:staff /usr/local/share/zsh
    fi   
}

execute() {
    install
    cleanup
    configure
}

execute
