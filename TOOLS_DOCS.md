# Tools Documentation

This document will have support documentation about the tools installed.

## All

Some applications requires to be moved to the App Folder and for this to work the terminal need to have permissions to install Apps.

This can be done by going to System Preferences > Privacy & Security > App Management and add the terminal to the list.

## Hub

hub is an extension to command-line git that helps you do everyday GitHub tasks without ever leaving the terminal.

```bash
    # clone your own project
    hub clone dotfiles
    → git clone git://github.com/YOUR_USER/dotfiles.git

    # clone another project
    hub clone github/hub
    → git clone git://github.com/github/hub.git

    # fast-forward all local branches to match the latest state on the remote
    cd myproject
    hub sync

    # create a repo to host a new project on GitHub
    git init
    git add .
    git commit -m "And so, it begins."
    hub create
    → (creates a new GitHub repository with the name of the current directory)
    git push -u origin HEAD

    # check the CI status for this branch
    hub ci-status --verbose

    # open a pull request for the branch you've just pushed
    hub pull-request
    → (opens a text editor for your pull request message)
```

<https://hub.github.com/>

## Password Store

pass is a very simple password store that keeps passwords inside gpg2(1) encrypted files inside a simple directory tree residing at ~/.password-store.
The pass utility provides a series of commands for manipulating the password store, allowing the user to add, remove, edit, synchronize, generate, and manipulate passwords

```bash
    pass init "$masterpass"

    # To insert a new password
    pass insert Category/Name

    # To delete a password
    pass rm Category/Name

    # To edit a password
    pass edit Category/Name

    # To see current password
    pass Category/Name
```

<https://git.zx2c4.com/password-store/about/>

## Quick Actions

Quick Actions are a way to automate tasks in MacOS.

To create a new Quick Action, open Automator and create a new Quick Action.

1. Open Automator
2. Create a new Quick Action
3. Add a new action: Open Finder Items
4. Select as Open With the app you want to use
5. Save the Quick Action

## Rsync between 2 folders

To sync 2 folders, you can use the rsync command.

```bash
    rsync -avhPz Folder_1/ Folder_2 --exclude '.Spotlight-V100' --exclude '.DS_Store' --exclude '.Trashes'
```

Check if folders are the same:

```bash
    rsync -avhPunc Folder_1/ Folder_2 --exclude '.Spotlight-V100' --exclude '.DS_Store' --exclude '.Trashes'
```

## Find and remove files/folders

There are some ways to find and remove files/folders.

### Find

```bash
    # With exec option
    find . -name "filename" -exec rm -rf {} \;

    # With -delete argument
    find . -name "filename" -delete
```
