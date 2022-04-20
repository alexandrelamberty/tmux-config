#!/bin/bash
# Tmux configuration installation

PACKAGE=config
TARGET=$HOME

printf "Tmux configuration installation\n"
printf "Clean target\n"

# Remove needed files
rm -rf "$HOME/.tmux.conf"

# Stow the package
printf "Stow in %s\n" "$TARGET" 
stow -vSt "$TARGET" $PACKAGE


