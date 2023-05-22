# STYLING

# [oh my posh] - init pwsh with oh-my-posh
oh-my-posh init pwsh --config "$HOME/.config/ohmyposh/.mytheme.omp.json" | Invoke-Expression

# [terminal-icons]
Import-Module -Name Terminal-Icons

#------------------------------------------------------------------#
# ALIASES

# paths
function personal {Set-Location "$HOME\Documents\work\personal\"}
function eden {Set-Location "$HOME\Documents\work\eden\"}
function experiences {Set-Location "$HOME\Documents\work\eden\experiences"}
function startup {Set-Location "$HOME\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"}
function nvimConfig {Set-Location "$HOME\AppData\Local\nvim"}
function vimConfig {Set-Location "$HOME\AppData\Local\nvim"}
function krestart {komorebic stop && komorebic start -a}
function kstart {komorebic start -a}
function kstop {komorebic stop}

# commands
Set-Alias vim nvim
Set-Alias reboot Restart-Computer
Set-Alias shutdown Stop-Computer

# functions
function cguid {$guid = New-Guid 
                $guid | Set-Clipboard
                Write-Output $guid}

#------------------------------------------------------------------#
# ENVIRONMENT VARIABLES

# [Komorebi]
$Env:KOMOREBI_CONFIG_HOME = "$HOME\.config\komorebi"
$Env:WHKD_CONFIG_HOME = "$HOME\.config\komorebi"

#------------------------------------------------------------------#

# [komorebi] - launch komorebi if not runnning
$komorebi = Get-Process komorebi -ErrorAction SilentlyContinue
if (!$komorebi){
  komorebic start -a
}
