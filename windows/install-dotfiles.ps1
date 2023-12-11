New-ItemProperty 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders' Personal -Value 'C:\Users\justi\.config' -Type ExpandString -Force

$changes = ''

# create directories
$configdir = '~/.config/'
if (!(Test-Path -Path $configdir)){
  echo "Creating '~/.config/' directory"
  sudo New-Item -ItemType Directory -Path $configdir -ErrorAction SilentlyContinue
  $changes = 'true'
}

# create sym links
$gitconfig = '~/.gitconfig'
if (!(Test-Path -Path $gitconfig)){
  echo "Creating .gitconfig symlink"
  sudo New-Item -ItemType SymbolicLink -Path $gitconfig -Target "${pwd}/git/.gitconfig" -ErrorAction SilentlyContinue
  $changes = 'true'
}

$komorebi = '~/.config/komorebi/'
if (!(Test-Path -Path $komorebi)){
  echo "Creating komorebi symlink"
  sudo New-Item -ItemType SymbolicLink -Path $komorebi -Target "${pwd}/komorebi" -ErrorAction SilentlyContinue
  $changes = 'true'
}

$nvim = '~/AppData/Local/nvim'
if (!(Test-Path -Path $nvim)){
  echo "Creating nvim symlink"
  sudo New-Item -ItemType SymbolicLink -Path $nvim -Target "${pwd}/nvim" -ErrorAction SilentlyContinue
  $changes = 'true'
}

$ohmyposh = '~/.config/ohmyposh/'
if (!(Test-Path -Path $ohmyposh)){
  echo "Creating oh-my-posh symlink"
  sudo New-Item -ItemType SymbolicLink -Path $ohmyposh -Target "${pwd}/ohmyposh" -ErrorAction SilentlyContinue
  $changes = 'true'
  Write-Output "[OhMyPosh] Installing Font Dependency" 
  oh-my-posh font install JetBrainsMono
}

$pwsh = '~/.config/PowerShell/'
if (!(Test-Path -Path $pwsh)){
  echo "Creating PowerShell symlink"
  sudo New-Item -ItemType SymbolicLink -Path $pwsh -Target "${pwd}/powershell" -ErrorAction SilentlyContinue
  $changes = 'true'
}

# Force Windows Terminal SymLink - this file will always exist if you have used the terminal before
$WindowsTerminal = '~/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json'
sudo New-Item -ItemType SymbolicLink  $WindowsTerminal -Target "${pwd}/windows-terminal/settings.json" -ErrorAction SilentlyContinue -Force

$yasb = '~/.config/yasb'
if (!(Test-Path -Path $yasb)){
  echo "Creating yasb symlink"
  sudo New-Item -ItemType SymbolicLink -Path "~/.config/yasb" -Target "${pwd}/yasb" -ErrorAction SilentlyContinue
  $changes = 'true'
}

if (!$changes){
  echo "No changes made, you're all setup already!"
}

