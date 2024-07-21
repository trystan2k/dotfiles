# Thiago’s dotfiles

![GitHub version](https://badge.fury.io/gh/trystan2k%2Fdotfiles.svg)

![Build](https://github.com/trystan2k/dotfiles/workflows/CI-workflow/badge.svg)

## General Information

**Warning** The idea of this repository is to be a reference to others. **NEVER** run the installation script or any other script without
reading it first and adjust according to your needs. This is my very personal configuration and may not be suitable for you.
I highly recommend you fork or clone and edit this repo before trying it. I am not responsible for any problem it may cause you. Use at your own risk!
This script set up a MacOS (tested in Sonoma 14.4.x).
It installs the softwares and do the dotfiles symlink to the home folder.
It also does some initial configuration like adding icons to the Dock, set languages, etc.

## Installation

### Option 1 - Install Script

The first and easier option to install is just execute the line in a terminal window:

`sh -c "$(curl -fsSL https://raw.githubusercontent.com/trystan2k/dotfiles/main/install.sh)"`

This will verify any missing dependency (like Git) and install it (or ask you to install, in MacOS case), create my personal folder, clone this
repository inside it, and execute the bootstrap script

### Option 2 - Clone the repo

Another option is to manually clone this repository and execute the bootstrap script.

a. Clone repo: `git clone https://github.com/trystan2k/dotfiles.git`

b. Go to script folders and execute bootstrap: `cd dotfiles\scripts; ./bootstrap.sh`

### Option 3 - Separated steps

Some of the configurations can be run isolated. You can, for example, use the `tools.sh` script in the scripts folder to just install the
software listed there.

a. Install tools: `cd dotfiles\scripts; ./tools.sh`

b. Create/Recreate the symlinks to the home folder: `cd dotfiles\scripts; ./symlinks.sh`

c. Use the Brewfile to install all tools via Brew `cd dotfiles\tools\macos; brew bundle`

## Post Installation

Due to some limitations, some tools need to be installed after the terminal is restarted, so it gets difficult to automatize.
After the reboot of the computer (after the dotfiles install script is finished or the last step is executed and the terminal restarted), execute the post-install script:

`cd dotfiles\scripts; ./post-install.sh`

## Apps installed by the script

### Terminal

I am currently using [Kitty Terminal](https://sw.kovidgoyal.net/kitty/).
The symlink step link the `kitty.conf` file with my current configuration, themes, etc.

**Theme**: [powerlevel10k theme](https://github.com/romkatv/powerlevel10k)
**Fonts**: [Nerd Font](https://github.com/ryanoasis/nerd-fonts) and [Fira Code](https://github.com/tonsky/FiraCode)

### Homebrew

I use [Homebrew](https://brew.sh/) to install packages I need in my MacOS.

### Shell and Shell Manager

I use ZSH as my current shell and to manage its plugin I am using [Zinit](https://github.com/zdharma/zinit)

### Package Manager

I am using [ASDF](https://github.com/asdf-vm/asdf) as the package manager for tools like `node/npm`, `yarn`, `java`, `ruby`, etc.
Some of the initial configurations can be done by executing the configuration script located in configure folder

`cd dotfiles\configure; ./asdf-plugins.sh`

### NPMRC

As I work with multiple projects, I need to have different configurations for NPM. To do that, I am using [NPMRC](https://www.npmjs.com/package/npmrc) to manage the different configurations.

To make it more automatically possible, with the help of `direnv`, it changes the npmrc when an environment variable called `NPMRC_NAME` is set.
After finishing the installation, need to create the default NPMRC config (based on the .npmrc file from symlink). To do this, just
execute `npmrc` in the terminal.

For each different project, create a npmrc entry for it, with `npmrc -c <name>` and then set the `NPMRC_NAME` variable to the name of the
npmrc entry in the .envrc file of the folder of the project.

## Apps that need to be installed manually

## Settings that need to be done manually

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
    "highlight_line": true,
    "indent_guide_options": [ "draw_normal", "draw_active" ],
    "highlight_modified_tabs": true,
    "line_padding_bottom": 1,
    "line_padding_top": 1,
    "wide_caret": true,
    "caret_extra_bottom": 2,
    "caret_extra_top": 2,
    "caret_extra_width": 3,
    "caret_style": "phase",
    "bold_folder_labels": true,
    ```

2. Slack

    ```bash
    Preferences → Sidebar Theme
    Paste #182E40,#1F4662,#1D425D,#FFFFFF,#988026,#FFFFFF,#2CDB00,#FEBD29
    ```

## Apps that are interesting but not sure if useful

1. Rust Desk (<https://rustdesk.com/>) - Remote connection
2. Sound Control (<https://staticz.com/soundcontrol/>) - Sound control
3. ZX - (<https://github.com/google/zx>) - Allow writing shells scripts with Javascript
4. Mackup (<https://github.com/lra/mackup>) - Backup of Mac
5. Karabiner (<https://pqrs.org/osx/karabiner/>) - Remap keybinds
6. Mosh (<https://mosh.org/>) - Mobile SSH client
7. Presentify (<https://apps.apple.com/app/id1507246666>) - Annotations in Screen $$
8. DisplayBuddy (<https://displaybuddy.app/>) - Control external monitors via software
9. Presentify (<https://presentify.compzets.com/>) - Allow annotations in screen
10. Ente (<https://ente.io/>) - Alternative to Google Photos
11. Podman (<https://podman.io/>) - Alternative to Docker

## Possible issues

1. For message `zsh compinit: insecure directories and files, run compaudit for list`, a possible solution is:

    ```bash
    cd /usr/local/share/
    sudo chmod -R 755 zsh
    sudo chown -R root:staff zsh
    ```

    Or use defined alias `fixZshPerms`

2. It is possible that `colorls` Ruby Gem fail to install in a fresh install due to folder permissions.
If that happens, just execute the ruby-gems.sh script after reboot.

    ```bash
    . configure/ruby-gems.sh
    ```

3. When using IDEs like VSCode, due to how direnv loads, the asdf tools are not loaded correctly. If this starts to happen,
just reload direnv:

    ```bash
    direnv reload
    ```

4. When installing Ruby via ASDF in an M1 Mac, add this to .exports.local file

    ```bash
        export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
        export LDFLAGS="-L/opt/homebrew/opt/readline/lib:$LDFLAGS"
        export CPPFLAGS="-I/opt/homebrew/opt/readline/include:$CPPFLAGS"
        export PKG_CONFIG_PATH="/opt/homebrew/opt/readline/lib/pkgconfig:$PKG_CONFIG_PATH"
        export optflags="-Wno-error=implicit-function-declaration"
        export LDFLAGS="-L/opt/homebrew/opt/libffi/lib:$LDFLAGS"
        export CPPFLAGS="-I/opt/homebrew/opt/libffi/include:$CPPFLAGS"
        export PKG_CONFIG_PATH="/opt/homebrew/opt/libffi/lib/pkgconfig:$PKG_CONFIG_PATH"
    ```

5. As of May 2024 the package control in Sublime Text 4 is not working properly. To be able to install it, need to download and install manually.

- download latest release from <https://github.com/wbond/package_control/releases>
- rename it to Package Control.sublime-package
- place it to ST's Installed Packages directory

## Thanks to

This repo was based on the | [Mathias Bynens](https://mathiasbynens.be/) | one (<https://github.com/mathiasbynens/dotfiles).>
I had remove some setup I do not need and added some I found over the internet.

The unassisted install script was based on the | [Mohammed Ajmal Siddiqui](https://github.com/ajmalsiddiqui/dotfiles) | one. I added some
tools I used and remove some I don't.

The idea to split tools into separate files was inspired by | [Zach Holman](https://github.com/holman/dotfiles) |, which later was replaced
by Brewfile usage.

And many other folks that are always available to help with GitHub Issue, StackOverFlow questions, blog articles, and sharing Gists with examples.
