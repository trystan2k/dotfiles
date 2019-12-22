#!/usr/bin/env bash

# Load helper functions
source ../configure/functions

_configureNodeJs() {

    local CURRENT_NODE_VERSION=8.9.4
    
    info "Installing Node version $CURRENT_NODE_VERSION"

    # Install nodejs plugin
    asdf plugin-add nodejs

    # Add keys for nodejs
    bash $HOME/.asdf/plugins/nodejs/bin/import-release-team-keyring

    # Install current node version
    asdf install nodejs $CURRENT_NODE_VERSION

    # Set current node version as global version
    asdf global nodejs $CURRENT_NODE_VERSION

    success "Node version $CURRENT_NODE_VERSION installed."
}

_configureYarn() {

    local CURRENT_YARN_VERSION=1.21.1

    info "Installing Yarn version $CURRENT_YARN_VERSION"
    
    # Install yarn plugin
    asdf plugin-add yarn

    # Install current nodyarne version
    asdf install yarn $CURRENT_YARN_VERSION

    # Set current yarn version as global version
    asdf global yarn $CURRENT_YARN_VERSION

    success "Yarn version $CURRENT_YARN_VERSION installed."
}

execute() {
    _configureNodeJs
    _configureYarn
}

execute  2>&1 | tee -a $DOTFILE_LOG_FILE

