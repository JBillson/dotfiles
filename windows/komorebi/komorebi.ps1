if (!(Get-Process whkd -ErrorAction SilentlyContinue))
{
    Start-Process whkd -WindowStyle hidden
}

. $PSScriptRoot\komorebi.generated.ps1

# Send the ALT key whenever changing focus to force focus changes
komorebic alt-focus-hack enable

# Default to cloaking windows when switching workspaces
komorebic window-hiding-behaviour cloak

# Set cross-monitor move behaviour to insert instead of swap
komorebic cross-monitor-move-behaviour insert

# Enable hot reloading of changes to this file
komorebic watch-configuration enable

# Create named workspaces I-IX on monitor 0 
komorebic ensure-named-workspaces 0 I II III IV V VI VII VIII IX
# Create named workspaces a-i on monitor 1 
komorebic ensure-named-workspaces 1 a b c d e f g h i

# Assign layouts to workspaces, possible values: bsp, columns, rows, vertical-stack, horizontal-stack, ultrawide-vertical-stack
# komorebic named-workspace-layout I bsp

# Set the gaps around the edge of the screen for a workspace
komorebic named-workspace-padding I 25 
komorebic named-workspace-padding II 25 
komorebic named-workspace-padding III 25 
komorebic named-workspace-padding IV 25 
komorebic named-workspace-padding V 25 
komorebic named-workspace-padding VI 25 
komorebic named-workspace-padding VII 25 
komorebic named-workspace-padding VII 25 
komorebic named-workspace-padding IX 25 
komorebic named-workspace-padding a 25 
komorebic named-workspace-padding b 25 
komorebic named-workspace-padding c 25 
komorebic named-workspace-padding d 25 
komorebic named-workspace-padding e 25 
komorebic named-workspace-padding f 25 
komorebic named-workspace-padding g 25 
komorebic named-workspace-padding h 25 
komorebic named-workspace-padding i 25 

# Set the gaps between the containers for a workspace
komorebic named-workspace-container-padding I 25
komorebic named-workspace-container-padding II 25
komorebic named-workspace-container-padding III 25
komorebic named-workspace-container-padding IV 25
komorebic named-workspace-container-padding V 25
komorebic named-workspace-container-padding VI 25
komorebic named-workspace-container-padding VII 25
komorebic named-workspace-container-padding VIII 25
komorebic named-workspace-container-padding IX 25
komorebic named-workspace-container-padding a 25
komorebic named-workspace-container-padding b 25
komorebic named-workspace-container-padding c 25
komorebic named-workspace-container-padding d 25
komorebic named-workspace-container-padding e 25
komorebic named-workspace-container-padding f 25
komorebic named-workspace-container-padding g 25
komorebic named-workspace-container-padding h 25
komorebic named-workspace-container-padding i 25

# You can assign specific apps to named workspaces
komorebic initial-named-workspace-rule title "YouTube Music" IX 

# Configure the invisible border dimensions
komorebic invisible-borders 7 0 14 7

# Set active window border
komorebic active-window-border-width 15 
komorebic active-window-border-offset -- -3 
komorebic active-window-border-colour 43 122 216 --window-kind single
komorebic active-window-border-colour 0 255 0 --window-kind stack
komorebic active-window-border-colour 255 0 0 --window-kind monocle 
komorebic active-window-border enable 

komorebic complete-configuration
