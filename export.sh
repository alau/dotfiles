#!/bin/bash
# Packages a subset of my dotfiles into a tarball. The tarball just has to be
# unpacked, no installation required. This is intended as a way to distribute
# my dotfiles to machines where I can not, or do not want, to clone the repo.
cd "$(dirname "$0")"
mkdir -p export/dotfiles

EXPORTED="zsh ack git htop"
git archive master install.sh $EXPORTED | tar -x -C export/dotfiles

cd zsh/zprezto.dotfile
git archive HEAD | tar -x -C ../../export/dotfiles/zsh/zprezto.dotfile/
cd ../..

cd zsh/zprezto.dotfile/modules/syntax-highlighting/external
git archive HEAD | tar -x -C ../../../../../export/dotfiles/zsh/zprezto.dotfile/modules/syntax-highlighting/external
cd ../../../../..

cd zsh/zprezto.dotfile/modules/autosuggestions/external
git archive HEAD | tar -x -C ../../../../../export/dotfiles/zsh/zprezto.dotfile/modules/autosuggestions/external
cd ../../../../..

cd zsh/zprezto.dotfile/modules/prompt/external/agnoster
git archive HEAD | tar -x -C ../../../../../../export/dotfiles/zsh/zprezto.dotfile/modules/prompt/external/agnoster
cd ../../../../../..

cd zsh/zprezto.dotfile/modules/prompt/external/pure
git archive HEAD | tar -x -C ../../../../../../export/dotfiles/zsh/zprezto.dotfile/modules/prompt/external/pure
cd ../../../../../..

cd zsh/zprezto.dotfile/modules/prompt/external/powerlevel10k
git archive HEAD | tar -x -C ../../../../../../export/dotfiles/zsh/zprezto.dotfile/modules/prompt/external/powerlevel10k
cd ../../../../../..

cd zsh/zsh.dotfile/z
git archive HEAD | tar -x -C ../../../export/dotfiles/zsh/zsh.dotfile/z/
cd ../../..

cd zsh/zsh.dotfile/zsh-nvm
git archive HEAD | tar -x -C ../../../export/dotfiles/zsh/zsh.dotfile/zsh-nvm/
cd ../../..

cd export/dotfiles
./install.sh ..
rm install.sh

cd ..
shopt -s dotglob
tar -czf ../dotfiles-export.tgz *
cd ..
rm -r export
