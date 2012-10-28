#!/bin/bash
cd "$(dirname "$0")"

git pull && git submodule init && git submodule update

# Symlink files ending in .dotfile
for SOURCE in `ls -d1 $PWD/**/*.dotfile`
do
  BASE=$(basename "$SOURCE")
  DOTFILE="$HOME/.${BASE%.*}"
  if ! [[ -L $DOTFILE && `readlink -f $DOTFILE` == $SOURCE ]]; then
    ln -s -v -n $SOURCE $DOTFILE
  fi
done

# Symlink ordinary files in directories ending in .partial-dotfile
for DIR in `ls -d1 $PWD/**/*.partial-dotfile`
do
  BASE=$(basename "$DIR")
  for SOURCE in `find $DIR -type f`
  do
    DOTFILE="$HOME/.${BASE%.*}/${SOURCE##$DIR/}"
    if ! [[ -L $DOTFILE && `readlink -f $DOTFILE` == $SOURCE ]]; then
      mkdir -p ${DOTFILE%/*}
      ln -s -v -n $SOURCE $DOTFILE
    fi
  done
done

# Create an empty file for zsh ssh-agent
touch ~/.ssh/autoloaded-identities
  # Gnome-spcific configuration
if [ "$(pidof gnome-session)" ]; then
  # Gnome-specific configuration
  echo "[Gnome] Configuring keyboard"
  ./keyboard/configure-gnome.sh
fi
