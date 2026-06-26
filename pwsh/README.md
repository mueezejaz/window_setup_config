# PowerShell Profile (pwsh)

**File:** `Microsoft.PowerShell_profile.ps1` — PowerShell 7+ profile script.

## Contents

### 1. Oh My Posh Prompt
```powershell
oh-my-posh init pwsh --config "..." | Invoke-Expression
```
Loads a custom theme from `oh-my-posh\in.json`.

### 2. PSReadLine — Vi Mode
```powershell
Set-PSReadLineOption -EditMode Vi
Set-PSReadLineOption -PredictionSource None
```
- **Vi mode** enabled (Vim-style modal editing at the prompt)
- **Predictions** disabled

### 3. Key Bindings

| Chord | Action | Context |
|-------|--------|---------|
| `Ctrl+J` | Switch to Vi command mode | Global |
| `k` | Previous history | Vi command mode only |
| `j` | Next history | Vi command mode only |
| `UpArrow` | Previous history | Vi command mode only |
| `DownArrow` | Next history | Vi command mode only |

This mimics Vim's `k`/`j` for moving through command history.

## What's NOT here

- No custom aliases
- No custom functions
- No imported modules (besides Oh My Posh init)
- No environment variables set

## Install

```powershell
Copy-Item -Path ".\pwsh\Microsoft.PowerShell_profile.ps1" -Destination "$env:USERPROFILE\Documents\PowerShell\Microsoft.PowerShell_profile.ps1" -Force
```

Reload with `. $PROFILE` or start a new PowerShell session.
