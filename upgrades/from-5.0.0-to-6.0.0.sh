#!/usr/bin/env bash

# Export dotfiles folder
DOTFILES_FOLDER="$(cd -P .. || exit; pwd)"
export DOTFILES_FOLDER

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
}

_add() {
    # ---------------------------------------------
    # Install new tools
    # ---------------------------------------------

    info "Add step"

    info "Install fx tool"
    #shellcheck source=/dev/null
    . "$DOTFILES_FOLDER"/tools/fx.sh

    info "Remove node dependency"
    brew uninstall node --ignore-dependencies

    info "Install Microsfot Edge"
    #shellcheck source=/dev/null
    . "$DOTFILES_FOLDER"/tools/microsoft-edge.sh

    info "Install Caffeine"
    #shellcheck source=/dev/null
    . "$DOTFILES_FOLDER"/tools/caffeine.sh

    info "Install ASDF Direnv plugin and set it to global"
    asdf plugin-add direnv
    asdf install direnv 2.20.0
    asdf global direnv 2.20.0
}

_configure() {
    # ---------------------------------------------
    # Install new tools
    # ---------------------------------------------

    info "Configure step"

    info "Execute symlinks"
    #shellcheck source=/dev/null
    . "$DOTFILES_FOLDER"/scripts/symlinks.sh

    info "Configure ASDF Direnv plugin"
    #shellcheck source=/dev/null
    . "$DOTFILES_FOLDER"/configure/direnv-config.sh

    info "Add Microsoft Edge icon in dock"
    defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>file:///Applications/Microsoft%20Edge.app</string><key>_CFURLStringType</key><integer>15</integer></dict></dict></dict>'
}

_cleanup () {
    # ---------------------------------------------
    # Cleanup and finish
    # ---------------------------------------------

    info "Cleanup step"

}

execute() {
    _remove
    _add
    _configure
    _cleanup
}

execute 2>&1 | tee -a "$DOTFILE_LOG_FILE"