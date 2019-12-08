# Thiago’s dotfiles

[![v1.9.1](https://img.shields.io/badge/version-1.9.1-brightgreen.svg)](https://github.com/trystan2k/dotfiles/tree/v1.9.1)

# General Information

**Warning:** If you want to give these dotfiles a try, you should first fork this repository, review the code, and remove things you don’t want or need. Don’t blindly use my settings unless you know what that entails. Use at your own risk!

You can fork this repo and copy the files to you home folder

# Terminal

I am currently using [Hyper Terminal](https://hyper.is/).
You can use the same configuration I have currently, doing the following:


- Copy `hyper.js` file from dotfiles project to user home folder
- Clone ([hyper-native plugin](https://github.com/trystan2k/hyper-native)) inside hyper_plugins/local folder


## Homebrew

I use [Homebrew](https://brew.sh/) to install packages I need in my MacOS. There are alternatives for Linux([https://linuxbrew.sh]) that can also be used in Windows 10 with Windows Subsystem for Linux (WSL)

### Install [Homebrew](https://brew.sh/)

```bash
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

## Oh my ZSH 

I have OhMyZSH installed, which is very useful (specially because of its plugins). So here are the instructions to have it installed and configured in the same way I have.

### Install zsh

```bash
  brew install zsh zsh-autosuggestions zsh-syntax-highlighting thefuck autojump
```

### Install ([OhMyZSH](https://github.com/robbyrussell/oh-my-zsh))

```bash
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

### Install zsh-syntax-highlighting plugin

```bash
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

### Install zsh-autosuggestions plugin

```bash
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

### Install ([powerlevel9k theme](https://github.com/Powerlevel9k/powerlevel9k))

```bash
  git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
```

### Install ([Nerd Font](https://github.com/ryanoasis/nerd-fonts))

```bash
  brew tap homebrew/cask-fonts
  brew cask install font-hack-nerd-font
```

### Install fire code

```bash
  brew tap homebrew/cask-fonts
  brew cask install font-fira-code
```

### Install plugin for ([bgnotify](https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/bgnotify))

```bash
  brew install terminal-notifier
```

### Install ([fzf plugin](https://github.com/junegunn/fzf))

```bash
  brew install fzf
```

### Install tree plugin

```bash
  brew install tree
```

### Copy ZSH config file

```bash
  Copy `.zshrc` file from dotfiles project to user home folder
```

## Thanks to...

This repo was based in the | [Mathias Bynens](https://mathiasbynens.be/) | one (https://github.com/mathiasbynens/dotfiles). I had remove some setup I do not need and add some I found over internet.
