# use oh-my-posh
oh-my-posh init pwsh --config "$HOME/.mytheme.omp.json" | Invoke-Expression

# [gsudo] - Allow `sudo !!` to elevate the previous command
Import-Module 'C:\Users\justi\scoop\apps\gsudo\2.0.9\gsudoModule.psd1'

# aliases
function personal {cd "C:\Users\justi\Documents\work\personal\"}
function eden {cd "C:\Users\justi\Documents\work\eden\"}
function experiences {cd "C:\Users\justi\Documents\work\eden\experiences"}
