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
function experiences {Set-Location "C:\Eden"}
function startup {Set-Location "$HOME\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"}
function nvimConfig {Set-Location "$HOME\AppData\Local\nvim"}
function vimConfig {Set-Location "$HOME\AppData\Local\nvim"}
function dotfiles {Set-Location "$HOME\Documents\work\personal\dotfiles"}

# komorebic
function krestart {komorebic stop && komorebic start -a}
function kstart {komorebic start -a}
function kstop {komorebic stop}

# git
function gs {git status}
function gd {git diff}
function ga {git add .}
function gp {git pull}

# commands
Set-Alias vim nvim
Set-Alias reboot Restart-Computer
Set-Alias shutdown Stop-Computer

# custom functions
function cguid {$guid = New-Guid 
                $guid | Set-Clipboard
                Write-Output $guid}

#------------------------------------------------------------------#
# OTHER

# [gsudo !! support]
Import-Module "$HOME\scoop\apps\gsudo\2.0.9\gsudoModule.psd1"

#------------------------------------------------------------------#
# ENVIRONMENT VARIABLES

# [Komorebi + WHKD]
$Env:KOMOREBI_CONFIG_HOME = "$HOME\.config\komorebi"
$Env:WHKD_CONFIG_HOME = "$HOME\.config\komorebi"

#------------------------------------------------------------------#
# AUTO LAUNCH

# [komorebi]
$komorebi = Get-Process komorebi -ErrorAction SilentlyContinue
if (!$komorebi){
  komorebic start -a
}

# [yasb]
$yasb = Get-Process python -ErrorAction SilentlyContinue
if (!$yasb){
  Start-Process -FilePath "$HOME/AppData/Local/Programs/Python/Python310/python.exe" -ArgumentList "$HOME/Documents/work/personal/yasb/src/main.py" -WindowStyle Hidden
}

#------------------------------------------------------------------#
