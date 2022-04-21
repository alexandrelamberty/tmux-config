#!/bin/bash
# Tmux configuration installation

PACKAGE=config
TARGET=$HOME

printf "Tmux configuration installation\n"
stow -vDt "$TARGET" $PACKAGE
rm -rf "$HOME/.tmux.conf"
stow -vSt "$TARGET" $PACKAGE

