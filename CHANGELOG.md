# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## [Unreleased]

## [5.4.0] - 2019-12-23

### Added

- Add option to install (clone repo) via SSH or HTTPS

## [5.3.0] - 2019-12-23

### Added

- Add Cobalt2 theme profile for MacOS terminal

### Changed

- Change install script to create SSH key and clone repo via SSH

## [5.2.0] - 2019-12-23

### Added

- Add ASDF Java installation

### Changed

- Change ASDF Node.js installation version to 8.17.0

## [5.1.0] - 2019-12-23

### Added

- Add MacOS default setup via script (as requested in issue [#36](https://github.com/trystan2k/dotfiles/issues/36))
- Add new tools like postman, snapd, svn

### Changed

- Better manage script execution using absolute path

###

## [5.0.0] - 2019-12-22

### Changed

- Refactor to install tools in a smarter way
- Refactor how symlinks for dotfiles are created

### Added

- Add functions file with all common functions used everywhere
- Add logging system, so installation can be reviewed easily

### Removed

- Remove Zplug plugin manager

## [4.0.0] - 2019-12-19

### Added

- Add Zplugin to manage the ZSH plugins

### Removed

- Remove Zplug plugin manager

## [3.0.0] - 2019-12-17

### Added

- Add Zplug to manage the ZSH plugins
- Add ASDF to manage version of tools (Node, Java, Yarn, Ruby, etc)

### Removed

- Remove Oh-My-ZSH framework
- Remove NVM as node version manager in favor of ASDF

## [2.0.0] - 2019-12-15

### Added

- Add scripts to handle installations in OSX, Linux and WSL

## [1.15.0] - 2019-12-13

### Added

- Add script to do the symlinks independently 

## [1.14.0] - 2019-12-13

### Removed

- Remove settings in .gitconfig that were causing issues

## [1.13.0] - 2019-12-10

### Added

- Add gitignore file to be included in the symlink process
- Add common aliases in the .aliases file

### Changed

- Disable webGLRenderer in Hyper.js
- Change right margin in Hyper.js

## [1.12.0] - 2019-12-09

### Added

- Add config for [zsh-nvm](https://github.com/lukechilds/zsh-nvm) plugin
- Add [AppCleaner](https://freemacsoft.net/appcleaner/) install instructions via brew
- Add [Station](https://getstation.com/) install instructions via brew

### Changed

- Change how NVM installs, from brew to [zsh-nvm](https://github.com/lukechilds/zsh-nvm) plugin
- Change how `thefuck` plugin is loaded
- Move source of .aliases and .exports to beginning of the .zshrc file

## [1.11.0] - 2019-12-09

### Added

- Add instructions to install Sublime Text

### Changed

- Change Hyper.js to use WebGLRender

### Removed

- Remove Hyper.js plugins not used
- Remove Hyper.js settings not needed

## [1.10.0] - 2019-12-08

### Changed

- Change ZSH_THEME to [powerlevel10k](https://github.com/romkatv/powerlevel10k)

## [1.9.0] - 2019-12-08

### Added

- Add new Hyper theme `hyperterm-cobalt2-theme`
- Add new bootstrap and tools script to help to setup new machine

### Removed

- Remove cells-completation file, not in use

## [1.8.0] - 2019-10-29

### Added

- Add new Hyper plugin `hyper-font-ligatures`

### Changed

- Change Hyper default font to `Fira Code`

### Removed

- Remove .bash_profile as currently using ZSH
- Remove .fonts folder, as it is not needed anymore

## [1.7.0] - 2019-10-21

### Added

- Add new Oh-My-ZSH plugins, alias-finder and fzf
- Add new alias for initial commit

## [1.6.0] - 2019-10-13

### Added

- Add gitconfig configuration per folder

## [1.5.0] - 2019-10-12

### Changed

- Update zshrc to use correct home directory and remove not used plugins

## [1.4.0] - 2019-08-07

### Added

- Add global .gitignore file generated at [gitignore.io](http://www.gitignore.io/)

### Changed

- Update aliaes, gitconfig, hyper.js and zshrc files

## [1.3.0] - 2019-03-30

### Added

- Add config file for [Hyper terminal](https://hyper.is)

## [1.2.0] - 2018-07-17

### Added

- Add new files for Hack font

### Changed

- Add more plugins for Oh-My-Zsh
- Update ZSH folder to be relative
- Change gitconfig alias to be more OS independent.

### Removed

- Remove completion files not used anymore
- Remove bash files not used anymore

## [1.1.0] - 2017-07-01

### Added

- Instructions to install Oh My ZSH
- Config file for Oh My ZSH
- Font files to be used with Oh My ZSH

## [1.0.0] - 2017-07-01

### Added

- Initial release
- Add file for git configuration
- Add file for git-flow completion
- Add file for git completion
- Add file for cells completion
- Add file for bash prompt
- Add file for bash profile
- Add file for bash aliases
- Documentation.


[Unreleased]: https://github.com/trystan2k/dotfiles/compare/master...develop
[5.4.0]: https://github.com/trystan2k/dotfiles/compare/v5.3.0...v5.4.0
[5.3.0]: https://github.com/trystan2k/dotfiles/compare/v5.2.0...v5.3.0
[5.2.0]: https://github.com/trystan2k/dotfiles/compare/v5.1.0...v5.2.0
[5.1.0]: https://github.com/trystan2k/dotfiles/compare/v5.0.0...v5.1.0
[5.0.0]: https://github.com/trystan2k/dotfiles/compare/v4.0.0...v5.0.0
[4.0.0]: https://github.com/trystan2k/dotfiles/compare/v3.0.0...v4.0.0
[3.0.0]: https://github.com/trystan2k/dotfiles/compare/v2.0.0...v3.0.0
[2.0.0]: https://github.com/trystan2k/dotfiles/compare/v1.15.0...v2.0.0
[1.15.0]: https://github.com/trystan2k/dotfiles/compare/v1.14.0...v1.15.0
[1.14.0]: https://github.com/trystan2k/dotfiles/compare/v1.13.0...v1.14.0
[1.13.0]: https://github.com/trystan2k/dotfiles/compare/v1.12.0...v1.13.0
[1.12.0]: https://github.com/trystan2k/dotfiles/compare/v1.11.0...v1.12.0
[1.11.0]: https://github.com/trystan2k/dotfiles/compare/v1.10.0...v1.11.0
[1.10.0]: https://github.com/trystan2k/dotfiles/compare/v1.9.0...v1.10.0
[1.9.0]: https://github.com/trystan2k/dotfiles/compare/v1.8.0...v1.9.0
[1.8.0]: https://github.com/trystan2k/dotfiles/compare/v1.7.0...v1.8.0
[1.7.0]: https://github.com/trystan2k/dotfiles/compare/v1.6.0...v1.7.0
[1.6.0]: https://github.com/trystan2k/dotfiles/compare/v1.5.0...v1.6.0
[1.5.0]: https://github.com/trystan2k/dotfiles/compare/v1.4.0...v1.5.0
[1.4.0]: https://github.com/trystan2k/dotfiles/compare/v1.3.0...v1.4.0
[1.3.0]: https://github.com/trystan2k/dotfiles/compare/v1.2.0...v1.3.0
[1.2.0]: https://github.com/trystan2k/dotfiles/compare/v1.1.0...v1.2.0
[1.1.0]: https://github.com/trystan2k/dotfiles/compare/v1.0.0...v1.1.0
[1.0.0]: https://github.com/trystan2k/dotfiles/compare/master...v1.0.0