#!/usr/bin/env bash

# Symlink files to home folder
link () {
	echo "This utility will symlink the files in this repo to the home directory"
	echo "Proceed? (y/n)"
	read resp
	if [ "$resp" = 'y' -o "$resp" = 'Y' ] ; then
		for file in $( ls -Ap ../ | grep -vE '\.exclude*|\.git$|.*.md|/$' ) ; do
			linkDotFile $file
		done
		echo "Symlinking complete"
	else
		echo "Symlinking cancelled by user"
		return 1
	fi
}

linkDotFile() {

	dest="${HOME}/${1}"
	dateStr=$(date +%Y-%m-%d-%H%M)
	filePath="$(lsf ../${1})"

	if [ -h ~/${1} ]; then
		# Existing symlink 
		echo "Removing existing symlink: ${dest}"
		rm ${dest} 

	elif [ -f "${dest}" ]; then
		# Existing file
		echo "Backing up existing file: ${dest}"
		mv ${dest} ${dest}.${dateStr}

	elif [ -d "${dest}" ]; then
		# Existing dir
		echo "Backing up existing dir: ${dest}"
		mv ${dest} ${dest}.${dateStr}
	fi

	echo "Creating new symlink: ${dest}"
	ln -sv ${filePath} ${dest}	  
}

link