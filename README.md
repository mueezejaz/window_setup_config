# Windows Config Setup

This repo contains configuration for **GlazeWM**, **Oh My Posh**, and **PowerShell (pwsh)**.

## Prerequisites

- [GlazeWM](https://github.com/glzr-io/glazewm) — tiling window manager for Windows
- [Oh My Posh](https://ohmyposh.dev) — prompt theme engine
- [PowerShell 7+](https://github.com/PowerShell/PowerShell) — modern PowerShell
- [WezTerm](https://wezfurlong.org/wezterm/) — terminal emulator used in GlazeWM launcher

---

## 1. GlazeWM

### Install

Run the installer from `.\glazewm\glazewm-v3.9.1.exe` (or download the latest from the [releases page](https://github.com/glzr-io/glazewm/releases)).

### Config location

```
%USERPROFILE%\.glzr\glazewm\config.yaml
```

### Setup

Copy the config to the correct location:

```powershell
Copy-Item -Path ".\glazewm\config.yaml" -Destination "$env:USERPROFILE\.glzr\glazewm\config.yaml" -Force
```

Reload config in GlazeWM with `Alt+Shift+R`.

**Keybindings at a glance:**
| Action | Binding |
|--------|---------|
| Launch terminal | `Alt+Enter` |
| Focus direction | `Alt` + `h/j/k/l` or arrow keys |
| Move window | `Alt+Shift` + `h/j/k/l` or arrows |
| Resize mode | `Alt+R` then `h/j/k/l` |
| Toggle float | `Alt+Shift+Space` |
| Toggle fullscreen | `Alt+F` |
| Switch workspace | `Alt` + `1-9` |
| Move to workspace | `Alt+Shift` + `1-9` |
| Close window | `Alt+Shift+Q` |
| Reload config | `Alt+Shift+R` |

---

## 2. PowerShell Profile

### Config location

```
%USERPROFILE%\Documents\PowerShell\Microsoft.PowerShell_profile.ps1
```

### Setup

```powershell
Copy-Item -Path ".\pwsh\Microsoft.PowerShell_profile.ps1" -Destination "$env:USERPROFILE\Documents\PowerShell\Microsoft.PowerShell_profile.ps1" -Force
```

Open a new PowerShell session or run `. $PROFILE` to reload.

**Profile features:**

- Loads Oh My Posh with a custom theme
- Vi keybindings (`Set-PSReadLineOption -EditMode Vi`)
- `Ctrl+J` switches to Vi command mode
- In command mode: `k`/`j` for history navigation

---

## 3. Oh My Posh Theme

### Install Oh My Posh

```powershell
winget install JanDeDobbeleer.OhMyPosh
```

### Config location

```
%USERPROFILE%\Documents\PowerShell\oh-my-posh\in.json
```

### Setup

```powershell
Copy-Item -Path ".\oh-my-posh\in.json" -Destination "$env:USERPROFILE\Documents\PowerShell\oh-my-posh\in.json" -Force
```

The `$PROFILE` already references this path, so it will load automatically on next shell start.

**Theme preview:**

- Left-aligned prompt with `path` → `git` → `vi_mode` segments
- Second line with a `❯` prompt character
- Colors: Tokyo Night palette (blues, teals, oranges, reds)

---

## 4. WezTerm

### Config location

```
%USERPROFILE%\.wezterm.lua
```

### Setup

```powershell
Copy-Item -Path ".\wezterm\.wezterm.lua" -Destination "$env:USERPROFILE\.wezterm.lua" -Force
```

Restart WezTerm or reload with `Ctrl+Shift+L`.

**Config features:**

- Tokyo Night color scheme with Zenburn toggle (`Ctrl+Shift+Alt+E`)
- Pane splits: `Ctrl+Shift+Alt+H` (right), `Ctrl+Shift+Alt+V` (down)
- Resize panes: `Ctrl+Shift+U/I/O/P`
- Opacity toggle: `Ctrl+Alt+O`
- Blinking block cursor, 144 FPS, OpenGL renderer
- Default shell: PowerShell 7 (`pwsh.exe -NoLogo`)

---

## Quick Deploy

Run this from the repo root to copy all configs at once:

```powershell
# GlazeWM
Copy-Item -Path ".\glazewm\config.yaml" -Destination "$env:USERPROFILE\.glzr\glazewm\config.yaml" -Force

# PowerShell profile
Copy-Item -Path ".\pwsh\Microsoft.PowerShell_profile.ps1" -Destination "$env:USERPROFILE\Documents\PowerShell\Microsoft.PowerShell_profile.ps1" -Force

# Oh My Posh theme
Copy-Item -Path ".\oh-my-posh\in.json" -Destination "$env:USERPROFILE\Documents\PowerShell\oh-my-posh\in.json" -Force

# WezTerm
Copy-Item -Path ".\wezterm\.wezterm.lua" -Destination "$env:USERPROFILE\.wezterm.lua" -Force
```

> **Note:** GlazeWM requires a config reload (`Alt+Shift+R`) or restart after copying. PowerShell & Oh My Posh take effect on next terminal session.
