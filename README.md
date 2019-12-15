# Thiago’s dotfiles

[![v2.0.0](https://img.shields.io/badge/version-2.0.0-brightgreen.svg)](https://github.com/trystan2k/dotfiles/tree/v2.0.0)

## General Information

**Warning:** If you want to give these dotfiles a try, you should first fork this repository, review the code, and remove things you don’t want or need. Don’t blindly use my settings unless you know what that entails. Use at your own risk!

You can fork this repo and copy the files to you home folder

## Unassisted installation

The script name `bootstrap.exclude.sh` can perform the configuration of the dotfiles and installation of some useful tools in a Unassisted way. It will do the following steps (more details can be found reading the file)

1. Install tools defined in `tools.exclude.sh`, including Homebrew, Hyper.js, Google Chrome, Firefox, Paralles, Oh-My-ZSH, etc
2. Create a symlink with all files in this folder (except the git related, markdowns and the ones with `exclude` in the name) to the user folder, so any change in this repository will be automatically synced with the user configuration.

Executing the unassisted configuration install all items listed below. 

If you want to have control on what is installed (or which order), you can edit the `tools.exclude.sh` file, or follow the instructions bellow.

## Terminal

I am currently using [Hyper Terminal](https://hyper.is/).
You can use the same configuration I have currently, doing the following:

- Copy `hyper.js` file from dotfiles project to user home folder

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

### Install ([powerlevel10k theme](https://github.com/romkatv/powerlevel10k))

```bash
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
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

The unassisted install script was based in the | [Mohammed Ajmal Siddiqui](https://github.com/ajmalsiddiqui/dotfiles) | one. I had added some tools I used and remove some I don't.
