# STYLING

# [oh my posh] - init pwsh with oh-my-posh
oh-my-posh init pwsh --config "$HOME/.config/oh-my-posh/.mytheme.omp.json" | Invoke-Expression

# [terminal-icons]
Import-Module -Name Terminal-Icons

#------------------------------------------------------------------#
# ALIASES

# paths
function Personal {Set-Location "$HOME\Documents\work\personal\"}
function Eden {Set-Location "$HOME\Documents\work\eden\"}
function Experiences {Set-Location "$HOME\Documents\work\eden\experiences"}
function Startup {Set-Location "$HOME\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"}
function NvimConfig {Set-Location "$HOME\AppData\Local\nvim"}
function VimConfig {Set-Location "$HOME\AppData\Local\nvim"}

# commands
Set-Alias vim nvim

# functions
function cguid {$guid = New-Guid 
                $guid | Set-Clipboard
                Write-Output $guid}

#------------------------------------------------------------------#
# ENVIRONMENT VARIABLES

# [Komorebi]
$Env:KOMOREBI_CONFIG_HOME = "$HOME\.config\komorebi"

#------------------------------------------------------------------#

# [komorebi] - launch komorebi if not runnning
$komorebi = Get-Process komorebi -ErrorAction SilentlyContinue
if (!$komorebi){
  komorebic start -a
}
