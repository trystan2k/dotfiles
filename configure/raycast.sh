#!/usr/bin/env bash

# https://github.com/raycast/script-commands

# dotfiles folder
DOTFILES_FOLDER="$(pwd | grep -o '.*dotfiles')"

# Load helper functions
#shellcheck source=/dev/null
source "$DOTFILES_FOLDER/lib/functions"

SCRIPT_COMMANDS_FOLDER="$HOME"/Documents/Thiago/Repos/script-commands

# Clone Scripts repository
if [ ! -d "$SCRIPT_COMMANDS_FOLDER" ]; then 
    git clone git@github.com:raycast/script-commands.git "$SCRIPT_COMMANDS_FOLDER"
fi

ENABLE_SCRIPTS_FOLDER_DST="$SCRIPT_COMMANDS_FOLDER"/_enabled-commands
ENABLE_SCRIPTS_FOLDER_SRC="$SCRIPT_COMMANDS_FOLDER"/commands

scripts=(
    browsing/shorten-url.sh
    communication/emojis/emojis-search.sh
    developer-utils/base64-decode-input.sh
    developer-utils/base64-encode-input.sh
    developer-utils/prettify-json.sh
    developer-utils/brew/brew-install.sh
    developer-utils/brew/brew-doctor.sh
    developer-utils/brew/brew-outdated.sh
    developer-utils/brew/brew-update.sh
    developer-utils/brew/brew-upgrade.sh
    google-maps/google-maps.sh
    navigation/open-documents.sh
    navigation/open-downloads.sh
    navigation/open-home.sh
    web-searches/giphy.sh
    web-searches/google-search.sh
    web-searches/youtube.sh
)

install() {
    # Copy Scripts
    for script in "${scripts[@]}";
    do
        info "Copying script $script"
        cp "$ENABLE_SCRIPTS_FOLDER_SRC"/"$script" "$ENABLE_SCRIPTS_FOLDER_DST"
    done
}

execute() {
    install
}

execute  2>&1 | tee -a "$DOTFILE_LOG_FILE"


