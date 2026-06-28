# Load Oh My Posh with custom theme
oh-my-posh init pwsh --config "C:\Users\mueez\Documents\PowerShell\oh-my-posh\in.json" | Invoke-Expression

# Enable vi mode
Set-PSReadLineOption -EditMode Vi
Set-PSReadLineOption -PredictionSource None

# Switch to Vi command mode with Ctrl+J
Set-PSReadLineKeyHandler -Chord "Ctrl+j" -Function ViCommandMode

# === Vi-like cursor movement in insert mode ===
# Ctrl+d/f = left/right one char
Set-PSReadLineKeyHandler -Chord "Ctrl+d" -Function BackwardChar
Set-PSReadLineKeyHandler -Chord "Ctrl+f" -Function ForwardChar
# Ctrl+b/w = backward/forward one word (vim b/w in insert)
Set-PSReadLineKeyHandler -Chord "Ctrl+b" -Function BackwardWord
Set-PSReadLineKeyHandler -Chord "Ctrl+w" -Function ForwardWord
# Ctrl+h = delete word behind, Ctrl+l = delete word forward
Set-PSReadLineKeyHandler -Chord "Ctrl+h" -Function BackwardKillWord
Set-PSReadLineKeyHandler -Chord "Ctrl+l" -Function KillWord
