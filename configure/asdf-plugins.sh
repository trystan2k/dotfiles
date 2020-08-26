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
    nodejs:14.8.0:true
    java:adoptopenjdk-14.0.2+12:true
    yarn:1.22.4:true
    ruby:2.7.0:true
    direnv:2.21.3:true
)

# ---------------------------------------------
# Install process
# ---------------------------------------------

preInstall() {

    case $1 in
    nodejs)
        info "Executing pre-install step for $1"
        
        # Add keys for nodejs
        bash "$HOME/.asdf/plugins/nodejs/bin/import-release-team-keyring"

        success "Pre-install step for $1 completed"
    ;;
    *)
    ;;
    esac
}

install() {
    info "Installing ASDF Plugins"

    # Unlink openssl on brew in linux to avoid issue with Ruby
    if [[ $OSTYPE == linux* ]] ; then
        brew unlink openssl
    fi
    
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

        success "ASDF Plugin $PLUGIN_NAME version $PLUGIN_VERSION installed."
    done
}

execute() {
    install
}

execute  2>&1 | tee -a "$DOTFILE_LOG_FILE"
