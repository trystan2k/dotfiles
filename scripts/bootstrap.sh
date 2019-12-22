#!/usr/bin/env bash

source ../symlinks/.exports
source ../configure/functions

# Initialize a few things
_init () {
	info "Making a Projects folder in $PATH_TO_PROJECTS if it doesn't already exist"
	mkdir -p "$PATH_TO_PROJECTS"
}

_link () {
	sh symlinks.sh
}

_install_tools () {
  sh tools.sh
}

_default_shell() {
  user "Set default shell to ZSH"
  chsh -s $(which zsh)
}

_configure() {

  # MacOS defaults
  sh ../macos/defaults.sh
}

execute() {
  _init
  _install_tools
  _link
  _configure
  _default_shell
} 

execute 2>&1 | tee -a $DOTFILE_LOG_FILE
