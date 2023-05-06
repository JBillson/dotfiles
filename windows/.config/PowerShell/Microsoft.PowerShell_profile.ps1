# STYLING

# [oh my posh]
oh-my-posh init pwsh --config "$HOME/.config/oh-my-posh/.mytheme.omp.json" | Invoke-Expression

#------------------------------------------------------------------#
# ALIASES

# paths
function personal {cd "C:\Users\justi\Documents\work\personal\"}
function eden {cd "C:\Users\justi\Documents\work\eden\"}
function experiences {cd "C:\Users\justi\Documents\work\eden\experiences"}
function startup {cd "C:\Users\justi\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"}
function nvim-config {cd "C:\Users\justi\AppData\Local\nvim"}

# commands
Set-Alias vim nvim

#------------------------------------------------------------------#
# ENVIRONMENT VARIABLES
# [Komorebi]
$Env:KOMOREBI_CONFIG_HOME = 'C:\Users\justi\.config\komorebi'
