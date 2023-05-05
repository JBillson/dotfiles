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
komorebic ensure-named-workspaces 0 I II III IV V VI VII VII IX
komorebic ensure-named-workspaces 1 A B C D E F G H I

# Assign layouts to workspaces, possible values: bsp, columns, rows, vertical-stack, horizontal-stack, ultrawide-vertical-stack
komorebic named-workspace-layout I bsp

# Set the gaps around the edge of the screen for a workspace
komorebic named-workspace-padding I 10

# Set the gaps between the containers for a workspace
komorebic named-workspace-container-padding I 10

# You can assign specific apps to named workspaces
#komorebic named-workspace-rule title "YouTube Music" IX 

# Configure the invisible border dimensions
komorebic invisible-borders 7 0 14 7

# Set active window border
komorebic active-window-border-colour 255 0 0 --window-kind stack
komorebic active-window-border-colour 219 127 103 --window-kind single
komorebic active-window-border enable 

# Set active window border width
komorebic active-window-border-width 15

komorebic complete-configuration
