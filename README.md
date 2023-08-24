# Tmux configuration

A custom configuration aiming to suit my workflow.
This is part of of [IKBS](https://github.com/alexandrelamberty/ikbs).

## Roadmap

- [ ] Condition status continuum
- [ ] Session name number at the end
- [ ] Error when no session and launching tmux

## Features

- Plugin manager
- Session backup and restore (Tmux plugins: Resurrect and Continuum)
- Create and kill session menu

## Installation

This repository is part of my *nix configuration [Ikbs]().

Check and run the `ìnstall.sh` script.

Tmux will automatically install TPM if needed and update your plugins dependencies when executed.    

## Usage

### Plugin management

Add new plugin to `~/.tmux.conf` 
```conf
set -g @plugin 'plugin-name'
```
Install the plugin

<kbd>`<prefix>` + alt + I</kbd>

Plugin update

<kbd>`<prefix>` + alt + U</kbd>

Plugin uninstall

<kbd>`<prefix>` + alt + u</kbd>



