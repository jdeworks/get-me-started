# get-me-started: Windows setup helper
# This script installs Git and Docker Desktop so you can build websites with AI.
# Everything runs inside a safe, isolated container on your computer.
#
# HOW TO RUN: Right-click this file > "Run with PowerShell"

# Allow this script to run
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass -Force

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Get Me Started - Windows Setup" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "This will install the tools you need to build websites with AI."
Write-Host "It should take about 10-15 minutes."
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
    winget install --id Git.Git --accept-source-agreements --accept-package-agreements
    # Refresh PATH
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
    Write-Host "  Git installed." -ForegroundColor Green
}
Write-Host ""

# --- Install Docker Desktop ---
Write-Host "[2/4] Checking for Docker Desktop..." -ForegroundColor White
$hasDocker = Get-Command docker -ErrorAction SilentlyContinue
if ($hasDocker) {
    $dockerVersion = docker --version
    Write-Host "  $dockerVersion is already installed." -ForegroundColor Green
} else {
    Write-Host "  Installing Docker Desktop..." -ForegroundColor Yellow
    Write-Host "  This is a large download (~500 MB). Please be patient." -ForegroundColor Yellow
    winget install --id Docker.DockerDesktop --accept-source-agreements --accept-package-agreements
    Write-Host "  Docker Desktop installed." -ForegroundColor Green
    Write-Host ""
    Write-Host "  IMPORTANT: You may need to restart your computer for Docker to work." -ForegroundColor Yellow
    Write-Host "  After restarting, Docker Desktop will start automatically." -ForegroundColor Yellow
}
Write-Host ""

# --- Create Projects folder ---
Write-Host "[3/4] Creating your Projects folder..." -ForegroundColor White
$projectsPath = "C:\Projects"
if (Test-Path $projectsPath) {
    Write-Host "  C:\Projects already exists." -ForegroundColor Green
} else {
    New-Item -ItemType Directory -Path $projectsPath | Out-Null
    Write-Host "  Created C:\Projects - this is where your websites will live." -ForegroundColor Green
}
Write-Host ""

# --- Clone agent-sandbox ---
Write-Host "[4/4] Downloading agent-sandbox..." -ForegroundColor White
$sandboxPath = "$projectsPath\agent-sandbox"
if (Test-Path $sandboxPath) {
    Write-Host "  agent-sandbox already exists at $sandboxPath." -ForegroundColor Green
} else {
    # Refresh PATH again in case git was just installed
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
    git clone https://github.com/jdeworks/agent-sandbox.git $sandboxPath
    Write-Host "  agent-sandbox downloaded." -ForegroundColor Green
}
Write-Host ""

# --- Done ---
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  All done!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Everything is installed. Go back to your AI chat and tell it:"
Write-Host ""
Write-Host '  "The setup is done. What do I do next?"' -ForegroundColor White
Write-Host ""

# Check if restart is needed
$hasDockerNow = Get-Command docker -ErrorAction SilentlyContinue
if (-not $hasDockerNow) {
    Write-Host "NOTE: You may need to RESTART your computer before Docker works." -ForegroundColor Yellow
    Write-Host "After restarting, come back to your AI chat and continue." -ForegroundColor Yellow
    Write-Host ""
}

Write-Host "Press Enter to close..."
Read-Host
