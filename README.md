# Thiago’s dotfiles

![GitHub version](https://badge.fury.io/gh/trystan2k%2Fdotfiles.svg)

![Build](https://github.com/trystan2k/dotfiles/workflows/CI-workflow/badge.svg)

## General Information

**Warning** The idea of this repository is to be a reference to others. **NEVER** run the installation script or any other script without
reading it first and adjust according to your needs. This is my very personal configuration and may not be suitable for you. I highly recommend
you to fork or clone and edit this repo before try it. I am not responsible for any problem it may cause to you. Use at your own risk!

This script setup a MacOS (tested in Catalina 10.15.x) or a Linux (tested in Elementary OS Hera 5.1). It basically install the same softwares
(if available for the OS) and do the dotfiles symlink to the home folder. Specificaly for MacOS, it also do some initial configuration like add
icons to the Dock, set languages, etc.

## Installation

### Option 1 - Install Script

The first and easier option to install is just execute the line in a terminal window:

`sh -c "$(curl -fsSL https://raw.githubusercontent.com/trystan2k/dotfiles/master/install.sh)"`

This will verify any missing dependency (like Git) and install it (or ask you to install, in MacOS case), create my personal folder, clone this
repository inside it and execute the bootstrap script

### Option 2 - Clone repo

Other option is to manually clone this repository and execute the bootstrap script.

a. Clone repo: `git clone https://github.com/trystan2k/dotfiles.git`

b. Go to script folders and execute bootstrap: `cd dotfiles\scripts; ./bootstrap.sh`

### Option 3 - Separated steps

Some of the configuration can be ran isolated. You can, for example, use the `tools.sh` script in the scripts folder to just install the
software listed there.

a. Install tools: `cd dotfiles\scripts; ./tools.sh`

b. Create/Recreate the symlinks to home folder: `cd dotfiles\scripts; ./symlinks.sh`

c. Use the Brewfile to install all tools via Brew `cd dotfiles\tools\macos|linux; brew bundle`

## Apps installed by the script

### Terminal

I am currently using [Hyper Terminal](https://hyper.is/).
The symlink step link the `.hyper.js` file with my current configuration, themes, etc.

**Theme** : [powerlevel10k theme](https://github.com/romkatv/powerlevel10k)
**Fonts** : [Nerd Font](https://github.com/ryanoasis/nerd-fonts) and [Fira Code](https://github.com/tonsky/FiraCode)

### Homebrew

I use [Homebrew](https://brew.sh/) to install packages I need in my MacOS. There are alternatives for Linux([https://linuxbrew.sh]) that can
also be used in Windows 10 with Windows Subsystem for Linux (WSL)

### Shell and Shell Manager

I use ZSH as my current shell and to manage its plugin I am using [Zinit](https://github.com/zdharma/zinit)

### Package Manager

I am using [ASDF](https://github.com/asdf-vm/asdf) as package manager for tools like `node/npm`, `yarn`, `java`, `ruby`, etc.
Some of initial configuration can be done executing the configuration script located at configure folder

`cd dotfiles\configure; ./asdf-plugins.sh`

## Apps that needs to be installed manually

## Settings that needs to be done manually

1. System Preferences -> Users & Groups -> Login Options => Change 'Show fast user switching menu as' to `Icon`
2. System Preferences -> Security & Privacy -> General => Change 'Require password' to `5 seconds`

### Cobalt Theme

1. Sublime

    ```bash
    Open package control tools → Command Palette and type Install Package

    Search for Cobalt2 and hit enter

    Lastly, open Preferences → Settings - User. Add the following two lines:

    "color_scheme": "Packages/Theme - Cobalt2/cobalt2.tmTheme",
    "theme": "Cobalt2.sublime-theme",
    ```

2. Slack

    ```bash
    Preferences → Sidebar Theme
    Paste #182E40,#1F4662,#1D425D,#FFFFFF,#988026,#FFFFFF,#2CDB00,#FEBD29
    ```

3. Alfred

<https://github.com/wesbos/Cobalt2-Alfred-Theme/blob/master/Cobalt2-alfred3.x.alfredappearance>

## Apps that are interesting but not sure if useful

1. Captin (<http://captin.strikingly.com/)> - Show Mac caps lock status
2. Mackup (<https://github.com/lra/mackup)> - Backup of Mac
3. Pock (<https://pock.dev/)> - Customize Touch Bar
4. Mosh (<https://mosh.org/)> - Mobile SSH client
5. Karabiner (<https://pqrs.org/osx/karabiner/)> - Remap keybinds

## Possible issues

1. For message `zsh compinit: insecure directories and files, run compaudit for list`, a possible solution is:

    ```bash
    cd /usr/local/share/
    sudo chmod -R 755 zsh
    sudo chown -R root:staff zsh
    ```

    Or use defined alias `fixZshPerms`

2. When use IDEs like VSCode, due to how direnv loads, the asdf tools are not loaded correctly. It this starts to happen,
just reload direnv:

    ```bash
    direnv reload
    ```

## Thanks to

This repo was based in the | [Mathias Bynens](https://mathiasbynens.be/) | one (<https://github.com/mathiasbynens/dotfiles).> I had remove some
setup I do not need and add some I found over internet.

The unassisted install script was based in the | [Mohammed Ajmal Siddiqui](https://github.com/ajmalsiddiqui/dotfiles) | one. I had added some
tools I used and remove some I don't.

The idea to split tools into separated files was inspired by | [Zach Holman](https://github.com/holman/dotfiles) |, which later was replaced
by Brewfile usage.

And many other folks that is always available to help in GitHub Issue, StackOverFlow questions, blog articles and sharing Gists with examples.
