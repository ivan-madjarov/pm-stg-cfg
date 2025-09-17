# Check if the script is running as Administrator
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "This script requires elevated privileges. Please run as Administrator." -ForegroundColor Red
    Start-Sleep -Seconds 5
    exit
}

# Add entry to the hosts file
$hostsPath = "$env:SystemRoot\System32\drivers\etc\hosts"
$hostsEntry = "10.22.64.49    lab.rsppm.mitel.com"

if (-not (Select-String -Path $hostsPath -Pattern $hostsEntry -Quiet)) {
    Add-Content -Path $hostsPath -Value $hostsEntry
    Write-Host "Hosts entry added: $hostsEntry" -ForegroundColor Green
} else {
    Write-Host "Hosts entry already exists." -ForegroundColor Yellow
}

# Create shortcuts on the desktop
$desktopPath = [Environment]::GetFolderPath("Desktop")

# Shortcut 1: Patch Manager Plus 11 Staging System FQDN
$fqdnShortcutPath = Join-Path $desktopPath "Patch Manager Plus 11 Staging System FQDN.lnk"
$fqdnTarget = "https://lab.rsppm.mitel.com:8383/"
$fqdnShortcut = (New-Object -ComObject WScript.Shell).CreateShortcut($fqdnShortcutPath)
$fqdnShortcut.TargetPath = $fqdnTarget
$fqdnShortcut.Save()
Write-Host "Shortcut created: $fqdnShortcutPath" -ForegroundColor Green

# Shortcut 2: Patch Manager Plus 11 Staging System IP
$ipShortcutPath = Join-Path $desktopPath "Patch Manager Plus 11 Staging System IP.lnk"
$ipTarget = "https://10.22.64.49:8383/"
$ipShortcut = (New-Object -ComObject WScript.Shell).CreateShortcut($ipShortcutPath)
$ipShortcut.TargetPath = $ipTarget
$ipShortcut.Save()
Write-Host "Shortcut created: $ipShortcutPath" -ForegroundColor Green

Write-Host "Script completed successfully." -ForegroundColor Cyan