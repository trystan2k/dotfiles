#!/usr/bin/env bash

source ../symlinks/.exports
source ../configure/functions

# Initialize a few things
_init () {
	info "Making a Projects folder in $PATH_TO_PROJECTS if it doesn't already exist"
	mkdir -p "$PATH_TO_PROJECTS"
}

_link () {
	. symlinks.sh
}

_install_tools () {
  . tools.sh
}

_default_shell() {
  user "Set default shell to ZSH"
  chsh -s $(which zsh)
}

_configure() {

  if [[ $OSTYPE == darwin* ]] ; then
    # MacOS defaults
    sh ../macos/defaults.sh
  fi

}

_restart() {
  user "Restarting system to apply settings..."
  osascript -e 'tell app "loginwindow" to «event aevtrrst»'
}

execute() {
  _init
  _install_tools
  _link
  _configure
  _default_shell
  _restart
} 

execute 2>&1 | tee -a $DOTFILE_LOG_FILE
