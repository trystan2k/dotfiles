#!/usr/bin/env bash

# Export dotfiles folder
DOTFILES_FOLDER="$(pwd | grep -o '.*dotfiles')"

#shellcheck source=/dev/null
source "$DOTFILES_FOLDER"/symlinks/.exports

# Load functions
#shellcheck source=/dev/null
source "$DOTFILES_FOLDER"/lib/functions

_remove() {
    # ---------------------------------------------
    # Uninstall not needed anymore
    # ---------------------------------------------

    info "Remove step"
    brew uninstall --ignore-dependencies node

}

_add() {
    # ---------------------------------------------
    # Install new tools
    # ---------------------------------------------

    info "Add step"   
}

_configure() {
    # ---------------------------------------------
    # Install new tools
    # ---------------------------------------------

    info "Configure step"

    info "Install new asdf-plugins version"
    asdf install nodejs 14.8.0
    asdf install java adoptopenjdk-14.0.2+12
    asdf install yarn 1.22.4
    asdf install direnv 2.21.3

    asdf global nodejs 14.8.0
    asdf global java adoptopenjdk-14.0.2+12
    asdf global yarn 1.22.4
    asdf global direnv 2.21.3

    info "Uninstall old versions of asdf-plugins"

    asdf install nodejs 12.14.0
    asdf install nodejs 8.17.0
    asdf install java adopt-openjdk-13+33
    asdf install java adopt-openjdk-8u232-b09
    asdf install yarn 1.21.1
    asdf install direnv 2.21.2    
}

_cleanup () {
    # ---------------------------------------------
    # Cleanup and finish
    # ---------------------------------------------

    info "Cleanup step"

    #shellcheck source=/dev/null
    . "$DOTFILES_FOLDER"/macos/cleanup.sh
}

execute() {
    _remove
    _add
    _configure
    _cleanup
}

execute 2>&1 | tee -a "$DOTFILE_LOG_FILE"