# get-me-started: Windows direct setup helper
# This script installs Node.js and OpenCode directly on your computer.
# It's the quick path — faster to set up, tools live on your system.
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
Write-Host "Click 'Yes' — this is how Windows asks for your permission to install"
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

# --- Install Git ---
Write-Host "[1/4] Checking for Git..." -ForegroundColor White
$hasGit = Get-Command git -ErrorAction SilentlyContinue
if ($hasGit) {
    $gitVersion = git --version
    Write-Host "  $gitVersion is already installed." -ForegroundColor Green
} else {
    Write-Host "  Installing Git..." -ForegroundColor Yellow
    Write-Host "  (Your computer needs permission to install programs.)" -ForegroundColor Gray
    winget install --id Git.Git --accept-source-agreements --accept-package-agreements
    # Refresh PATH
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
    Write-Host "  Git installed." -ForegroundColor Green
}
Write-Host ""

# --- Install Node.js ---
Write-Host "[2/4] Checking for Node.js..." -ForegroundColor White
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
Write-Host "[3/4] Checking for OpenCode..." -ForegroundColor White
$hasOpenCode = Get-Command opencode -ErrorAction SilentlyContinue
if ($hasOpenCode) {
    Write-Host "  OpenCode is already installed." -ForegroundColor Green
} else {
    Write-Host "  Installing OpenCode..." -ForegroundColor Yellow
    # Refresh PATH again in case node was just installed
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
    npm install -g opencode-ai
    Write-Host "  OpenCode installed." -ForegroundColor Green
}
Write-Host ""

# --- Generate SSH key for GitHub ---
Write-Host "[4/5] Setting up a secure key for GitHub..." -ForegroundColor White
$sshKeyPath = "$env:USERPROFILE\.ssh\id_ed25519"
if (Test-Path $sshKeyPath) {
    Write-Host "  SSH key already exists." -ForegroundColor Green
} else {
    Write-Host "  Creating a secure key so your computer can talk to GitHub..."
    Write-Host "  (This is like a digital ID card for your computer.)"
    $sshDir = "$env:USERPROFILE\.ssh"
    if (-not (Test-Path $sshDir)) { New-Item -ItemType Directory -Path $sshDir -Force | Out-Null }
    ssh-keygen -t ed25519 -f $sshKeyPath -N '""' -q
    Write-Host "  Key created." -ForegroundColor Green
}
Write-Host ""

# --- Create Projects folder ---
Write-Host "[5/5] Creating your Projects folder..." -ForegroundColor White
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
Write-Host "----------------------------------------" -ForegroundColor Yellow
Write-Host "Optional but recommended: Connect to GitHub" -ForegroundColor Cyan
Write-Host ""
Write-Host "GitHub saves your work online (free backup) and lets you publish"
Write-Host "your website for the world to see. You can skip this for now and"
Write-Host "set it up later - but we recommend it."
Write-Host ""
Write-Host "Your computer's key (you'll need this for GitHub):" -ForegroundColor White
Write-Host "" -ForegroundColor Green
Get-Content "$env:USERPROFILE\.ssh\id_ed25519.pub"
Write-Host ""
Write-Host "Guide: https://jdeworks.github.io/get-me-started/github.html" -ForegroundColor White
Write-Host "----------------------------------------" -ForegroundColor Yellow
Write-Host ""
Write-Host "Press Enter to close..."
Read-Host
