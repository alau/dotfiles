My dotfiles

# Installation

Run `./install.sh`

List of packages (Fedora 39):
```zsh
dnf install vim htop keepassxc zsh numlockx awesome tmux ncurses-term xclip xscreensaver beesu lxappearance wmname util-linux-user hub neovim redshift httpie lm_sensors yp-tools jq gron xbacklight gh autorandr xrandr environment-modules alacritty nodejs yarnpkg virtualenv ripgrep zoxide python3-ipython python3-gpg gcc gcc-c++ golang
```

## Dropbox

Install from [dropbox install page](https://www.dropbox.com/install-linux).

## Zsh

* Change default shell `chsh -s /bin/zsh`

## Neovim

* Install python3 client for neovim: `pip install neovim`
* Enter vim and run `:PackUpdate` to install the plugins
* Verify installation using `:CheckHealth`

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

## Vimium

Copy the contents of `~/.vimium-ff` to the settings page of the plugin.

## Working with java programs

If you get a grey window when running a java program:

* Install wmname
* Run `wmname LG3D`

## Sensors and fans

* Configure sensors: `sensors-detect`
* Enable coolbits for [nvfancontrol](https://github.com/foucault/nvfancontrol)
```
dnf install libXNVCtrl
```
