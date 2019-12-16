# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

if [ -f $HOME/.aliases ]; then
  . $HOME/.aliases
fi

if [ -f $HOME/.exports ]; then
  . $HOME/.exports
fi

### ZPLUG Section

# Zplug Init
source $ZPLUG_HOME/init.zsh

# Zplug Self Manage
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# Zplug Plugins
zplug "djui/alias-tips"
zplug "plugins/asdf",   from:oh-my-zsh
zplug "plugins/autojump",   from:oh-my-zsh
zplug "t413/zsh-background-notify"
zplug "plugins/docker",   from:oh-my-zsh
zplug "plugins/docker-compose",   from:oh-my-zsh
zplug "plugins/encode64",   from:oh-my-zsh
zplug "plugins/extract",   from:oh-my-zsh
zplug "wfxr/forgit"
zplug "plugins/fzf",   from:oh-my-zsh
zplug "plugins/git",   from:oh-my-zsh
zplug "plugins/npm",   from:oh-my-zsh
zplug "plugins/osx",   from:oh-my-zsh
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "mattmc3/zsh-safe-rm"
zplug "zdharma/fast-syntax-highlighting"

# Zplug Theme
zplug "romkatv/powerlevel10k", as:theme, depth:1

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose

### Powerline configuration
POWERLEVEL9K_MODE="nerdfont-complete"
POWERLEVEL9K_PROMPT_ON_NEWLINE=true

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(user dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status background_jobs command_execution_time)

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Setup bgnotify plugin
bgnotify_threshold=4  ## set your own notification threshold

function bgnotify_formatted {
  ## $1=exit_status, $2=command, $3=elapsed_time
  [ $1 -eq 0 ] && title="Success!" || title="Failed!"
  bgnotify "$title -- after $3 s" "$2";
}
