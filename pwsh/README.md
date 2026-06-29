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

### 3. Key Bindings (Insert Mode)

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
