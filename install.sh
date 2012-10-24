#!/bin/bash
cd "$(dirname "$0")"

git pull && git submodule init && git submodule update

for SOURCE in `ls -d1 $PWD/**/*.dotfile`
do
  BASE=$(basename "$SOURCE")
  DOTFILE="$HOME/.${BASE%.*}"
  if ! [[ -L $DOTFILE && `readlink -f $DOTFILE` == $SOURCE ]]; then
    ln -s -v -n $SOURCE $DOTFILE
  fi
done

touch ~/.ssh/autoloaded-identities

if [ "$(pidof gnome-session)" ]; then
  # Running gnome
  echo "[Gnome] Configuring keyboard"
  ./keyboard/configure-gnome.sh
fi
