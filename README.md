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
* Add ssh identities to be autoloaded to `~/.ssh/autoloaded-identities`
* Install `numlockx`

## Awesome

* Install `xscreensaver`
* Use `lxappearance` to change gtk theme

## Git

Add the email info in `~/.zshrc.local`:

```zsh
GIT_AUTHOR_EMAIL="andreas@example.com"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"
```

## Pentadactyl

* Add Duck Duck Go and GitHub to the search engines
* Set ddg as the keyword for Duck Duck Go
* Set wikipedia as the keyword for Wikipedia
