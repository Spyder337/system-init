# system-init
Copy of home directory configs with additional system setup scripts.
The `user_data.json` file contains some information for setting up
configs if scripts will be used instead of config files.

Why not use dotfiles? This is a simple problem of simply backing up
files remotely and running install scripts in the cloned dir.

Usage:
`git clone --depth=1 git@github.com:Spyder337/system-init.git`

Run the install script
`install --install-programs` or `install =p` where `=p` is an optional
flag that determines whether or not to install a list of packages.

# Structure
```
.
├── .emacs.d
│   ├── auto-save-list
│   ├── elpa
│   └── init.el
├── .zshrc
└── scripts
    └── data
        ├── user_data.json
        └── packages.json
```

# Todo
- [ ] Create program installation scripts
- [ ] Add more user configs
