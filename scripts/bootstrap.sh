#!/bin/sh

source ../.exports
source ../.aliases

# Initialize a few things
init () {
	echo "Making a Projects folder in $PATH_TO_PROJECTS if it doesn't already exist"
	mkdir -p "$PATH_TO_PROJECTS"
}

link () {
	sh symlinks.sh
}

install_tools () {

  echo "This utility will install useful tools using Homebrew/Git/others, according to the OS"
  echo "Proceed? (y/n)"
  read resp
  if [ "$resp" = 'y' -o "$resp" = 'Y' ] ; then

    case "$OSTYPE" in
      darwin*)  
        echo "MacOS detected. Start installing tools..."
        sh tools-macos.sh 
      linux*)   
        if grep -q Microsoft /proc/version; then
            echo "Linux on Windows (WSL) detected. Start installing tools..."
            sh tools-wsl.sh
        else
            echo "Linux detected. Start installing tools..."
            sh tools-linux.sh
        fi    
      *)        
        echo "unknown: $OSTYPE"
    esac
  else
    echo "Tools installation cancelled by user"
	fi
}


init
install_tools
link