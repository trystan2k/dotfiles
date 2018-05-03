# Thiago’s dotfiles

[![v1.0.0](https://img.shields.io/badge/version-1.0.0-brightgreen.svg)](https://github.com/trystan2k/dotfiles/tree/v1.0.0)

## Installation

**Warning:** If you want to give these dotfiles a try, you should first fork this repository, review the code, and remove things you don’t want or need. Don’t blindly use my settings unless you know what that entails. Use at your own risk!

You can fork this repo and copy the files to you home folder

For the bash completion files, you can just download each bash file and load it.

For example:

```bash
curl https://raw.githubusercontent.com/trystan2k/dotfiles/master/git-completion.bash -o ~/.git-completion.bash
```
And then edit your .bash_profile file with the following:

```bash
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi
```

### Oh my ZSH 

To install and configure OhMyZSH, follow the instructions:

# Install ZSH

First, you need to install ZSH terminal

**MacOS**

brew install zsh (If you don´t have Homebrew, follow the insttructions here: https://brew.sh/)

**Ubuntu**

sudo apt-get install zsh

# Set ZSH as default terminal

chsh -s $(which zsh)

# Install OhMyZSH

curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh; zsh

# Setup

**Plugins**

Here are the plugins we have setup for now:

zsh-syntax-highlighting: git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting 

zsh-autosuggestions: git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions

fzf: git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install

**Themes and Fonts**

Here are the theme and font we have setup:

 Nerd Fonts: https://nerdfonts.com/#downloads
  mkdir ~/.fonts && cd ~/.fonts
  unzip ~/Downloads/<font_name>.zip

Powerlevel9k: git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

## Thanks to...

This repo was based in the | [Mathias Bynens](https://mathiasbynens.be/) | one (https://github.com/mathiasbynens/dotfiles). I had remove some setup I do not need and add some I found over internet.
