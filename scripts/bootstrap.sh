#!/usr/bin/env bash

# Export dotfiles folder
DOTFILES_FOLDER="$(pwd | grep -o '.*dotfiles')"

#shellcheck source=/dev/null
source "$DOTFILES_FOLDER"/symlinks/.exports
#shellcheck source=/dev/null
source "$DOTFILES_FOLDER"/lib/functions

# Initialize a few things
_init () {
	info "Making a Projects folder in $PATH_TO_PROJECTS if it doesn't already exist"
	mkdir -p "$PATH_TO_PROJECTS"
}

_link () {
  #shellcheck source=/dev/null
	. "$DOTFILES_FOLDER"/scripts/symlinks.sh
}

_install_tools () {
  #shellcheck source=/dev/null
  . "$DOTFILES_FOLDER"/scripts/tools.sh
}

_configure() {

  if [[ $OSTYPE == darwin* ]] ; then
    # MacOS defaults
    #shellcheck source=/dev/null
    . "$DOTFILES_FOLDER"/macos/defaults.sh

    # MacOS Quick Actions
    #shellcheck source=/dev/null
    . "$DOTFILES_FOLDER"/macos/quick-actions.sh

  fi

}

_restart() {
  if [[ $OSTYPE == darwin* ]] ; then
    user "Restarting system to apply settings..."
    osascript -e 'tell app "loginwindow" to «event aevtrrst»'
  fi
}

execute() {
  _init
  _install_tools
  _link
  _configure
  _restart
} 

execute 2>&1 | tee -a "$DOTFILE_LOG_FILE"
