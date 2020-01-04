# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

if [ -f $HOME/.aliases ]; then
  . $HOME/.aliases
fi

if [ -f $HOME/.exports ]; then
  . $HOME/.exports
fi

### ZPLUGIN Section

# Zplugin Init
source "$HOME/.zplugin/bin/zplugin.zsh"
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin

setopt promptsubst

zplugin ice wait lucid
zplugin snippet OMZ::lib/git.zsh

zplugin ice wait atload"unalias grv" lucid
zplugin snippet OMZ::plugins/git/git.plugin.zsh

zplugin ice wait lucid
zplugin snippet OMZ::plugins/asdf/asdf.plugin.zsh

zplugin ice wait lucid
zplugin snippet OMZ::plugins/autojump/autojump.plugin.zsh

zplugin ice wait lucid
zplugin snippet OMZ::plugins/docker-compose/docker-compose.plugin.zsh

zplugin ice wait lucid
zplugin snippet OMZ::plugins/encode64/encode64.plugin.zsh

zplugin ice wait lucid
zplugin snippet OMZ::plugins/extract/extract.plugin.zsh

zplugin ice wait lucid
zplugin snippet OMZ::plugins/fzf/fzf.plugin.zsh

zplugin ice wait lucid
zplugin snippet OMZ::plugins/npm/npm.plugin.zsh

zplugin ice wait svn lucid
zplugin snippet OMZ::plugins/osx

zplugin ice wait lucid
zplugin load djui/alias-tips

zplugin ice wait lucid
zplugin load t413/zsh-background-notify       

zplugin ice wait lucid
zplugin load wfxr/forgit

zplugin ice wait lucid
zplugin load mattmc3/zsh-safe-rm

zplugin ice wait pick"h.sh" lucid
zplugin load paoloantinori/hhighlighter

zplugin ice wait as"completion" lucid
zplugin snippet OMZ::plugins/docker/_docker

zplugin ice wait blockf atpull'zplugin creinstall -q .' lucid
zplugin load zsh-users/zsh-completions

zplugin ice wait atinit"zpcompinit; zpcdreplay" lucid
zplugin load zdharma/fast-syntax-highlighting

zplugin ice wait atload"_zsh_autosuggest_start" lucid
zplugin load zsh-users/zsh-autosuggestions

zplugin ice lucid
zplugin load trystan2k/zsh-tab-title

zplugin ice lucid
zplugin load romkatv/powerlevel10k

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

# # Use completition menu
zstyle ':completion:*' menu yes select

# enable auto cd
setopt auto_cd