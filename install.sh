#!/bin/bash
cd "$(dirname "$0")"

git submodule update --init --recursive

INSTALL_DIR=${1-$HOME}

function _symlink_dotfile() {
  local dotfile=$1
  local target=$2
  if ! [[ -L $dotfile && (`readlink -f $dotfile` == `readlink -f ../$target` || `readlink -f $dotfile` == `readlink -f $target`) ]]; then
    mkdir -p ${dotfile%/*}
    ln -s -v -n $target $dotfile
  fi
}

# Symlink files ending in .dotfile
for SOURCE in `ls -d1 **/*.dotfile`
do
  BASE=$(basename "$SOURCE")
  DOTFILE="$INSTALL_DIR/.${BASE%.*}"
  _symlink_dotfile $DOTFILE $(basename $PWD)/$SOURCE
done

# Symlink files ending in .config-dotfile in the .config directory
for SOURCE in `ls -d1 **/*.config-dotfile`
do
  BASE=$(basename "$SOURCE")
  DOTFILE="$INSTALL_DIR/.config/${BASE%.*}"
  _symlink_dotfile $DOTFILE ../$(basename $PWD)/$SOURCE
done

# Symlink various utilities from Dropbox
mkdir -p $HOME/bin
for util in 'avro-tools' 'csv2sc' 'gh' 'git-wtf' 'heroku' 'http' 'jq' 'sbt' 'zeal'; do
  if ! [[ -L $HOME/bin/$util ]]; then
    ln -s -v -n $HOME/Dropbox/bin/$util $HOME/bin/$util
  fi
done

# rbenv
echo "2.1.8" > ~/.rbenv/version

if [[ ! -d ~/.rbenv/plugins/ruby-build ]]; then
  mkdir -p ~/.rbenv/plugins && \
    cd ~/.rbenv/plugins && \
    git clone git@github.com:sstephenson/ruby-build.git
fi

if [[ ! -d ~/.rbenv/plugins/bundler ]]; then
  mkdir -p ~/.rbenv/plugins && \
    cd ~/.rbenv/plugins && \
    git clone git@github.com:carsomyr/rbenv-bundler.git bundler
fi

# tmux
touch ~/.tmux.conf.local
