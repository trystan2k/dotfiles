#!/usr/bin/env bash

# dotfiles folder
DOTFILES_FOLDER="$(pwd | grep -o '.*dotfiles')"

# Load helper functions
#shellcheck source=/dev/null
source "$DOTFILES_FOLDER/lib/functions"

# ---------------------------------------------
# Plugins list
# ---------------------------------------------

plugins=(
    nodejs:latest:true
    java:oracle-21.0.1:true
    pnpm:latest:true
    ruby:latest:true
    direnv:latest:true
    python:3.9.18:true
)

# ---------------------------------------------
# Install process
# ---------------------------------------------

preInstall() {
    info "Executing pre-installation steps..."
}

postInstall() {

    case $1 in
    direnv)
        info "Executing post-install step for $1"
        
        # Configure direnv
        asdf direnv setup --shell zsh --version "$2"

        success "Post-install step for $1 completed"
    ;;
    *)
    ;;
    esac
}

install() {
    info "Installing ASDF Plugins"
    
    for aux in "${plugins[@]}"; 
    do 
        IFS=':' read -r -a params <<< "$aux"
        local PLUGIN_NAME=${params[0]}
        local PLUGIN_VERSION=${params[1]}
        local SET_GLOBAL=${params[2]}

        info "Installing $PLUGIN_NAME version $PLUGIN_VERSION"

        # Add plugin
        asdf plugin-add "$PLUGIN_NAME"

        # Pre install step
        preInstall "$PLUGIN_NAME"

        # Install current node version
        asdf install "$PLUGIN_NAME" "$PLUGIN_VERSION"

        if [ "$SET_GLOBAL" == "true" ]
        then
            info "Sets version $PLUGIN_VERSION for $PLUGIN_NAME as global"
            
            # Set current node version as global version
            asdf global "$PLUGIN_NAME" "$PLUGIN_VERSION"
            
            success "Version $PLUGIN_VERSION set as global for $PLUGIN_NAME"
        fi

        # Post install step
        postInstall "$PLUGIN_NAME" "$PLUGIN_VERSION"

        success "ASDF Plugin $PLUGIN_NAME version $PLUGIN_VERSION installed."
    done
}

execute() {
    install
}

execute  2>&1 | tee -a "$DOTFILE_LOG_FILE"
