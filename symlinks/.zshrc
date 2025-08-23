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


### Zinit Section

# Zinit Init
#shellcheck source=/dev/null
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
source "${ZINIT_HOME}/zinit.zsh"
autoload -Uz _zinit
# shellcheck disable=SC2034,SC2154
(( ${+_comps} )) && _comps[zinit]=_zinit

setopt promptsubst

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

zinit ice wait lucid
zinit snippet OMZ::lib/git.zsh

zinit ice wait atload"unalias grv" lucid
zinit snippet OMZ::plugins/git/git.plugin.zsh

zinit ice wait lucid
zinit snippet OMZ::plugins/autojump/autojump.plugin.zsh

zinit ice wait lucid
zinit snippet OMZ::plugins/docker-compose/docker-compose.plugin.zsh

zinit ice wait lucid
zinit snippet OMZ::plugins/encode64/encode64.plugin.zsh

zinit ice wait lucid
zinit snippet OMZ::plugins/extract/extract.plugin.zsh

zinit ice wait lucid
zinit load djui/alias-tips

zinit ice wait lucid
zinit load t413/zsh-background-notify       

zinit ice wait lucid
zinit load mattmc3/zsh-safe-rm

zinit ice wait pick"h.sh" lucid
zinit load paoloantinori/hhighlighter

zinit ice wait blockf atpull'zinit creinstall -q .' lucid
zinit load zsh-users/zsh-completions

zinit ice wait atinit"zpcompinit; zpcdreplay" lucid
zinit load zdharma-continuum/fast-syntax-highlighting

zinit ice wait atload"_zsh_autosuggest_start" lucid
zinit load zsh-users/zsh-autosuggestions

zinit ice wait lucid
zinit load trystan2k/zsh-npm-plugin

zinit ice wait lucid
zinit load trystan2k/zsh-tab-title

zinit ice wait lucid
zinit load gezalore/zsh-prioritize-cwd-history

zinit ice lucid
zinit load romkatv/powerlevel10k

### Powerline configuration
export POWERLEVEL9K_MODE="nerdfont-complete"
export POWERLEVEL9K_PROMPT_ON_NEWLINE=true

export POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon dir vcs )
export POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status background_jobs command_execution_time node_version)
export POWERLEVEL9K_NODE_VERSION_BACKGROUND='022'

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
export ZSH_THEME="powerlevel10k/powerlevel10k"

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

eval "$(mcfly init zsh)"

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

# Add Rancher Desktop bin into path
export PATH="$PATH:$HOME/.rd/bin"

if [ -f "$HOME"/.exports.path ]; then
  #shellcheck source=/dev/null
  . "$HOME"/.exports.path
fi

if [ -d "$PATH_TO_GLOBAL_NODE_MODULES" ]; then
  export PATH="$PATH_TO_GLOBAL_NODE_MODULES/node_modules/.bin:$PATH"
fi

# PERF: Uncoment these line and first one to get a performance report of terminal init
#zprof

# Task Master aliases added on 8/1/2025
alias tm='task-master'
alias taskmaster='task-master'
