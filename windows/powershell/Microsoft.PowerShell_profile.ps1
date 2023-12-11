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
function go-personal {Set-Location "$HOME\Documents\work\personal\"}
function go-eden {Set-Location "$HOME\Documents\work\eden\"}
function go-experiences {Set-Location "C:\Eden"}
function go-startup {Set-Location "$HOME\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"}
function go-nvimConfig {Set-Location "$HOME\AppData\Local\nvim"}
function go-vimConfig {Set-Location "$HOME\AppData\Local\nvim"}
function go-dotfiles {Set-Location "$HOME\Documents\work\personal\dotfiles"}

# komorebic
function komorebic-start {komorebic start --config "$HOME/.config/komorebi/komorebi.json" --whkd}
function komorebic-stop {komorebic stop}
function komorebic-update {komorebic fetch-app-specific-configuration}
function komorebic-restart {komorebic-stop && komorebic-start}

# yasb
function yasb-stop { Stop-Process -Name yasb -ErrorAction SilentlyContinue }
function yasb-start { C:/'Program Files'/yasb/yasb.exe -c "$HOME/.config/yasb/config.yaml" -s "$HOME/.config/yasb/styles.css" }
function yasb-restart { yasb-stop && yasb-start}

# AMY
function amy { komorebic-stop && yasb-stop }

# git
function gs {git status}
function gd {git diff}
function ga {git add .}
function pull {git pull}
function push {git push}
function gc {git commit}
function gl {git log}

# commands
Set-Alias vim nvim
Set-Alias reboot Restart-Computer
Set-Alias shutdown Stop-Computer

# other
function ex {explorer .}
function la {ls -Hidden}

# ls with natural sorting
# https://stackoverflow.com/questions/5427506/how-to-sort-by-file-name-the-same-way-windows-explorer-does#:~:text=To%20be%20able%20to%20sort,natural%20sorting%20for%20Windows%20Explorer.
Set-Alias -Name ls -Value ordered-list
function ordered-list {Get-ChildItem | Sort-Object { [regex]::Replace($_.Name, '\d+', { $args[0].Value.PadLeft(20) }) }}

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
#if (!(Get-Process yasb -ErrorAction SilentlyContinue)){
#    yasb-start -ErrorAction SilentlyContinue
#}

# [komorebi]
if (!(Get-Process komorebi -ErrorAction SilentlyContinue)){
  komorebic start --config "$HOME/.config/komorebi/komorebi.json" --whkd
}

#------------------------------------------------------------------#
# OTHER

# PowerShell parameter completion shim for the dotnet CLI
Register-ArgumentCompleter -Native -CommandName dotnet -ScriptBlock {
    param($wordToComplete, $commandAst, $cursorPosition)
        dotnet complete --position $cursorPosition "$commandAst" | ForEach-Object {
            [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
        }
}
