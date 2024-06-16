My dotfiles

# Installation

Install [chezmoi](https://www.chezmoi.io/install/)

```zsh
chezmoi init --apply git@github.com:alau/dotfiles.git
```

## Dropbox

Install from [dropbox install page](https://www.dropbox.com/install-linux).

## Zsh

* Change default shell `chsh -s /bin/zsh`

## Neovim

* Install python3 client for neovim: `pip install neovim`
* Enter vim and run `:PackerSync` to install the plugins
* Verify installation using `:CheckHealth`

## Vimium

Copy the contents of `~/.vimium-ff` to the settings page of the plugin.

## Sensors and fans

* Configure sensors: `sensors-detect`
* Enable coolbits for [nvfancontrol](https://github.com/foucault/nvfancontrol)
```
dnf install libXNVCtrl
```
