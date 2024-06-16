#!/bin/bash
#
# Symlink various utilities from Dropbox
mkdir -p $HOME/bin
for util in 'avro-tools' 'foo' 'csv2sc' 'nvfancontrol'; do
  if ! [[ -L $HOME/bin/$util ]]; then
    ln -s -v -n $HOME/Dropbox/bin/$util $HOME/bin/$util
  fi
done

