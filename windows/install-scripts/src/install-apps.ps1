# Ensure script is running as Administrator
$currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
if (!$currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)){
  Write-Output "Please run this script as Administrator!"
  Break
}

$games = Get-Content ./data/games.txt
$winget = Get-Content ./data/winget.txt
$scoop = Get-Content ./data/scoop.txt
$wingetUninstall = Get-Content ./data/uninstall.txt

# Write-Output "-------------Installing Games--------------------" 
# foreach ($app in $games){
#     Write-Output "Installing $app from WinGet"
#     winget install $app -h --no-upgrade
# }
# Write-Output "-------------------------------------------------------" 

Write-Output "-------------Installing WinGet Apps--------------------" 
foreach ($app in $winget){
    if ($app -eq "LGUG2Z.komorebi"){
        Write-Output "[Komorebi] Enabling Long Path Support"
        Set-ItemProperty 'HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem' -Name 'LongPathsEnabled' -Value 1
        Write-Output "[Komorebi] Creating Komorebi data directory"
        mkdir "$Env:LOCALAPPDATA\komorebi" -ea 0
    }

    Write-Output "Installing $app from WinGet"
    winget install $app -h --no-upgrade --accept-package-agreements --accept-source-agreements
}
Write-Output "-------------------------------------------------------" 

Write-Output "---------------Installing Scoop Apps-------------------" 
foreach ($app in $scoop){
    Write-Output "Installing $app from Scoop"
    scoop install $app 
}
Write-Output "-------------------------------------------------------" 

Write-Output "----------------Uninstalling Bloatware-----------------" 
foreach ($app in $wingetUninstall){
    Write-Output "Uninstalling $app"
    winget uninstall $app
}
Write-Output "-------------------------------------------------------" 

