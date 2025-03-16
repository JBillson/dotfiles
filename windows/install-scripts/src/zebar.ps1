$path = "../../zebar/zebar-installer.msi"
$url = "https://github.com/glzr-io/zebar/releases/latest/download/Zebar_x64_v1.3.0.msi" 

# Download the file
Invoke-WebRequest -Uri $url -OutFile $path

# Check if the download was successful
if (Test-Path -Path $path) {

    Write-Error "Auto-install not working.  Please run the installer in the zebar directory manually."
    
    # Run the installer
    # Start-Process -FilePath "msiexec.exe" -ArgumentList "/i", $path -Wait
    # $exitCode = $LASTEXITCODE
    # Write-Output "Exit Code: $exitCode"

} else {
    Write-Error "Failed to download Zebar installer."
}
