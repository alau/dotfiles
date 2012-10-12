My dotfiles

# Installation

Run `/install.sh`

## Vim

Enter vim and run `:BundleInstall` to install the bundles.

The following packages are required for ctags:
* exuberant-ctags
* ncurses-term

## Git

Add the email-address to `gitconfig.dotfile` and then use
  `git update-index --assume-unchanged git/gitconfig.dotfile`
to have git ignore the changes.
