@echo off
:: Batch wrapper to run configure-staging.ps1 elevated with bypassed execution policy
set SCRIPT_DIR=%~dp0
set PS_SCRIPT=%SCRIPT_DIR%configure-staging.ps1

:: Check for elevation using PowerShell - if not elevated, re-launch using PowerShell Start-Process -Verb RunAs
powershell -NoProfile -Command "if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')) { Start-Process -FilePath 'powershell' -ArgumentList '-NoProfile','-ExecutionPolicy','Bypass','-File', '%PS_SCRIPT%' -Verb RunAs; exit } else { & powershell -NoProfile -ExecutionPolicy Bypass -File '%PS_SCRIPT%'; }"
