# Thiago’s dotfiles

[![v5.7.0](https://img.shields.io/badge/version-5.7.0-brightgreen.svg)](https://github.com/trystan2k/dotfiles/tree/v5.7.0)

## General Information

**Warning** The idea of this repository is to be a reference to others. **NEVER** run the installation script or any other script without reading it first and adjust according to your needs. This is my very personal configuration and may not be suitable for you. I highly recommend you to fork or clone and edit this repo before try it. I am not responsible for any problem it may cause to you. Use at your own risk!

This script setup a MacOS (tested in Catalina 10.15.x) or a Linux (tested in Elementary OS Hera 5.1). It basically install the same softwares (if available for the OS) and do the dotfiles symlink to the home folder. Specificaly for MacOS, it also do some initial configuration like add icons to the Dock, set languages, etc.

## Installation

### Option 1 - Install Script

The first and easier option to install is just execute the line in a terminal window:

`sh -c "$(curl -fsSL https://raw.githubusercontent.com/trystan2k/dotfiles/master/install.sh)"`

This will verify any missing dependency (like Git) and install it (or ask you to install, in MacOS case), create my personal folder, clone this repository inside it and execute the bootstrap script

### Option 2 - Clone repo

Other option is to manually clone this repository and execute the bootstrap script.

a. Clone repo: `git clone https://github.com/trystan2k/dotfiles.git`

b. Go to script folders and execute bootstrap: `cd dotfiles\scripts; ./bootstrap.sh`

### Option 3 - Separated steps

Some of the configuration can be ran isolated. You can, for example, use the `tools.sh` script in the scripts folder to just install the software listed there.

a. Install tools: `cd dotfiles\scripts; ./tools.sh`

b. Create/Recreate the symlinks to home folder: `cd dotfiles\scripts; ./symlinks.sh`

c. Install any of the tools from tools folder executing the correspondent script, like for example Google Chrome: `cd dotfiles\tools; ./google-chrome.sh`

## Apps installed by the script

### Terminal

I am currently using [Hyper Terminal](https://hyper.is/).
The symlink step link the `.hyper.js` file with my current configuration, themes, etc.

**Theme** : [powerlevel10k theme](https://github.com/romkatv/powerlevel10k)
**Fonts** : [Nerd Font](https://github.com/ryanoasis/nerd-fonts) and [Fira Code](https://github.com/tonsky/FiraCode)

### Homebrew

I use [Homebrew](https://brew.sh/) to install packages I need in my MacOS. There are alternatives for Linux([https://linuxbrew.sh]) that can also be used in Windows 10 with Windows Subsystem for Linux (WSL)

### Shell and Shell Manager

I use ZSH as my current shell and to manage its plugin I am using [Zplugin](https://github.com/zdharma/zplugin)

### Package Manager

I am using [ASDF]() as package manager for tools like `node/npm`, `yarn`, `java`, `ruby`, etc. 
Some of initial configuration can be done executing the configuration script located at configure folder

`cd dotfiles\configure; ./asdf.sh`

## Apps that needs to be installed manually

1. BetterSnapTool (https://apps.apple.com/es/app/bettersnaptool/id417375580?mt=12)
2. DaisyDisk (https://daisydiskapp.com/)
3. PDF Expert (https://pdfexpert.com/)

## Settings that needs to be done manually

1. System Preferences -> Users & Groups -> Login Options => Change 'Show fast user switching menu as' to `Icon`
2. System Preferences -> Security & Privacy -> General => Change 'Require password' to `5 seconds`

## Thanks to...

This repo was based in the | [Mathias Bynens](https://mathiasbynens.be/) | one (https://github.com/mathiasbynens/dotfiles). I had remove some setup I do not need and add some I found over internet.

The unassisted install script was based in the | [Mohammed Ajmal Siddiqui](https://github.com/ajmalsiddiqui/dotfiles) | one. I had added some tools I used and remove some I don't.

The idea to split tools into separated files was inspired by | [Zach Holman](https://github.com/holman/dotfiles) |.

And many other folks that is always available to help in GitHub Issue, StackOverFlow questions, blog articles and sharing Gists with examples.