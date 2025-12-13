#!/usr/bin/env bash
# ==============================================================================
# TMUX COMPONENT: Script (switch-layout)
# File: ~/.config/tmux/scripts/switch-layout.sh
# Purpose: Popup helper that reloads any layout definition without restarting tmux.
# Notes: Invoked via <prefix>+L binding.
# ==============================================================================

set -euo pipefail

CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/tmux"
LAYOUT_DIR="${CONFIG_DIR}/layouts"

if [[ ! -d "$LAYOUT_DIR" ]]; then
	printf 'No layouts directory at %s\n' "$LAYOUT_DIR"
	exit 1
fi

mapfile -t LAYOUTS < <(find "$LAYOUT_DIR" -maxdepth 1 -type f -name '*.conf' -printf '%f\n' | sort)

if [[ "${#LAYOUTS[@]}" -eq 0 ]]; then
	printf 'No layout files found in %s\n' "$LAYOUT_DIR"
	exit 1
fi

printf 'Available Tmux layouts:\n\n'
for idx in "${!LAYOUTS[@]}"; do
	printf ' %2d) %s\n' "$((idx + 1))" "${LAYOUTS[$idx]}"
done
printf '\nSelect layout number (or press Enter to cancel): '
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
if (( index < 0 || index >= ${#LAYOUTS[@]} )); then
	printf 'Selection out of range.\n'
	exit 1
fi

layout_file="${LAYOUT_DIR}/${LAYOUTS[$index]}"

tmux display-message "Loading layout ${LAYOUTS[$index]}"
tmux source-file "$layout_file"

printf '\nLoaded layout %s\n' "${LAYOUTS[$index]}"
