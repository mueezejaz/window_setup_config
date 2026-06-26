# VS Code

VS Code editor configuration — settings and keybindings.

## Config location

```
%APPDATA%\Code\User\settings.json
%APPDATA%\Code\User\keybindings.json
```

## Setup

```powershell
Copy-Item -Path ".\vscode\settings.json" -Destination "$env:APPDATA\Code\User\settings.json" -Force
Copy-Item -Path ".\vscode\keybindings.json" -Destination "$env:APPDATA\Code\User\keybindings.json" -Force
```

Restart VS Code or run `Developer: Reload Window` from the command palette.

## Prerequisites

Install the **Vim** extension by vscodevim from the marketplace before using this config. The settings rely heavily on Vim keybindings.

```powershell
code --install-extension vscodevim.vim
```

## Features

- Tokyo Night color theme with background image
- Material icon theme, hidden activity bar, hidden tabs
- Relative line numbers, minimap disabled, sticky scroll disabled

## Keybindings at a glance

### Vim normal mode (`<leader>` = Space)

| Action | Binding |
|--------|---------|
| Previous buffer | `S-h` |
| Next buffer | `S-l` |
| Vertical split | `<leader> v` |
| Horizontal split | `<leader> d` |
| Focus pane left | `<leader> h` |
| Focus pane down | `<leader> j` |
| Focus pane up | `<leader> k` |
| Focus pane right | `<leader> l` |
| Write file | `<leader> w` |
| Close file | `<leader> q` |
| Save & close | `<leader> x` |
| Previous diagnostic | `[ d` |
| Next diagnostic | `] d` |
| Quick fix / code action | `<leader> c a` |
| Quick open | `<leader> s` |
| Format document | `<leader> f` |
| Peek definition | `g h` |
| Exit insert mode | `j j` |

### Vim visual mode

| Action | Binding |
|--------|---------|
| Outdent selection | `<` |
| Indent selection | `>` |
| Move lines down | `J` |
| Move lines up | `K` |
| Toggle comment | `<leader> c` |

### Terminal

| Action | Binding |
|--------|---------|
| Focus terminal | `Ctrl+Shift+J` |
| Close terminal panel | `Ctrl+Shift+J` (when focused) |
| New terminal | `Ctrl+Shift+N` (when focused) |
| Kill terminal | `Ctrl+Shift+W` (when focused) |
| Resize pane down | `Ctrl+Shift+D` (when focused) |
| Resize pane up | `Ctrl+Shift+I` (when focused) |
| Focus next terminal | `Ctrl+Shift+A` (when focused) |
| Focus previous terminal | `Ctrl+Shift+B` (when focused) |

### Suggestions / Quick Open

| Action | Binding |
|--------|---------|
| Trigger suggestions | `Ctrl+Y` |
| Select next suggestion | `Ctrl+N` |
| Select previous suggestion | `Ctrl+P` |
| Quick open select next | `Ctrl+N` |
| Quick open select previous | `Ctrl+P` |

### File Explorer

| Action | Binding |
|--------|---------|
| Toggle / focus sidebar | `Ctrl+Shift+E` |
| New file | `n` |
| New folder | `Shift+N` |
| Rename | `r` |
| Delete | `d` |

### Extras

| Action | Binding |
|--------|---------|
| Emmet match tag | `Ctrl+Shift+5` |
| Toggle Zen mode | `Ctrl+Z` |
