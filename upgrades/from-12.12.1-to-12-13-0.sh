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

    # Convert crash report to be a notification
    info "Others - Convert crash report to be a notification"
    defaults write com.apple.CrashReporter UseUNC 1

    # Disable PowerChime sound
    info "Others - Disable PowerChime sound"
    defaults write com.apple.PowerChime ChimeOnNoHardware -bool TRUE;
    killall PowerChime

    # Enable Touch ID for sudo
    info "Others - Enable Touch ID for sudo"
    sudo sed -i .bak $'2i\\\nauth       sufficient     pam_tid.so\\\n' /etc/pam.d/sudo
}

_configure() {
    # ---------------------------------------------
    # Install new tools
    # ---------------------------------------------

    info "Configure step"
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