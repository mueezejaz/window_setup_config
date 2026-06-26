# Oh My Posh Theme

**File:** `in.json` — Prompt theme engine configuration for PowerShell.

## Theme: `in.json`

A two-line prompt using the **Tokyo Night** color palette.

### Line 1 (Info Bar)
Left-aligned, segments flow without Powerline separators:

| Segment | Type | Foreground | Background | Description |
|---------|------|------------|------------|-------------|
| Path | `path` | `#1abc9c` (teal) | `#1f2335` | Full current directory path |
| Git | `git` | `#f7768e` (pink) | `#1f2335` | Branch name, file status, upstream |
| VI Mode | `text` | `#ff9e64` (orange) | `#1f2335` | `NORMAL` / `INSERT` / `VISUAL` |

### Line 2 (Prompt Character)
| Segment | Type | Color | Content |
|---------|------|-------|---------|
| Prompt | `text` (plain) | `#7aa2f7` (blue) | `❯` |

### Settings
- `final_space: true` — trailing space after prompt
- `version: 2` — Oh My Posh schema v2
- Path style: `"full"`
- Git: fetch status + upstream tracking enabled
- No Powerline/glyph separators between segments

## Preview

```
C:\Users\user main +1  INSERT
❯ _
```

## Colors

| Token | Hex | Usage |
|-------|-----|-------|
| Background | `#1f2335` | Dark navy (Tokyo Night) |
| Path | `#1abc9c` | Teal/green |
| Git | `#f7768e` | Pink/red |
| VI mode | `#ff9e64` | Orange |
| Prompt char | `#7aa2f7` | Soft blue |

## Install

```powershell
Copy-Item -Path ".\oh-my-posh\in.json" -Destination "$env:USERPROFILE\Documents\PowerShell\oh-my-posh\in.json" -Force
```

The PowerShell profile already references this path.
