My dotfiles

# Installation

Run `/install.sh`

## Vim

[Install neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim) 0.1.1
. Enable python support by installing the python client from neovim
[python-client](https://github.com/neovim/python-client) commit 6c0ec0. To
check that the python integration is working, run `:python3 import neovim`.

Enter vim and run `:PlugInstall` to install the bundles.

The following packages are required for ctags:
* ctags (exuberant-ctags in debian)
* ncurses-term

The following package is required for clipboard integration:
* xsel

### Scala auto-imports etc

Auto-imports are handled by [eclim](http://eclim.org/), which has to be
installed as follows:
* Install Eclipse 4.4
* Install the Scala plugins from [Scala IDE](http://scala-ide.org/download/current.html)
* Clone eclim `git clone git://github.com/ervandew/eclim.git`
* Build and install `ant deploy.eclipse -Declipse.home=<eclipse>`

In order for auto-imports to work, eclimd has to be running and the project has
to be added to eclipse (use the
[sbteclipse](https://github.com/typesafehub/sbteclipse) plugin).

## Zsh

* Change default shell `chsh -s /bin/zsh`
* Install `numlockx`

## Awesome

* Install `xscreensaver`
* Install `beesu` for hibernation
* Use `lxappearance` to change gtk theme, see http://rubenerd.com/qt-gnome-3/ for Qt
* Add ssh keys to seahorse

### Working with java programs

If you get a grey window when running a java program:

* Install wmname
* Run `wmname LG3D`

## Git

Add the email info in `~/.zshrc.local`:

```zsh
GIT_AUTHOR_EMAIL="andreas@example.com"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"
```

Run the following to have git ignore the config changes:

    git update-index --assume-unchanged git/gitconfig.dotfile

## Pentadactyl

* Add GitHub to the search engines
* Set wikipedia as the keyword for Wikipedia
