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
