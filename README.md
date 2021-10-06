My dotfiles


# Installation

Run `./install.sh`

List of packages (Fedora 32):
```zsh
dnf install vim dropbox htop keepassxc zsh numlockx roxterm awesome tmux vicious ctags ncurses-term xclip xscreensaver beesu lxappearance wmname util-linux-user hub neovim ack redshift httpie lm_sensors yp-tools jq gron
```

## Zsh

* Change default shell `chsh -s /bin/zsh`

## Vim

* Install python3 client for neovim: `pip install neovim`
* Enter vim and run `:PlugInstall` to install the bundles
* Verify installation using `:CheckHealth`

The following packages are required for ctags:
* ctags (exuberant-ctags in debian)
* ncurses-term

The following package is required for clipboard integration:
* xsel

## Git

Add the email info in `~/.zshrc.local`:

```zsh
GIT_AUTHOR_EMAIL="andreas@example.com"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"
```

Run the following to have git ignore the config changes:

    git update-index --assume-unchanged git/gitconfig.dotfile

## Tridactyl

Run `:installnative`.

## Working with java programs

If you get a grey window when running a java program:

* Install wmname
* Run `wmname LG3D`

## Sensors and fans

* Configure sensors: `sensors-detect`
* Install [nvfancontrol](https://github.com/foucault/nvfancontrol)
