# create directories
sudo New-Item -ItemType Directory -Path "~/.config" -ErrorAction SilentlyContinue

# create sym links
sudo New-Item -ItemType SymbolicLink -Path "~/.gitconfig" -Target "${pwd}/git/.gitconfig" -ErrorAction SilentlyContinue
sudo New-Item -ItemType SymbolicLink -Path "~/.config/whkdrc" -Target "${pwd}/komorebi/whkdrc" -ErrorAction SilentlyContinue
sudo New-Item -ItemType SymbolicLink -Path "~/.config/komorebi" -Target "${pwd}/komorebi" -ErrorAction SilentlyContinue
sudo New-Item -ItemType SymbolicLink -Path "~/AppData/Local/nvim" -Target "${pwd}/nvim" -ErrorAction SilentlyContinue
sudo New-Item -ItemType SymbolicLink -Path "~/.config/ohmyposh/" -Target "${pwd}/ohmyposh" -ErrorAction SilentlyContinue
sudo New-Item -ItemType SymbolicLink -Path "~/.config/PowerShell/" -Target "${pwd}/powershell" -ErrorAction SilentlyContinue
sudo New-Item -ItemType HardLink -Path "~/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json" -Target "${pwd}/windows-terminal/settings.json" -ErrorAction SilentlyContinue
sudo New-Item -ItemType SymbolicLink -Path "~/.yasb" -Target "${pwd}/yasb" -ErrorAction SilentlyContinue
