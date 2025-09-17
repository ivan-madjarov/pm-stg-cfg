# pm-stg-cfg

This repository contains scripts and configuration files for managing the Patch Manager Plus 11 Staging System.

## Features
- Adds a hosts file entry for `lab.rsppm.mitel.com`.
- Creates desktop shortcuts for accessing the staging system via FQDN and IP.
- Adds a formatted hosts entry block with a blank line and comment for clarity.
- Provides a double-clickable bootstrapper to run the configuration script elevated with an execution policy bypass.

## Usage
Run the provided PowerShell script with elevated privileges to configure the system. The script will automatically adjust the execution policy temporarily if required.

For an easier double-clickable option, use the included `run-configure.bat` bootstrapper. It will re-launch PowerShell elevated and execute `configure-staging.ps1` with `-ExecutionPolicy Bypass` so unsigned scripts can run for that session only.

Example (manual):

```powershell
powershell.exe -ExecutionPolicy Bypass -File .\configure-staging.ps1
```

Example (double-click from Explorer):

- Double-click `run-configure.bat` and confirm the UAC prompt. The script will run elevated and perform the hosts update and shortcut creation.

## Files
- `configure-staging.ps1` - PowerShell script that updates the hosts file and creates desktop shortcuts.
- `run-configure.bat` - Bootstrapper that elevates and runs `configure-staging.ps1` with `-ExecutionPolicy Bypass`.

**Disclaimer:**
This repository is intended for use on Windows systems only.