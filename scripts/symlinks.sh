#!/usr/bin/env bash

source ../configure/functions

cd "$(dirname "$0")/.."
DOTFILES_ROOT=$(pwd -P)

_link_file () {
	dateStr=$(date +%Y-%m-%d-%H%M)

	local src=$1 dst=$2

	local overwrite= backup= skip=
	local action=

	if [ -f "$dst" -o -d "$dst" -o -L "$dst" ]
	then

		if [ "$overwrite_all" == "false" ] && [ "$backup_all" == "false" ] && [ "$skip_all" == "false" ]
		then

			local currentSrc="$(readlink $dst)"

			if [ "$currentSrc" == "$src" ]
			then

				skip=true;

			else

				user "File already exists: $dst ($(basename "$src")), what do you want to do?\n\
				[s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all?"
				read -n 1 action

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
		success "Linking $1 to $2"
		ln -sv "$1" "$2"
	fi
}

install_dotfiles () {
	info 'installing dotfiles'

	local overwrite_all=false backup_all=false skip_all=false

	for src in $(ls -Ap ./symlinks)
	do
		dst="$HOME/$(basename "${src}")"
		filePath="${DOTFILES_ROOT}/symlinks/${src}"

		_link_file "$filePath" "$dst"
	done	
}

execute() {
	install_dotfiles
}

execute 2>&1 | tee -a $DOTFILE_LOG_FILE
