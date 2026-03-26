# get-me-started: Windows setup helper (Safe install)
#
# This script does 3 things:
#   1. Installs Docker Desktop (creates a protected space on your computer)
#   2. Downloads agent-sandbox.exe (the AI coding tool with a visual interface)
#   3. Creates a Projects folder for your websites
#
# Everything runs inside Docker. Nothing else gets installed on your system.
# You can open this file in any text editor (like Notepad) to read
# exactly what it does before running it. Every step is commented.
#
# HOW TO RUN: Right-click this file > "Run with PowerShell"

# --- Allow this script to run in the current session ---
# PowerShell blocks scripts by default for safety.
# This allows just THIS script to run, just this one time.
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass -Force

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Get Me Started - Windows Safe Setup" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "This sets up an isolated coding environment on your computer."
Write-Host "Nothing gets installed on your system except Docker and a small app."
Write-Host "It should take about 10-15 minutes."
Write-Host ""
Write-Host "Note: Windows may ask 'Do you want to allow this app to make changes?'" -ForegroundColor Yellow
Write-Host "Click 'Yes'. This is how Windows asks for your permission to install"
Write-Host "programs. It's the same popup you see when installing any app."
Write-Host ""

# --- Check for winget ---
# winget is Windows' built-in program installer (like an app store from
# the command line). We need it to install Docker Desktop.
# It comes pre-installed on Windows 10 (1809+) and Windows 11.
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

# --- Step 1: Install Docker Desktop ---
# Docker creates isolated "containers" on your computer, like a mini
# computer inside your computer. Your AI coding tool will run inside
# one of these containers. This keeps everything separate from the rest
# of your system. If you ever want to start fresh, just delete the
# container. Docker Desktop is free for personal use.
Write-Host "[1/3] Checking for Docker Desktop..." -ForegroundColor White
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
    Write-Host "  After restarting, run this script again. It will skip this step" -ForegroundColor Yellow
    Write-Host "  and continue from where it left off." -ForegroundColor Yellow
}
Write-Host ""

# --- Step 2: Download agent-sandbox ---
# agent-sandbox is a small standalone app (.exe) that sets up your AI
# coding environment. It has a visual interface. You double-click it,
# pick a template (like "Static Website" or "Web Application"), choose
# a folder for your project, and it does the rest.
# It downloads from GitHub (the same place open-source developers share code).
Write-Host "[2/3] Downloading Agent Sandbox..." -ForegroundColor White
$sandboxExe = "$env:USERPROFILE\Downloads\agent-sandbox.exe"
if (Test-Path $sandboxExe) {
    Write-Host "  agent-sandbox.exe already exists in Downloads." -ForegroundColor Green
} else {
    Write-Host "  Downloading agent-sandbox.exe from GitHub..." -ForegroundColor Yellow
    $downloadUrl = "https://github.com/jdeworks/agent-sandbox/releases/latest/download/agent-sandbox.exe"
    try {
        Invoke-WebRequest -Uri $downloadUrl -OutFile $sandboxExe -UseBasicParsing
        Write-Host "  Downloaded to: $sandboxExe" -ForegroundColor Green
    } catch {
        Write-Host "  Download failed. You can download it manually from:" -ForegroundColor Red
        Write-Host "  $downloadUrl" -ForegroundColor White
        Write-Host "  Save it to your Downloads folder." -ForegroundColor White
    }
}
Write-Host ""

# --- Step 3: Create Projects folder ---
# This is a regular folder where your website files will live.
# You can open it in File Explorer like any other folder.
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

# Check if restart is needed for Docker
$hasDockerNow = Get-Command docker -ErrorAction SilentlyContinue
if (-not $hasDockerNow) {
    Write-Host "NOTE: You may need to RESTART your computer before Docker works." -ForegroundColor Yellow
    Write-Host "After restarting, open agent-sandbox.exe from your Downloads folder." -ForegroundColor Yellow
    Write-Host ""
}

Write-Host "Next steps:" -ForegroundColor Cyan
Write-Host ""
Write-Host "  1. Open agent-sandbox.exe from your Downloads folder" -ForegroundColor White
Write-Host "     (double-click it, a setup wizard will appear)" -ForegroundColor Gray
Write-Host ""
Write-Host "  2. Pick a template and choose C:\Projects as your folder" -ForegroundColor White
Write-Host ""
Write-Host "  3. The AI coding tool opens automatically. You're ready to build!" -ForegroundColor White
Write-Host ""
Write-Host "Or go back to your AI chat and tell it:" -ForegroundColor Gray
Write-Host '  "The setup is done. What do I do next?"' -ForegroundColor White
Write-Host ""
Write-Host "Press Enter to close..."
Read-Host
