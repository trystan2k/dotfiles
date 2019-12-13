#!/bin/sh

source .exports
source .aliases
source .macos

# Initialize a few things
init () {
	echo "Making a Projects folder in $PATH_TO_PROJECTS if it doesn't already exist"
	mkdir -p "$PATH_TO_PROJECTS"
}

# Install tools
install_tools () {
	if [ $( echo "$OSTYPE" | grep 'darwin' ) ] ; then
		echo "This utility will install useful utilities using Homebrew/Git/others"
		echo "Proceed? (y/n)"
		read resp
		# TODO - regex here?
		if [ "$resp" = 'y' -o "$resp" = 'Y' ] ; then
			echo "Installing useful stuff using brew/git/others. This may take a while..."
			sh tools.exclude.sh
		else
			echo "Brew installation cancelled by user"
		fi
	else
		echo "Skipping installations using Homebrew/Git/Others because MacOS was not detected..."
	fi
}

link () {
	sh symlinks.exclude.sh
}

init
install_tools
link