Write-Output "----------Installing Scoop Package Manager-------------" 
irm get.scoop.sh | iex
scoop bucket add extras
Write-Output "-------------------------------------------------------" 

