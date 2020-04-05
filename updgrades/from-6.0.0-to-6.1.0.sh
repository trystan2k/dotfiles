#!/usr/bin/env bash

# Export dotfiles folder
DOTFILES_FOLDER="$(cd -P .. || exit; pwd)"

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

    info "Remove spectacle"
    brew cask uninstall spectacle

    info "Remove both 'PDFExpert', 'BetterSnapTool' and 'DaisyDisk' Manually (AppCleaner)"
    user "When done, press any key to continue"
}

_add() {
    # ---------------------------------------------
    # Install new tools
    # ---------------------------------------------

    info "Add step"

    info "Install rectangle"
    #shellcheck source=/dev/null
    . "$DOTFILES_FOLDER"/tools/rectangle.sh

    info "Install licecap"
    #shellcheck source=/dev/null
    . "$DOTFILES_FOLDER"/tools/licecap.sh

    info "Install skitch"
    #shellcheck source=/dev/null
    . "$DOTFILES_FOLDER"/tools/skitch.sh

    info "Install daisydisk"
    #shellcheck source=/dev/null
    . "$DOTFILES_FOLDER"/tools/daisydisk.sh

    info "Install pdf-expert"
    #shellcheck source=/dev/null
    . "$DOTFILES_FOLDER"/tools/pdf-expert.sh    

    info "Install flycut"
    #shellcheck source=/dev/null
    . "$DOTFILES_FOLDER"/tools/flycut.sh        
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