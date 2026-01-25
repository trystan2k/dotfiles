# PERF: Uncoment these line and last one to get a performance report of terminal init
#zmodload zsh/zprof

# Avoid duplicate entries in PATH
typeset -U PATH

# Load brew from /opt/homebrew/bin/brew if in Mac M1
if [[ $(uname -m) == 'arm64' ]]; then
    if [ -d /opt/homebrew/bin ]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
fi

if [ -f "$HOME"/.exports ]; then
  #shellcheck source=/dev/null
  . "$HOME"/.exports
fi

if [ -f "$HOME"/.aliases ]; then
  #shellcheck source=/dev/null
  . "$HOME"/.aliases
fi

# source antidote
source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh

# initialize plugins statically with ${ZDOTDIR:-~}/.zsh_plugins.txt
antidote load

### Powerline configuration
export POWERLEVEL9K_MODE="nerdfont-complete"
export POWERLEVEL9K_PROMPT_ON_NEWLINE=true

export POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon dir vcs )
export POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status background_jobs command_execution_time node_version)
export POWERLEVEL9K_NODE_VERSION_BACKGROUND='022'

# Setup bgnotify plugin
export bgnotify_threshold=4  ## set your own notification threshold

function bgnotify_formatted {
  ## $1=exit_status, $2=command, $3=elapsed_time
  [ "$1" -eq 0 ] && title="Success!" || title="Failed!"
  bgnotify "$title -- after $3 s" "$2";
}

# # Use completition menu
zstyle ':completion:*' menu yes select

# enable auto cd
setopt auto_cd

# ZSH_HISTORY Setup
setopt HIST_VERIFY
setopt EXTENDED_HISTORY      # save each command's beginning timestamp and the duration to the history file
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY    # this is default, but set for share_history
setopt SHARE_HISTORY         # Share history file amongst all Zsh sessions

eval "$(mise activate zsh)"

# Handle nppmrc config according to ENV variable
set-npmrc-config-hook() {

  if ! type npmrc > /dev/null; then
    return
  fi

  if [ -z ${NPMRC_NAME+x} ]; then 
    npmrc default > /dev/null;
  else 
    npmrc $NPMRC_NAME > /dev/null; 
  fi
}

autoload -U add-zsh-hook
add-zsh-hook chpwd set-npmrc-config-hook

# Edit the current command line in $EDITOR
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line

if [ -f "$HOME"/.exports.path ]; then
  #shellcheck source=/dev/null
  . "$HOME"/.exports.path
fi

if [ -d "$PATH_TO_GLOBAL_NODE_MODULES" ]; then
  export PATH="$PATH_TO_GLOBAL_NODE_MODULES/node_modules/.bin:$PATH"
fi

# PERF: Uncoment these line and first one to get a performance report of terminal init
#zprof
export PATH="/Users/trystan2k/.openmux/bin:$PATH"
