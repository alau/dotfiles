#!/bin/bash
cd "$(dirname "$0")"

git pull && git submodule init && git submodule update

function _symlink_dotfile() {
  local dotfile=$1
  local target=$2
  if ! [[ -L $dotfile && `readlink -f $dotfile` == $target ]]; then
    mkdir -p ${dotfile%/*}
    ln -s -v -n $target $dotfile
  fi
}

# Symlink files ending in .dotfile
for SOURCE in `ls -d1 $PWD/**/*.dotfile`
do
  BASE=$(basename "$SOURCE")
  DOTFILE="$HOME/.${BASE%.*}"
  _symlink_dotfile $DOTFILE $SOURCE
done

# Symlink ordinary files in directories ending in .partial-dotfile
for DIR in `ls -d1 $PWD/**/*.partial-dotfile`
do
  BASE=$(basename "$DIR")
  for SOURCE in `find $DIR -type f`
  do
    DOTFILE="$HOME/.${BASE%.*}/${SOURCE##$DIR/}"
    _symlink_dotfile $DOTFILE $SOURCE
  done
done

# Create an empty file for zsh ssh-agent
touch ~/.ssh/autoloaded-identities

# Desktop-specific configuration
if [ "$(pidof xfce4-session)" ]; then
  echo "[XFCE] Setting xfconf values"
  ./xfce/set-xfconf.sh

  echo "[XFCE] Ensuring that default directories exist"
  mkdir -p ~/downloads
  mkdir -p ~/public
fi
