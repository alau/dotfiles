#!/bin/bash
cd "$(dirname "$0")"
git pull
for SOURCE in `ls -d1 $PWD/**/*.dotfile`
do
  BASE=$(basename "$SOURCE")
  DOTFILE="$HOME/.${BASE%.*}"
  ln -s -v $SOURCE $DOTFILE
done
