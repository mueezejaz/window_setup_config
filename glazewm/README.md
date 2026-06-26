# GlazeWM Configuration

**File:** `config.yaml` — Tiling window manager for Windows.

## General

- **Startup:** Launches **Zebar** (status bar) automatically.
- **Cursor jump:** Enabled on window focus.
- **Focus follows cursor:** Disabled.

## Gaps

| Area | Size |
|------|------|
| Inner (between windows) | 5px |
| Outer top | 44px (reserved for Zebar) |
| Outer right/bottom/left | 5px |

## Window Effects

- Focused window border: `#bea3c7` (lavender)
- Unfocused window border: `#a1a1a1` (gray)
- Border effects are Windows 11 only.

## Workspaces

9 workspaces named `1`–`9`.

## Window Rules (Ignored / Unmanaged)

| App | Reason |
|-----|--------|
| Zebar | Status bar |
| Browser PiP windows | Picture-in-picture popouts |
| PowerToys.PowerAccent | Accent character selector |
| Lively | Animated wallpaper |

## Binding Modes

### Resize Mode (`Alt+R`)
| Key | Action |
|-----|--------|
| `h`/`left` | Shrink width 2% |
| `l`/`right` | Grow width 2% |
| `k`/`up` | Grow height 2% |
| `j`/`down` | Shrink height 2% |
| `Esc`/`Enter` | Exit resize mode |

### Pause Mode (`Alt+Shift+P`)
Temporarily disables all GlazeWM keybindings (for games / remote desktop).

## Keybindings

All bindings have a primary (`Alt+...`) and secondary (`RightAlt+Ctrl+...`) variant.

### Focus (Vim-style)
| Action | Primary |
|--------|---------|
| Focus left | `Alt+H` / `Alt+Left` |
| Focus down | `Alt+J` / `Alt+Down` |
| Focus up | `Alt+K` / `Alt+Up` |
| Focus right | `Alt+L` / `Alt+Right` |

### Move Window
| Action | Primary |
|--------|---------|
| Move left | `Alt+Shift+H` / `Alt+Shift+Left` |
| Move down | `Alt+Shift+J` / `Alt+Shift+Down` |
| Move up | `Alt+Shift+K` / `Alt+Shift+Up` |
| Move right | `Alt+Shift+L` / `Alt+Shift+Right` |

### Resize Window
| Action | Primary |
|--------|---------|
| Shrink width | `Alt+U` |
| Shrink height | `Alt+I` |
| Grow height | `Alt+O` |
| Grow width | `Alt+P` |

### Window State
| Action | Primary |
|--------|---------|
| Toggle floating (centered) | `Alt+Shift+Space` |
| Toggle tiling | `Alt+T` |
| Toggle fullscreen | `Alt+F` |
| Toggle minimized | `Alt+M` |
| Close window | `Alt+Shift+Q` |
| Toggle tiling direction | `Alt+V` |

### Launch
| Action | Primary |
|--------|---------|
| Launch WezTerm | `Alt+Enter` |

### Workspace Navigation
| Action | Primary |
|--------|---------|
| Next workspace | `Alt+S` |
| Prev workspace | `Alt+A` |
| Recent workspace | `Alt+D` |
| Go to workspace 1–9 | `Alt+1`–`Alt+9` |

### Move Window to Workspace (and follow)
| Action | Primary |
|--------|---------|
| Move to workspace 1–9 | `Alt+Shift+1`–`Alt+Shift+9` |

### Move Workspace to Monitor
| Action | Primary |
|--------|---------|
| Move workspace left/right/up/down | `Alt+Shift+A/F/D/S` |

### WM Control
| Action | Primary |
|--------|---------|
| Exit GlazeWM | `Alt+Shift+E` |
| Reload config | `Alt+Shift+R` |
| Redraw windows | `Alt+Shift+W` |

## Install

```
Copy-Item -Path ".\glazewm\config.yaml" -Destination "$env:USERPROFILE\.glzr\glazewm\config.yaml" -Force
```

Reload with `Alt+Shift+R`.
