# Windows Config Setup

Personal Windows development environment configuration — themed with a consistent Tokyo Night palette.

Contains config for **GlazeWM**, **Neovim**, **VS Code**, **Oh My Posh**, **PowerShell (pwsh)**, and **WezTerm**.

You can read the full detail for each tool in its own README:
- [GlazeWM](./glazewm/README.md)
- [PowerShell Profile](./pwsh/README.md)
- [Oh My Posh Theme](./oh-my-posh/README.md)
- [VS Code](./vscode/README.md)
- [Neovim](./nvim/README.md)
- [WezTerm](./wezterm/README.md)

## Prerequisites (Install all these first)

- [GlazeWM](https://github.com/glzr-io/glazewm) — tiling window manager for Windows
- [Neovim](https://neovim.io) — modern Vim-based editor
- [Oh My Posh](https://ohmyposh.dev) — prompt theme engine
- [PowerShell 7+](https://github.com/PowerShell/PowerShell) — modern PowerShell
- [WezTerm](https://wezfurlong.org/wezterm/) — terminal emulator used in GlazeWM launcher
- [VS Code](https://code.visualstudio.com) — code editor (with [Vim extension](https://marketplace.visualstudio.com/items?itemName=vscodevim.vim))
- [FindFast Pluss](https://apps.microsoft.com/detail/9mzfb26s5prq) — fast file, folder, and app search utility

---

## 1. GlazeWM

[Full details →](./glazewm/README.md)

**File:** `config.yaml` — Tiling window manager for Windows.

### General
- Launches **Zebar** (status bar) automatically
- Cursor jump enabled on window focus
- Focus follows cursor: disabled

### Gaps
| Area | Size |
|------|------|
| Inner (between windows) | 5px |
| Outer top | 44px (reserved for Zebar) |
| Outer right/bottom/left | 5px |

### Keybindings
All bindings have a primary (`Alt+...`) and secondary (`RightAlt+Ctrl+...`) variant.

Focus (Vim-style): `Alt+H/J/K/L` or arrows
Move window: `Alt+Shift+H/J/K/L` or arrows
Resize: `Alt+U/I/O/P`
Toggle float: `Alt+Shift+Space` | Fullscreen: `Alt+F` | Close: `Alt+Shift+Q`
Workspaces: `Alt+1-9` (go), `Alt+Shift+1-9` (move)
Reload: `Alt+Shift+R` | Resize mode: `Alt+R`

### Install

```powershell
Copy-Item -Path ".\glazewm\config.yaml" -Destination "$env:USERPROFILE\.glzr\glazewm\config.yaml" -Force
```

Reload config with `Alt+Shift+R`.

---

## 2. PowerShell Profile

[Full details →](./pwsh/README.md)

**File:** `Microsoft.PowerShell_profile.ps1` — PowerShell 7+ profile script.

### Contents
- **Oh My Posh** prompt loaded from `oh-my-posh\in.json`
- **Vi mode** enabled (`Set-PSReadLineOption -EditMode Vi`)
- Insert-mode keybindings for cursor movement, word navigation, history, and word deletion

### Key Bindings (Insert Mode)

| Chord | Action | Description |
|-------|--------|-------------|
| `Ctrl+J` | `ViCommandMode` | Switch to Vi command mode |
| `Ctrl+D` | `BackwardChar` | Move left one character |
| `Ctrl+F` | `ForwardChar` | Move right one character |
| `Ctrl+B` | `BackwardWord` | Move backward one word |
| `Ctrl+W` | `ForwardWord` | Move forward one word |
| `Ctrl+P` | `PreviousHistory` | Previous command in history |
| `Ctrl+N` | `NextHistory` | Next command in history |
| `Ctrl+H` | `BackwardKillWord` | Delete word behind cursor |
| `Ctrl+L` | `KillWord` | Delete word forward from cursor |

### Setup

```powershell
Copy-Item -Path ".\pwsh\Microsoft.PowerShell_profile.ps1" -Destination "$env:USERPROFILE\Documents\PowerShell\Microsoft.PowerShell_profile.ps1" -Force
```

Open a new PowerShell session or run `. $PROFILE` to reload.

---

## 3. Oh My Posh Theme

[Full details →](./oh-my-posh/README.md)

**File:** `in.json` — Prompt theme engine configuration for PowerShell.

A two-line prompt using the **Tokyo Night** color palette.

### Line 1 (Info Bar)
`path` (teal) → `git` (pink) → `vi_mode` (orange), left-aligned, no separators.

### Line 2
`❯` in soft blue.

### Preview
```
C:\Users\user main +1  INSERT
❯ _
```

### Install Oh My Posh

```powershell
winget install JanDeDobbeleer.OhMyPosh
```

### Setup

```powershell
Copy-Item -Path ".\oh-my-posh\in.json" -Destination "$env:USERPROFILE\Documents\PowerShell\oh-my-posh\in.json" -Force
```

The `$PROFILE` already references this path, so it loads automatically on next shell start.

---

## 4. VS Code

[Full details →](./vscode/README.md)

VS Code editor configuration — `settings.json` and `keybindings.json`.

### Features
- Tokyo Night color theme with background image
- Material icon theme, hidden activity bar, hidden tabs
- Relative line numbers, minimap disabled, sticky scroll disabled

### Keybindings at a glance

`<leader>` = Space. Vim extension required.

| Action | Binding |
|--------|---------|
| Prev/next buffer | `S-h` / `S-l` |
| Vertical/horizontal split | `<leader> v` / `<leader> d` |
| Focus pane | `<leader> h/j/k/l` |
| Write / close / save&close | `<leader> w` / `<leader> q` / `<leader> x` |
| Format document | `<leader> f` |
| Exit insert mode | `j j` |
| Quick open | `<leader> s` |

### Setup

```powershell
Copy-Item -Path ".\vscode\settings.json" -Destination "$env:APPDATA\Code\User\settings.json" -Force
Copy-Item -Path ".\vscode\keybindings.json" -Destination "$env:APPDATA\Code\User\keybindings.json" -Force
code --install-extension vscodevim.vim
```

Restart VS Code or run `Developer: Reload Window`.

---

## 5. Neovim

[Full details →](./nvim/README.md)

**Files:** `init.lua`, `lazy-lock.json`, `lua/*.lua`

Vim-based editor config using **lazy.nvim** plugin manager. Modular Lua structure.

### Options

| Setting | Value |
|---------|-------|
| Line numbers | Absolute + relative |
| Indent | 2 spaces, expand tabs |
| Clipboard | System (`unnamedplus`) |
| timeoutlen / ttimeoutlen | 1000ms / 100ms |
| Shell | PowerShell 7 (`pwsh`) |

### Keybindings at a glance

| Action | Binding |
|--------|---------|
| File search / live grep | `<leader>sf` / `<leader>sg` |
| Buffers / recent files | `<leader>sb` / `<leader>so` |
| Format buffer | `<leader>f` |
| Toggle terminal (split) | `<C-S-j>` |
| Exit terminal mode | `<C-j>` |
| Go to definition | `gd` |
| Hover docs | `K` |
| Rename / code action | `<leader>rn` / `<leader>ca` |
| Stage/reset hunk | `<leader>hs` / `<leader>hr` |
| Next/prev hunk | `]h` / `[h` |

### Plugins

tokyonight, nvim-treesitter, telescope.nvim, blink.cmp, conform.nvim, nvim-lspconfig, mason.nvim, gitsigns, which-key, undotree, and more.

### Setup

```powershell
Copy-Item -Path ".\nvim\*" -Destination "$env:LOCALAPPDATA\nvim" -Recurse -Force
```

Restart Neovim or run `:Lazy! sync`.

---

## 6. WezTerm

[Full details →](./wezterm/README.md)

**File:** `.wezterm.lua` — GPU-accelerated terminal emulator.

### General

| Setting | Value |
|---------|-------|
| Renderer | OpenGL (144 FPS cap) |
| Default shell | `pwsh.exe -NoLogo` |
| Font size | 13pt, cell width 0.9 |
| Window opacity | 0.9 (10% transparent) |
| Decorations | Borderless + resize handle |

### Keybindings

| Binding | Action |
|---------|--------|
| `Ctrl+Shift+Alt+H` | Split pane right (50%) |
| `Ctrl+Shift+Alt+V` | Split pane down (50%) |
| `Ctrl+Shift+U/I/O/P` | Grow/resize panes |
| `Ctrl+Alt+O` | Toggle opacity (0.9 ↔ 1.0) |
| `Ctrl+Shift+Alt+E` | Toggle Tokyo Night ↔ Zenburn |

### Setup

```powershell
Copy-Item -Path ".\wezterm\.wezterm.lua" -Destination "$env:USERPROFILE\.wezterm.lua" -Force
```

Restart WezTerm or reload with `Ctrl+Shift+L`.

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

# Neovim
Copy-Item -Path ".\nvim\*" -Destination "$env:LOCALAPPDATA\nvim" -Recurse -Force

# WezTerm
Copy-Item -Path ".\wezterm\.wezterm.lua" -Destination "$env:USERPROFILE\.wezterm.lua" -Force

# VS Code
Copy-Item -Path ".\vscode\settings.json" -Destination "$env:APPDATA\Code\User\settings.json" -Force
Copy-Item -Path ".\vscode\keybindings.json" -Destination "$env:APPDATA\Code\User\keybindings.json" -Force
```

> **Note:** GlazeWM requires a config reload (`Alt+Shift+R`) or restart after copying. Neovim may need `:Lazy! sync` after first copy. PowerShell & Oh My Posh take effect on next terminal session.
