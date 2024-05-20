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

    info "Removing Hyper terminal"
    brew uninstall hyper
    rm -rf "$HOME/Library/Services/Open in Hyper Terminal.workflow"
    rm "$HOME/.hyper.js"
    rm -rf "$HOME/.hyper_plugins"


    info "Uninstall exa"
    brew uninstall exa

    info "Uninstall youtube-dl"
    brew uninstall youtube-dl
}

_add() {
    # ---------------------------------------------
    # Install new tools
    # ---------------------------------------------

    info "Add step"

    info "Install Zellij"
    brew install zellij

    info "Install Kitty"
    brew install kitty

    info "Install dust"
    brew install dust

    info "Install eza"
    brew install eza

    info "Install piphero"
    brew install piphero

    info "Install bruno"
    brew install bruno

    info "Install yt-dlp"
    brew install yt-dlp

    info "Install pnpm"
    asdf plugin-add pnpm
    asdf install pnpm latest
    asdf global pnpm latest

    info "Install npkill"
    npm install --global npkill
}

_configure() {
    # ---------------------------------------------
    # Install new tools
    # ---------------------------------------------

    info "Configure step"

    info "Configure new Symlinks"
    . "$DOTFILES_FOLDER"/scripts/symlinks.sh
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