#!/usr/bin/env bash

# dotfiles folder
DOTFILES_FOLDER="$(pwd | grep -o '.*dotfiles')"

# Load helper functions
#shellcheck source=/dev/null
source "$DOTFILES_FOLDER/lib/functions"

# ---------------------------------------------
# DevTools list
# ---------------------------------------------

devtools=(
    nodejs:latest:true
    java@zulu-24.28.87:true
    pnpm:latest:true
    ruby:latest:true
    python:3.9.18:true
)

# ---------------------------------------------
# Install process
# ---------------------------------------------

install() {
    info "Configuring MISE DevTools"
    
    for aux in "${devtools[@]}"; 
    do 
        IFS=':' read -r -a params <<< "$aux"
        local DEVTOOL_NAME=${params[0]}
        local DEVTOOL_VERSION=${params[1]}
        local SET_GLOBAL=${params[2]}

        info "Installing $DEVTOOL_NAME version $DEVTOOL_VERSION"

        # Add devtool
        mise install "$DEVTOOL_NAME"@"$DEVTOOL_VERSION"

        if [ "$SET_GLOBAL" == "true" ]
        then
            info "Sets version $DEVTOOL_VERSION for $DEVTOOL_NAME as global"
            
            # Set current node version as global version
            mise use -g "$DEVTOOL_NAME"@"$DEVTOOL_VERSION"
            
            success "Version $DEVTOOL_VERSION set as global for $DEVTOOL_NAME"
        fi

        success "MISE DevTool $DEVTOOL_NAME version $DEVTOOL_VERSION installed."
    done
}

execute() {
    install
}

execute  2>&1 | tee -a "$DOTFILE_LOG_FILE"
