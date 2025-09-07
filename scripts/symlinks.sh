#!/usr/bin/env bash

# dotfiles folder
DOTFILES_FOLDER="$(pwd | grep -o '.*dotfiles')"

# Load helper functions
#shellcheck source=/dev/null
source "$DOTFILES_FOLDER"/lib/functions

install_dotfiles () {
	info 'installing dotfiles'

	for src in "$DOTFILES_FOLDER"/symlinks/.*;
	do
		local filename=''
		filename=$(basename "${src}")
		if [ ${#filename} -gt 2 ]; then
			dst="$HOME/$filename"
			filePath="${DOTFILES_FOLDER}/symlinks/${filename}"

			link_file "$filePath" "$dst"
		fi
	done	

	info 'installing config files'

	for src in "$DOTFILES_FOLDER"/symlinks/config/*;
	do
		local filename=''
		filename=$(basename "${src}")
		if [ ${#filename} -gt 2 ]; then
			dst="$HOME/.config/$filename"
			filePath="${DOTFILES_FOLDER}/symlinks/config/${filename}"

			link_file "$filePath" "$dst"
		fi
	done
}

execute() {
	install_dotfiles
}

execute
