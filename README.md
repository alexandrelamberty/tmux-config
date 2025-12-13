# Tmux configuration

Welcome to my customized Tmux configuration! This setup is tailored
specifically for *nix environments, providing a streamlined and efficient Tmux
experience. With a focus on simplicity and productivity, this configuration
incorporates essential features and key bindings to enhance your Tmux workflow.

## Requirements

- **Stow**: Symlink farm manager. <https://www.gnu.org/software/stow/manual/stow.html>

## Features

- **Material inspired themes**: Matching dark/light palettes with consolidated pane, status bar and message styling.
- **Tmux Plugin Manager**: Facilitates easy management of Tmux plugins.
- **Session Backup and Restore**: Utilizes Tmux plugins Resurrect and Continuum for session management.
  The default layout ties these colours into the status line (prefix indicator,
  window list, host/path segments and clock) so every session looks consistent.

## Themes

Two themes live under `config/.config/tmux/themes/`:

- `material-dark.conf` (default)
- `material-light.conf`

Pick a theme by exporting `TMUX_THEME` before starting Tmux:

```sh
export TMUX_THEME=material-light   # or material-dark
tmux
```

Each theme exposes the palette via `@theme-*` user options which are consumed by
`config/.config/tmux/layouts/default.conf`.  Feel free to create additional
themes by following the same pattern (define the palette and set `@theme-ready`).

### Runtime theme switching

Press `<prefix>` + <kbd>T</kbd> to open a popup menu listing every theme under
`config/.config/tmux/themes/`.  After selecting a theme the script re-sources
the palette and default layout so the status bar updates immediately.

### Runtime layout switching

Press `<prefix>` + <kbd>L</kbd> to choose between layout files inside
`config/.config/tmux/layouts/`.  This is handy if you keep alternative status
bar/window layouts for different workflows.

## Installation

To install this custom Tmux configuration, follow these steps:

1. **Clone the Repository**: Clone this repository to your local machine.

```sh
git clone <repository_url>
```

2. **Navigate to the Directory**: Change into the directory containing the cloned repository.

```sh
cd <directory_name>
```

3. **Run the Installation Script**: Execute the install.sh script to apply the configuration settings.

```sh
./install.sh
```

4. **Start Tmux**: Start Tmux.

```sh
tmux
```

5. **Install Plugins**: After starting Tmux, install the configured plugins by pressing.

`<prefix>` + <kbd>I</kbd>

In this configuration the prefix combination is : <kbd>Ctrl</kbd> + <kbd>Space</kbd>

> TODO automate this step.

## Key bindings

This configuration use the <kbd>Ctrl</kbd> + <kbd>Space</kbd> as `<prefix>`.

| Key | Command |
|-|-|
| Switch last client | `<prefix>` + <kbd>Tab</kbd> |
| Previous window | `<prefix>` + <kbd>Ctrl</kbd> + <kbd>P</kbd> |
| Next window | `<prefix>` + <kbd>Ctrl</kbd> + <kbd>N</kbd> |
| Last window | `<prefix>` + <kbd>Space</kbd> |
| Horizontal split | `<prefix>` + <kbd>H</kbd> |
| Vertical split | `<prefix>` + <kbd>V</kbd> |
| Move left pane | `<prefix>` + <kbd>h</kbd> |
| Move bottom pane | `<prefix>` + <kbd>j</kbd> |
| Move top pane | `<prefix>` + <kbd>k</kbd> |
| Move right pane | `<prefix>` + <kbd>l</kbd> |
| Close pane | `<prefix>` + <kbd>X</kbd> |
| Reload config | `<prefix>` + <kbd>R</kbd> |

### Status line

The top status bar displays (left to right):

- Prefix indicator (colour flips when the prefix is pressed)
- Session name and host
- Active pane path
- Resurrect/continuum status
- Date and 24h clock

You can tweak the layout inside `config/.config/tmux/layouts/default.conf`.

## Plugin management

To manage plugins, update your `~/.tmux.conf` file with the desired plugin configurations.

Add a new plugin by appending the following line:

```conf
set -g @plugin 'plugin-name'
```

Then, within Tmux, use the following key combinations:

Install Plugins: <prefix> + <kbd>I</kbd>
Update Plugins: <prefix> + <kbd>U</kbd>
Uninstall Plugins: <prefix> + <kbd>u</kbd>

## References

- <https://github.com/tmux-plugins/tpm>
- <https://github.com/tmux-plugins/tmux-resurrect>
- <https://github.com/tmux-plugins/tmux-continuum>
- <https://github.com/tmux-plugins>
