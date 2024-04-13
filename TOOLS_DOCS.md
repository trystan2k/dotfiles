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

## Duplicati

Currently (April/2022) Duplicati has an issue related to Python.
In MacOS 12.3.1 (Monterey), Python 2.7 was removed from the OS, which cause Duplicati to not work, as it relies on this python version installed system wide.
To be able to run it (and when the computer is started)

1. Copy the net.duplicati.server.plist file from 'tools' folder and save it to `/Library/LaunchAgents`
2. Access Duplicate in the browser with [http://localhost:8200](http://localhost:8200/)
