#------------------------------------------------------------------#
# STYLING

# [oh my posh] - init pwsh with oh-my-posh
oh-my-posh init pwsh --config "$HOME/.config/ohmyposh/.mytheme.omp.json" | Invoke-Expression

#------------------------------------------------------------------#
# ENVIRONMENT VARIABLES

# [Komorebi + WHKD]
$Env:KOMOREBI_CONFIG_HOME = "$HOME\.config\komorebi"
$Env:WHKD_CONFIG_HOME = "$HOME\.config\komorebi"

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
function komorebic-start {komorebic start --config "$HOME/.config/komorebi/komorebi.json" --whkd}
function komorebic-stop {komorebic stop}
function komorebic-update {komorebic fetch-app-specific-configuration}
function komorebic-restart {komorebic-stop && komorebic-start}

# yasb
function yasb-stop { Stop-Process -Name yasb }
function yasb-start { C:/'Program Files'/yasb/yasb.exe }
function yasb-restart { yasb-stop && yasb-start}

# AMY
function amy { komorebic-stop && yasb-stop }

# git
function gs {git status}
function gd {git diff}
function ga {git add .}
function gpl {git pull}
function gps {git push}
function gc {git commit}
function gl {git log}

# commands
Set-Alias vim nvim
Set-Alias reboot Restart-Computer
Set-Alias shutdown Stop-Computer

# other
function ex {explorer .}
function la {ls -Hidden}

#------------------------------------------------------------------#
# CUSTOM FUNCTIONS

function cguid {$guid = New-Guid 
                $guid | Set-Clipboard
                Write-Output $guid}

#------------------------------------------------------------------#
# MODULES

# [terminal-icons]
Import-Module Terminal-Icons 

# [gsudo]
Import-Module 'C:\Program Files\gsudo\Current\gsudoModule.psd1'

#------------------------------------------------------------------#
# AUTO LAUNCH

# [yasb]
if (!(Get-Process yasb -ErrorAction SilentlyContinue)){
    yasb-start -ErrorAction SilentlyContinue
}

# [komorebi]
if (!(Get-Process komorebi -ErrorAction SilentlyContinue)){
  komorebic start --config "$HOME/.config/komorebi/komorebi.json" --whkd
}


#------------------------------------------------------------------#
