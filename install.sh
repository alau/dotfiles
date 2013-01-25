#!/bin/bash
cd "$(dirname "$0")"

git submodule update --init --recursive

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

# Symlink files ending in .config-dotfile in the .config directory
for SOURCE in `ls -d1 $PWD/**/*.config-dotfile`
do
  BASE=$(basename "$SOURCE")
  DOTFILE="$HOME/.config/${BASE%.*}"
  _symlink_dotfile $DOTFILE $SOURCE
done
