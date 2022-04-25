# Tools Documentation

This document will have support documentation about the tools installed.

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
To temporarily solve this, follow these instructions:

1. Install Mono
2. Install Duplicati
3. Open Terminal
    sudo pip3 install pyobjc
    cd /Applications/Duplicati.app/Contents/Resources/OSXTrayHost
    2to3 -w osx-trayicon-rumps.py
    2to3 -w rumps.py
4. Reboot or Logout/Login
5. RUMPS_PYTHON=/usr/bin/python3 /Applications/Duplicati.app/Contents/MacOS/duplicati

Depending on permissions and user setup, you may also have to add the Duplicati app to the Login Items in the 'Users & groups' submit in Settings.

Or if want to continue with Python 2.7:

1. Install Duplicati
2. Download & install Python 2.7
3. Install Python dependencies pip install pyobjc==5.3 & pip install rumps==0.3.0
4. Reboot/make sure Duplicate isn't already running
5. Open up Terminal and run RUMPS_PYTHON=/Library/Frameworks/Python.framework/Versions/2.7/bin/python open /Applications/Duplicati.app
