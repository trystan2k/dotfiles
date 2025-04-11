#!/usr/bin/env bash

# dotfiles folder
DOTFILES_FOLDER="$(pwd | grep -o '.*dotfiles')"

# Load helper functions
#shellcheck source=/dev/null
source "$DOTFILES_FOLDER"/lib/functions

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

install_dotfiles () {
	info 'installing dotfiles'

	local overwrite_all=false backup_all=false skip_all=false

	for src in "$DOTFILES_FOLDER"/symlinks/.*;
	do
		local filename=''
		filename=$(basename "${src}")
		if [ ${#filename} -gt 2 ]; then
			dst="$HOME/$filename"
			filePath="${DOTFILES_FOLDER}/symlinks/${filename}"

			_link_file "$filePath" "$dst"
		fi
	done	

	info 'installing config files'

	local overwrite_all=false backup_all=false skip_all=false

	for src in "$DOTFILES_FOLDER"/symlinks/config/*;
	do
		local filename=''
		filename=$(basename "${src}")
		if [ ${#filename} -gt 2 ]; then
			dst="$HOME/.config/$filename"
			filePath="${DOTFILES_FOLDER}/symlinks/config/${filename}"

			_link_file "$filePath" "$dst"
		fi
	done
}

execute() {
	install_dotfiles
}

execute
