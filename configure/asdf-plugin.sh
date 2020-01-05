#!/usr/bin/env bash

# dotfiles folder
DOTFILES_FOLDER="$(cd -P ..; pwd)"

# Load helper functions
source $DOTFILES_FOLDER/lib/functions

# ---------------------------------------------
# Plugins list
# ---------------------------------------------

plugins=(
    nodejs:12.14.0:true
    nodejs:8.17.0:false
    java:adopt-openjdk-13+33:true
    java:adopt-openjdk-8u232-b09:false
    yarn:1.21.1:true
    ruby:2.7.0:true
)

# ---------------------------------------------
# Install process
# ---------------------------------------------

install() {
    user "This utility will install ASDF Plugins"
    user "Proceed? (y/n)"
    read resp
    if [ "$resp" = 'y' -o "$resp" = 'Y' ] ; then
        info "Installing ASDF Plugins"
        
        for aux in "${plugins[@]}"; 
        do 
            params=(${aux//:/ })
            local PLUGIN_NAME=${params[0]}
            local PLUGIN_VERSION=${params[1]}
            local SET_GLOBAL=${params[2]}

            info "Installing $PLUGIN_NAME version $PLUGIN_VERSION"

            # Add plugin
            asdf plugin-add $PLUGIN_NAME

            # Install current node version
            asdf install $PLUGIN_NAME $PLUGIN_VERSION

            if [ "$SET_GLOBAL" == "true" ]
            then
                info "Set version $PLUGIN_VERSION for $PLUGIN_NAME as global"
                # Set current node version as global version
                asdf global $PLUGIN_NAME $PLUGIN_VERSION
            fi

            success "ASDF Plugin $PLUGIN_NAME version $PLUGIN_VERSION installed."
        done
    else
        warn "ASDF Plugin install cancelled by user"
    fi
}

execute() {
    install
}

execute  2>&1 | tee -a $DOTFILE_LOG_FILE
