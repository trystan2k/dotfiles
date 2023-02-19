#!/usr/bin/env bash

# https://espanso.org/docs/packages/basics/

# dotfiles folder
DOTFILES_FOLDER="$(pwd | grep -o '.*dotfiles')"

# Load helper functions
#shellcheck source=/dev/null
source "$DOTFILES_FOLDER/lib/functions"

_link_file () {
	dateStr=$(date +%Y-%m-%d-%H%M)

	local src=$1 dst=$2

	local overwrite='' backup='' skip='' action=''

	if [ -f "$dst" ] || [ -d "$dst" ] || [ -L "$dst" ]
	then

		if [ "$overwrite_all" == "false" ] && [ "$backup_all" == "false" ] && [ "$skip_all" == "false" ]
		then

			currentSrc="$(readlink "$dst")"

			if [ "$currentSrc" == "$src" ]
			then

				skip=true;

			else

				user "File already exists: $dst ($(basename "$src")), what do you want to do?\n\
				[s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all?"
				read -r -n 1 action

				case "$action" in
					o )
						overwrite=true;;
					O )
						overwrite_all=true;;
					b )
						backup=true;;
					B )
						backup_all=true;;
					s )
						skip=true;;
					S )
						skip_all=true;;
					* )
					;;
				esac

			fi

		fi

		overwrite=${overwrite:-$overwrite_all}
		backup=${backup:-$backup_all}
		skip=${skip:-$skip_all}

		if [ "$overwrite" == "true" ]
		then
			success "Removing $dst"
			rm -rf "$dst"
		fi

		if [ "$backup" == "true" ]
		then
			success "Backing up file $dst as ${dst}.${dateStr}"
			mv "$dst" "${dst}.${dateStr}"
		fi

		if [ "$skip" == "true" ]
		then
			success "Skiping $src"
		fi
	fi

	if [ "$skip" != "true" ]  # "false" or empty
	then
		success "Linking $src to $dst"
		ln -sv "$src" "$dst"
	fi
}

# ---------------------------------------------
# Install process
# ---------------------------------------------

preInstall() {
    info "Executing pre-installation steps..."
}

postInstall() {
    info "Executing post-install steps..."
}

install() {
    info "Installing ScriptKit Scripts"

    local overwrite_all=false backup_all=false skip_all=false

    _link_file "${DOTFILES_FOLDER}/configure/scriptkit/" "${HOME}/.kenv/kenvs/thiago"
}

execute() {
    preInstall
    install
    postInstall
}

execute  2>&1 | tee -a "$DOTFILE_LOG_FILE"
