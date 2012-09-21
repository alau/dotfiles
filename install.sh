#!/bin/bash
cd "$(dirname "$0")"
git pull
read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
if [[ $REPLY =~ ^[Yy]$ ]]; then
  for SOURCE in `ls -d1 $PWD/**/*.dotfile`
  do
    BASE=$(basename "$SOURCE")
    DOTFILE="$HOME/.${BASE%.*}"
    `ln -f -s "$SOURCE" "$DOTFILE"`
  done
fi
