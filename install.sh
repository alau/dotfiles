#!/bin/bash
cd "$(dirname "$0")"

git pull && git submodule init && git submodule update

for SOURCE in `ls -d1 $PWD/**/*.dotfile`
do
  BASE=$(basename "$SOURCE")
  DOTFILE="$HOME/.${BASE%.*}"
  ln -s -v -n $SOURCE $DOTFILE
done

if [ "$(pidof gnome-session)" ]; then
  # Running gnome
  echo "[Gnome] Configuring keyboard"
  ./keyboard/configure-gnome.sh
fi
