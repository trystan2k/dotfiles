
#!/usr/bin/env bash

# Specific setups for MacOS system

# dotfiles folder
DOTFILES_FOLDER="$(cd -P ..; pwd)"

# Load helper functions
source $DOTFILES_FOLDER/lib/functions

execute() {

    info "Sudo - Enable Touch ID to autorize sudo"
    echo "auth       sufficient     pam_tid.so" | sudo tee -a /private/etc/pam.d/sudo
}

execute