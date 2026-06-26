# WezTerm Configuration

**File:** `.wezterm.lua` — GPU-accelerated terminal emulator.

## General

| Setting | Value |
|---------|-------|
| Renderer | OpenGL (144 FPS cap) |
| Default shell | `pwsh.exe -NoLogo` |
| TERM | `xterm-256color` |
| Cursor | Blinking block (500ms) |
| Font size | 13pt |
| Cell width | 0.9 (slightly narrow) |
| Window opacity | 0.9 (10% transparent) |
| Window decorations | Borderless + resize handle only |

## Tab Bar

- Legacy tab bar (no fancy styling)
- Hidden when only one tab is open
- Colors match Tokyo Night theme

## Color Scheme

- **Default:** Tokyo Night
- **Toggle:** Zenburn (`Ctrl+Shift+Alt+E`)

### Custom Color Overrides

| Element | Color |
|---------|-------|
| Cursor bg/border | `#7aa2f7` (blue) |
| Tab bar background | `#1a1b26` |
| Active tab text | `#7aa2f7` (blue) |
| Inactive tab text | `#c0caf5` (light blue-gray) |

## Keybindings

| Binding | Action |
|---------|--------|
| `Ctrl+Shift+Alt+H` | Split pane right (50%) |
| `Ctrl+Shift+Alt+V` | Split pane down (50%) |
| `Ctrl+Shift+U` | Grow pane left (5 cells) |
| `Ctrl+Shift+I` | Grow pane down (5 cells) |
| `Ctrl+Shift+O` | Grow pane up (5 cells) |
| `Ctrl+Shift+P` | Grow pane right (5 cells) |
| `Ctrl+9` | Pane selection overlay |
| `Ctrl+L` | Debug overlay |
| `Ctrl+Alt+O` | Toggle opacity (0.9 ↔ 1.0) |
| `Ctrl+Shift+Alt+E` | Toggle color scheme (Tokyo Night ↔ Zenburn) |

## Color Scheme Toggle

A custom event (`toggle-colorscheme`) switches between **Tokyo Night** and **Zenburn** at runtime via config overrides — no restart needed.

## Install

```powershell
Copy-Item -Path ".\wezterm\.wezterm.lua" -Destination "$env:USERPROFILE\.wezterm.lua" -Force
```

Restart WezTerm or reload with `Ctrl+Shift+L`.
