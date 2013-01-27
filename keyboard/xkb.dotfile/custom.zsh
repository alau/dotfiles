#!/bin/zsh
if (( $+DISPLAY && $+commands[xkbcomp] )); then
  xkbcomp -I$HOME/.xkb $HOME/.xkb/keymap/custom "${DISPLAY%%.*}" -w 0
fi
