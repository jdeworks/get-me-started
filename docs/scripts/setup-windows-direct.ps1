# get-me-started: Windows direct setup helper (Quick install)
# This script installs Node.js and OpenCode directly on your computer.
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
Write-Host "This will install Node.js and OpenCode on your computer."
Write-Host "It should take about 5 minutes."
Write-Host ""
Write-Host "Note: Windows may ask 'Do you want to allow this app to make changes?'" -ForegroundColor Yellow
Write-Host "Click 'Yes'. This is how Windows asks for your permission to install"
Write-Host "programs. It's the same popup you see when installing any app."
Write-Host ""

# --- Check for winget ---
$hasWinget = Get-Command winget -ErrorAction SilentlyContinue
if (-not $hasWinget) {
    Write-Host "[!] winget (Windows Package Manager) not found." -ForegroundColor Red
    Write-Host "    winget comes built-in with Windows 10 (version 1809+) and Windows 11."
    Write-Host "    Please update Windows or install 'App Installer' from the Microsoft Store."
    Write-Host ""
    Write-Host "Press Enter to close..."
    Read-Host
    exit 1
}

# --- Install Node.js ---
Write-Host "[1/3] Checking for Node.js..." -ForegroundColor White
$hasNode = Get-Command node -ErrorAction SilentlyContinue
if ($hasNode) {
    $nodeVersion = node -v
    Write-Host "  Node.js $nodeVersion is already installed." -ForegroundColor Green
} else {
    Write-Host "  Installing Node.js..." -ForegroundColor Yellow
    winget install --id OpenJS.NodeJS.LTS --accept-source-agreements --accept-package-agreements
    # Refresh PATH
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
    Write-Host "  Node.js installed." -ForegroundColor Green
}
Write-Host ""

# --- Install OpenCode ---
Write-Host "[2/3] Checking for OpenCode..." -ForegroundColor White
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
Write-Host "[3/3] Creating your Projects folder..." -ForegroundColor White
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
