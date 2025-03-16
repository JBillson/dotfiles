# STYLING

# [oh my posh] - init pwsh with oh-my-posh
# oh-my-posh init pwsh --config "$HOME/.config/ohmyposh/.mytheme.omp.json" | Invoke-Expression
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/marcduiker.omp.json" | Invoke-Expression

#------------------------------------------------------------------#

# ENVIRONMENT VARIABLES

# [Komorebi]
$Env:KOMOREBI_CONFIG_HOME = "$HOME\.config\komorebi"
$Env:WHKD_CONFIG_HOME = "$HOME\.config\komorebi"

# [zebar]
$Env:ZEBAR_CONFIG_HOME = "$HOME\.glzr\zebar"

#------------------------------------------------------------------#

# PATHS

function nav([string] $loc){
  switch ($loc){
    "personal" {Set-Location "$HOME\Documents\work\personal\"; break} 
    "warp" {Set-Location "$HOME\Documents\work\warp\"; break}
    "backups" {Set-Location "C:\OEDatabases"; break}
    "dotfiles" {Set-Location "$HOME\Documents\work\personal\dotfiles"; break}
    "nvim-config" {Set-Location "$HOME\AppData\Local\nvim"; break}
    "nvim-data" {Set-Location "$HOME\AppData\Local\nvim-data"; break}
    "startup" {Set-Location "$HOME\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"; break}
    "" {Write-Output "Please choose a custom directory to navigate to"; break}
    default {Write-Output "Invalid custom directory"; break}
  }
}

#------------------------------------------------------------------#

# ALIASES

# komorebic
function k([string]$arg){
  switch ($arg){
    "start" {komorebic start -c "$HOME/.config/komorebi/komorebi.json" --whkd}
    "stop" {komorebic stop}
    "update" {komorebic fetch-app-specific-configuration}
    "restart" {k stop && k start}
    "kill" {k stop && Stop-Process -name komorebi && Stop-Process -name whkd}
  }
}

# yasb
function y([string]$arg){
  switch ($arg){
    "stop" { Stop-Process -Name yasb -ErrorAction SilentlyContinue }
    "start" { C:/'Program Files'/yasb/yasb.exe -c "$HOME/.config/yasb/config.yaml" -s "$HOME/.config/yasb/styles.css" }
    "restart" { y stop; y start}
  }
}

#zebar 
function z([string]$arg) {
  switch ($arg) {
    "stop" { Stop-Process -Name zebar -ErrorAction SilentlyContinue }
    "start" { Start-Process -FilePath "$env:ZEBAR_CONFIG_HOME\start.bat" }
    "restart" { z stop; z start}
  }
}

# git
function gs {git status}
function ga([string]$file){git add $file}
function gd([string]$file){git diff $file}
function gr([string]$file){git restore --staged $file}
function commit([string]$message){git commit -m $message}
function log {git log}
function push {git push}
function pull {git pull}

# other
Set-Alias vim nvim
Set-Alias reboot Restart-Computer
Set-Alias shutdown Stop-Computer
function ex {explorer .}
function la {ls -Hidden}
function find([string]$arg){
  (Get-Command $arg).Path
}
function delete([string]$arg){ rm -r -Force $arg }

# ls with natural sorting
# https://stackoverflow.com/questions/5427506/how-to-sort-by-file-name-the-same-way-windows-explorer-does#:~:text=To%20be%20able%20to%20sort,natural%20sorting%20for%20Windows%20Explorer.
Set-Alias -Name ls -Value ordered-list
function ordered-list {Get-ChildItem | Sort-Object { [regex]::Replace($_.Name, '\d+', { $args[0].Value.PadLeft(20) }) }}

#------------------------------------------------------------------#

# CUSTOM FUNCTIONS

function cguid(){
  $guid = New-Guid 
  $guid | Set-Clipboard
  Write-Output $guid
}

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
#    y start
#}

# [zebar]
if (!(Get-Process zebar -ErrorAction SilentlyContinue)){
  z start
}

# [komorebi]
if (!(Get-Process komorebi -ErrorAction SilentlyContinue)){
  k start
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

# Amazon SP-API Codegen
function GenerateSDK {
    param (
        [string]$name
    )

    $model = ""
    $output = $name + "API"
    
    switch ($name) {
        "FBAInbound"{
            $model = "fulfillment-inbound-api-model\fulfillmentInboundv2024-03-20.json"
        }
        "FBAInboundV0"{
            $model = "fulfillment-inbound-api-model\fulfillmentInboundV0.json"
        }
        "FBAInboundEligibility"{
            $model = "fba-inbound-eligibility-api-model\fbaInbound.json"
        }
        "FBAInventory"{
            $model = "fba-inventory-api-model\fbaInventory.json"
        }
        "Orders"{
            $model = "orders-api-model\ordersV0.json"
        }
        "Notifications"{
            $model = "notifications-api-model\notifications.json"
        }
        "Reports"{
            $model = "reports-api-model\reports_2021-06-30.json"
        }
        Default {
            echo "Invalid API name, please use one of the following names:"
            echo "FBAInbound"
            echo "FBAInboundV0"
            echo "FBAInboundEligibility"
            echo "FBAInventory"
            echo "Orders"
            echo "Notifications"
            echo "Reports"
            return
        }
    }

    $config = @{"packageName"="SellingPartnerAPI.$output"; "targetFramework"="v4.7.2"}
    $config | ConvertTo-Json | Out-File -FilePath .\csharpConfig.json

    java -jar "C:\SwaggerToCL\swagger-codegen-cli.jar" generate -i "C:\SwaggerToCL\selling-partner-api-models\models\$model" -l csharp -t "C:\SwaggerToCL\selling-partner-api-models\clients\sellingpartner-api-aa-csharp\src\Amazon.SellingPartnerAPIAA\resources\swagger-codegen\templates" -o "C:\SwaggerToCL\SDKs\$output" -c "C:\SwaggerToCL\csharpConfig.json"
}

#------------------------------------------------------------------#

# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
