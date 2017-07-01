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

## Thanks to...

This repo was based in the | [Mathias Bynens](https://mathiasbynens.be/) | one (https://github.com/mathiasbynens/dotfiles). I had remove some setup I do not need and add some I found over internet.
