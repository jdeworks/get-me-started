# get-me-started: Windows direct setup helper (Quick install)
# This script installs OpenCode directly on your computer.
# It's the quick path. Faster to set up, tools live on your system.
#
# You can open this file in any text editor (like Notepad) to read
# exactly what it does before running it. Every step is commented.
#
# HOW TO RUN: Right-click this file > "Run with PowerShell"

# Allow this script to run
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass -Force

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Get Me Started - Windows Quick Setup" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "This will install OpenCode on your computer."
Write-Host "It should take about 5 minutes."
Write-Host ""
Write-Host "Note: Windows may ask 'Do you want to allow this app to make changes?'" -ForegroundColor Yellow
Write-Host "Click 'Yes'. This is how Windows asks for your permission to install"
Write-Host "programs. It's the same popup you see when installing any app."
Write-Host ""

# --- Install OpenCode ---
Write-Host "[1/2] Checking for OpenCode..." -ForegroundColor White
$hasOpenCode = Get-Command opencode -ErrorAction SilentlyContinue
if ($hasOpenCode) {
    Write-Host "  OpenCode is already installed." -ForegroundColor Green
} else {
    Write-Host "  Downloading OpenCode installer..." -ForegroundColor Yellow
    $installerUrl = "https://opencode.ai/download/stable/windows-x64-nsis"
    $installerPath = "$env:TEMP\opencode-setup.exe"
    Invoke-WebRequest -Uri $installerUrl -OutFile $installerPath
    Write-Host "  Running OpenCode installer..." -ForegroundColor Yellow
    Start-Process -FilePath $installerPath -ArgumentList "/S" -Wait
    Remove-Item $installerPath -ErrorAction SilentlyContinue
    # Refresh PATH to pick up OpenCode
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
    Write-Host "  OpenCode installed." -ForegroundColor Green
}
Write-Host ""

# --- Create Projects folder ---
Write-Host "[2/2] Creating your Projects folder..." -ForegroundColor White
$projectsPath = "C:\Projects"
if (Test-Path $projectsPath) {
    Write-Host "  C:\Projects already exists." -ForegroundColor Green
} else {
    New-Item -ItemType Directory -Path $projectsPath | Out-Null
    Write-Host "  Created C:\Projects - this is where your websites will live." -ForegroundColor Green
}
Write-Host ""

# --- Done ---
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  All done!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Everything is installed!" -ForegroundColor Green
Write-Host ""
Write-Host "Go back to your AI chat and tell it:"
Write-Host ""
Write-Host '  "The setup is done. What do I do next?"' -ForegroundColor White
Write-Host ""
Write-Host "Press Enter to close..."
Read-Host
