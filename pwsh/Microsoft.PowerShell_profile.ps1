# Load Oh My Posh with custom theme
oh-my-posh init pwsh --config "C:\Users\mueez\Documents\PowerShell\oh-my-posh\in.json" | Invoke-Expression

# Enable vi mode
Set-PSReadLineOption -EditMode Vi
Set-PSReadLineOption -PredictionSource None

# Switch to Vi command mode with Ctrl+J
Set-PSReadLineKeyHandler -Chord "Ctrl+j" -Function ViCommandMode

# === Vi-like history navigation ===
# In command mode: 'k' goes to previous command, 'j' goes to next command
Set-PSReadLineKeyHandler -Key "k" -Function PreviousHistory -ViMode Command
Set-PSReadLineKeyHandler -Key "j" -Function NextHistory -ViMode Command

# Optional: Also allow Up/Down arrows in command mode for history
Set-PSReadLineKeyHandler -Key "UpArrow" -Function PreviousHistory -ViMode Command
Set-PSReadLineKeyHandler -Key "DownArrow" -Function NextHistory -ViMode Command