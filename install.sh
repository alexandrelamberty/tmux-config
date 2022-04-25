#!/bin/bash
# Tmux configuration installation

PACKAGE=config
TARGET=$HOME
DIR="$(dirname "$0")"

printf "Tmux configuration installation\n"
stow -d "$DIR" -vDt "$TARGET" $PACKAGE
rm -rf "$HOME/.tmux.conf"
stow -d "$DIR" -vSt "$TARGET" $PACKAGE

