Write-Output "----------Installing Scoop Package Manager-------------" 
irm get.scoop.sh | iex
scoop bucket add extras
Write-Output "-------------------------------------------------------" 

Write-Output "-------------Installing Dependencies--------------------" 
$dependencies = Get-Content ../data/dependencies.txt
foreach ($app in $dependencies){
    Write-Output "[$app]"
    winget install $app -h --no-upgrade
}
Write-Output "-------------------------------------------------------" 

