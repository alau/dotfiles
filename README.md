My dotfiles

# Installation

Run `/install.sh`

## Vim

Enter vim and run `:BundleInstall` to install the bundles.

The following packages are required for ctags:
* exuberant-ctags
* ncurses-term

## Zsh

Change default shell

    chsh -s `chsh -l | grep zsh`

Change the font to Inconsolata-dz 14

Add ssh identities to be autoloaded to ~/.ssh/autoloaded-identities

## Git

Add the email-address to `gitconfig.dotfile` and then use

    git update-index --assume-unchanged git/gitconfig.dotfile

to have git ignore the changes.

## Pentadactyl

* Add Duck Duck Go to the search engines
* Set ddg as the keyword for Duck Duck Go
* Set wikipedia as the keyword for Wikipedia

# Other utilities

* autojump
