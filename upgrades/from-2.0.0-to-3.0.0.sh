#!/usr/bin/env bash

# dotfiles folder
DOTFILES_FOLDER="$(pwd | grep -o '.*dotfiles')"

# Load functions
#shellcheck source=/dev/null
source "$DOTFILES_FOLDER"/lib/functions

_remove() {
    # ---------------------------------------------
    # Uninstall not needed anymore
    # ---------------------------------------------

    # Python 3
    echo "Uninstall python"
    brew uninstall python

    # Yarn
    echo "Uninstall Yarn"
    brew uninstall yarn

    # ZSH Plugins
    echo "Uninstall zsh-autosuggestions zsh-syntax-highlighting thefuck"
    brew uninstall zsh-autosuggestions zsh-syntax-highlighting thefuck

    # Oh-My-ZSH
    echo "Uninstall Oh-My-ZSH"
    rm -rf ./.oh-my-zsh

    # NVM
    echo "Uninstall NVM"
    rm -rf ./.nvm
}

_add() {
    # ---------------------------------------------
    # Install new tools
    # ---------------------------------------------

    # Zplug
    echo "Instal Zplug"
    brew install zplug

    # GPG
    echo "Install gpg"
    brew install gpg

    # ASDF
    echo "Install ASDF"
    brew install asdf

    # Jq
    echo "Install jq"
    brew install jq
}

_cleanup () {
    # ---------------------------------------------
    # Cleanup and finish
    # ---------------------------------------------

    # Remove outdated versions from the cellar
    echo "Brew Cleanup"
    brew cleanup
}

execute() {
    _remove
    _add
    _cleanup
}

execute 2>&1 | tee -a "$DOTFILE_LOG_FILE"
