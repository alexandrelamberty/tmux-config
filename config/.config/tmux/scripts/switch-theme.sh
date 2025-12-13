#!/usr/bin/env bash
# ==============================================================================
# TMUX COMPONENT: Script (switch-theme)
# File: ~/.config/tmux/scripts/switch-theme.sh
# Purpose: Interactive popup helper to source any theme + refresh layouts on demand.
# Notes: Called via <prefix>+T popup binding.
# ==============================================================================

set -euo pipefail

CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/tmux"
THEME_DIR="${CONFIG_DIR}/themes"
LAYOUT_FILE="${CONFIG_DIR}/layouts/default.conf"

if [[ ! -d "$THEME_DIR" ]]; then
	printf 'No themes directory at %s\n' "$THEME_DIR"
	exit 1
fi

mapfile -t THEMES < <(find "$THEME_DIR" -maxdepth 1 -type f -name '*.conf' -printf '%f\n' | sort)

if [[ "${#THEMES[@]}" -eq 0 ]]; then
	printf 'No theme files found in %s\n' "$THEME_DIR"
	exit 1
fi

printf 'Available Tmux themes:\n\n'
for idx in "${!THEMES[@]}"; do
	printf ' %2d) %s\n' "$((idx + 1))" "${THEMES[$idx]}"
done
printf '\nSelect theme number (or press Enter to cancel): '
read -r selection

if [[ -z "$selection" ]]; then
	printf 'Cancelled.\n'
	exit 0
fi

if ! [[ "$selection" =~ ^[0-9]+$ ]]; then
	printf 'Invalid selection: %s\n' "$selection"
	exit 1
fi

index=$((selection - 1))
if (( index < 0 || index >= ${#THEMES[@]} )); then
	printf 'Selection out of range.\n'
	exit 1
fi

theme_file="${THEME_DIR}/${THEMES[$index]}"

tmux display-message "Loading theme ${THEMES[$index]}"
tmux source-file "$theme_file"
tmux source-file "$LAYOUT_FILE"

printf '\nLoaded theme %s\n' "${THEMES[$index]}"
