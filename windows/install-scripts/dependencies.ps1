Write-Output "----------Installing Scoop Package Manager-------------" 
if(!(Test-Path -Path "$HOME/scoop/shims/scoop.ps1")){
  ./scoop.ps1
}
else{
    Write-Output "Already Installed"
}
Write-Output "-------------------------------------------------------" 

Write-Output "----------------Installing Zebar-----------------------" 
if(!(Test-Path -Path "C:/Program Files/Zebar")){
  ./src/zebar.ps1
}
else{
    Write-Output "Already Installed"
}
Write-Output "-------------------------------------------------------" 

Write-Output "-------------Installing Dependencies--------------------" 
$dependencies = Get-Content ./data/dependencies.txt
foreach ($app in $dependencies){
    Write-Output "[$app]"
    winget install $app -h --no-upgrade
}
Write-Output "-------------------------------------------------------" 

