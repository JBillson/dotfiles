$changes = ''
#
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

$whkdrc = '~/.config/whkdrc'
if (!(Test-Path -Path $whkdrc)){
  echo "Creating whkdrc symlink"
  sudo New-Item -ItemType SymbolicLink -Path $whkdrc -Target "${pwd}/komorebi/whkdrc" -ErrorAction SilentlyContinue
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
}

$pwsh = '~/.config/PowerShell/'
if (!(Test-Path -Path $pwsh)){
  echo "Creating PowerShell symlink"
  sudo New-Item -ItemType SymbolicLink -Path $pwsh -Target "${pwd}/powershell" -ErrorAction SilentlyContinue
  $changes = 'true'
}

$WindowsTerminal = '~/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json'
sudo New-Item -ItemType SymbolicLink  $WindowsTerminal -Target "${pwd}/windows-terminal/settings.json" -ErrorAction SilentlyContinue

$yasb = '~/.config/yasb'
if (!(Test-Path -Path $yasb)){
  echo "Creating yasb symlink"
  sudo New-Item -ItemType SymbolicLink -Path "~/.config/yasb" -Target "${pwd}/yasb" -ErrorAction SilentlyContinue
  $changes = 'true'
}

$nu = '~/AppData/Roaming/nushell/'
if (!(Test-Path -Path $nu)){
  echo "Creating nushell symlink"
  sudo New-Item -ItemType SymbolicLink -Path "~/AppData/Roaming/nushell/" -Target "${pwd}/nushell" -ErrorAction SilentlyContinue
  $changes = 'true'
}

if (!$changes){
  echo "No changes made, you're all setup already!"
}
