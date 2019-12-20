#!/usr/bin/env bash

source ../.exports
source ../configure/functions

# Initialize a few things
init () {
	info "Making a Projects folder in $PATH_TO_PROJECTS if it doesn't already exist"
	mkdir -p "$PATH_TO_PROJECTS"
}

link () {
	sh symlinks.sh
}

install_tools () {
  sh tools.sh
}

default_shell() {
  user "Set default shell to ZSH"
  chsh -s $(which zsh)
}

configure() {

  # MacOS defaults
  sh macos/default.sh
}

# Redirect logs to file
startLogRedirect 

init
install_tools
link
configure
default_shell

# Restore log redirection
stopLogRedirect

