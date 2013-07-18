My dotfiles

# Installation

Run `/install.sh`

## Vim

Enter vim and run `:BundleInstall` to install the bundles.

The following packages are required for ctags:
* exuberant-ctags
* ncurses-term

## Zsh

* Change default shell `chsh -s /bin/zsh`
* Install `numlockx`
* Install `git_remote_branch` gem

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

* Add Duck Duck Go and GitHub to the search engines
* Set ddg as the keyword for Duck Duck Go
* Set wikipedia as the keyword for Wikipedia
