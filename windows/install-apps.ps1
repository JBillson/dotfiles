$install= 
"Google.Chrome",
"Discord.Discord",
"Microsoft.PowerShell",
"Microsoft.PowerToys",
"Microsoft.Teams",
"Oracle.VirtualBox",
"Neovim.Neovim",
"gerardog.gsudo",
"Microsoft.VisualStudioCode",
"python3",
"GoLang.Go",
"Git.Git",
"JanDeDobbeleer.OhMyPosh",
"Google.AndroidStudio",
"JetBrains.Rider",
"AutoHotkey.AutoHotkey",
"Rufus.Rufus",
"Unity.UnityHub",
"Amazon.AWSCLI",
"GitHub.cli",
"Valve.Steam",
"Blitz.Blitz",
"RiotGames.LeagueOfLegends.EUW",
"ElectronicArts.EADesktop",
"EpicGames.EpicGamesLauncher",
"Stremio.Stremio",
"LGUG2Z.whkd",
"LGUG2Z.komorebi",
"BurntSushi.ripgrep.MSVC",
"sharkdp.fd",
"WinDirStat.WinDirStat"

$uninstall =
"Microsoft.OneDrive",
"Clipchamp.Clipchamp_yxz26nhyzhsrt",
"Microsoft.BingNews_8wekyb3d8bbwe",
"Microsoft.BingWeather_8wekyb3d8bbwe",
"Microsoft.GetHelp_8wekyb3d8bbwe",
"Microsoft.Getstarted_8wekyb3d8bbwe",
"Microsoft.OneDriveSync_8wekyb3d8bbwe",
"Microsoft.OutlookForWindows_8wekyb3d8bbwe",
"Microsoft.Paint_8wekyb3d8bbwe",
"Microsoft.People_8wekyb3d8bbwe",
"Microsoft.Todos_8wekyb3d8bbwe",
"Microsoft.WindowsFeedbackHub_8wekyb3d8bbwe",
"Microsoft.WindowsMaps_8wekyb3d8bbwe",
"microsoft.windowscommunicationsapps_8wekyb3d8bbwe"

# Ensure script is running as Administrator
$currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
  if (!$currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)){
    Write-Output "Please run this script as Administrator!"
      Break
  }

Write-Output "----------------Installing Apps------------------------" 
foreach ($app in $install){
    Write-Output "Installing $app"
    winget install $app -h --no-upgrade

    if ($app -eq "LGUG2Z.komorebi"){
        Write-Output "Komorebi: Enabling Long Path Support"
        Set-ItemProperty 'HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem' -Name 'LongPathsEnabled' -Value 1
    }
}
Write-Output "-------------------------------------------------------" 

Write-Output "----------------Uninstalling Bloatware-----------------" 
foreach ($app in $uninstall){
    Write-Output "Uninstalling $app"
    winget uninstall $app
}
Write-Output "-------------------------------------------------------" 
