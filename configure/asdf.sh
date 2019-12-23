#!/usr/bin/env bash

# dotfiles folder
DOTFILES_FOLDER="$(cd -P ..; pwd)"

# Load helper functions
source $DOTFILES_FOLDER/configure/functions

_configureNodeJs() {

    local CURRENT_NODE_VERSION=8.17.0
    
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

    # Install current yarn version
    asdf install yarn $CURRENT_YARN_VERSION

    # Set current yarn version as global version
    asdf global yarn $CURRENT_YARN_VERSION

    success "Yarn version $CURRENT_YARN_VERSION installed."
}

_configureJava() {

    local CURRENT_JAVA_VERSION=adopt-openjdk-13+33

    info "Installing Java version $CURRENT_YARN_VERSION"
    
    # Install java plugin
    asdf plugin-add java

    # Install current java version
    asdf install java $CURRENT_JAVA_VERSION

    # Set current java version as global version
    asdf global java $CURRENT_JAVA_VERSION

    success "Java version $CURRENT_JAVA_VERSION installed."
}

execute() {
    _configureNodeJs
    _configureYarn
    _configureJava
}

execute  2>&1 | tee -a $DOTFILE_LOG_FILE

