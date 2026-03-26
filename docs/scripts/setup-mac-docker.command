#!/bin/bash
# get-me-started: Mac SAFE setup (Docker + agent-sandbox)
# This script installs everything inside an isolated Docker container.
# Nothing gets installed on your system except Docker and Git.
#
# You can open this file in any text editor (like TextEdit) to read
# exactly what it does before running it. Every step is commented.

set -e

BOLD='\033[1m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
NC='\033[0m'

echo ""
echo -e "${BOLD}========================================${NC}"
echo -e "${BOLD}  Get Me Started — Mac Safe Setup${NC}"
echo -e "${BOLD}========================================${NC}"
echo ""
echo "This will set up an isolated coding environment using Docker."
echo "Nothing gets installed on your system except Docker and Git."
echo "It should take about 15-20 minutes (mostly downloading)."
echo ""
echo -e "${YELLOW}Note: This script may ask for your password at some points.${NC}"
echo "This is your computer's login password — it's needed to install"
echo "programs, just like when you install any app. You won't see the"
echo "characters as you type — that's a security feature, not a bug."
echo ""

# --- Step 1: Install Xcode Command Line Tools (includes Git) ---
# These are Apple's developer tools. They include Git, which we need
# to download project files from the internet. They come directly from
# Apple and are completely safe.
echo -e "${BOLD}[1/5] Checking for developer tools (includes Git)...${NC}"
if xcode-select -p &>/dev/null; then
    echo -e "${GREEN}  Already installed.${NC}"
else
    echo "  Installing Xcode Command Line Tools..."
    echo "  A popup may appear — click 'Install' and wait for it to finish."
    xcode-select --install 2>/dev/null || true
    echo ""
    echo -e "${YELLOW}  Waiting for installation to complete...${NC}"
    until xcode-select -p &>/dev/null; do
        sleep 5
    done
    echo -e "${GREEN}  Developer tools installed.${NC}"
fi
echo ""

# --- Step 2: Install Docker Desktop ---
# Docker creates isolated "containers" — like mini computers inside your
# computer. Your AI coding tool will run inside one. This keeps everything
# clean and separate from the rest of your system.
echo -e "${BOLD}[2/5] Checking for Docker...${NC}"
if command -v docker &>/dev/null; then
    echo -e "${GREEN}  Docker $(docker --version | cut -d' ' -f3 | tr -d ',') is already installed.${NC}"
else
    echo "  Docker is not installed."
    echo ""
    echo -e "${BOLD}  Please install Docker Desktop:${NC}"
    echo "  1. Go to https://www.docker.com/products/docker-desktop/"
    echo "  2. Click 'Download for Mac'"
    echo "  3. Pick 'Apple Silicon' for newer Macs (M1/M2/M3/M4)"
    echo "     or 'Intel' if you're unsure"
    echo "  4. Open the downloaded file and drag Docker to Applications"
    echo "  5. Open Docker from Applications"
    echo ""
    echo -e "${YELLOW}  After installing, come back and run this script again.${NC}"
    echo ""
    # Try to open the download page
    open "https://www.docker.com/products/docker-desktop/" 2>/dev/null || true
    read -p "Press Enter after you've installed Docker Desktop..."
    # Check again
    if ! command -v docker &>/dev/null; then
        echo -e "${RED}  Docker still not found. Please install it and try again.${NC}"
        read -p "Press Enter to close..."
        exit 1
    fi
fi
# Check if Docker is running
if ! docker info &>/dev/null 2>&1; then
    echo -e "${YELLOW}  Docker is installed but not running. Opening Docker Desktop...${NC}"
    open -a "Docker" 2>/dev/null || true
    echo "  Waiting for Docker to start (this may take a minute)..."
    for i in $(seq 1 60); do
        if docker info &>/dev/null 2>&1; then break; fi
        sleep 2
    done
    if ! docker info &>/dev/null 2>&1; then
        echo -e "${RED}  Docker didn't start. Please open Docker Desktop manually and try again.${NC}"
        read -p "Press Enter to close..."
        exit 1
    fi
fi
echo -e "${GREEN}  Docker is running.${NC}"
echo ""

# --- Step 3: Create SSH key ---
# An SSH key is like a digital ID card for your computer. It lets your
# computer prove who it is to GitHub (where your code will be saved)
# without typing a password every time.
echo -e "${BOLD}[3/5] Setting up a secure key for GitHub...${NC}"
if [ -f "$HOME/.ssh/id_ed25519" ]; then
    echo -e "${GREEN}  SSH key already exists.${NC}"
else
    echo "  Creating a secure key..."
    mkdir -p "$HOME/.ssh"
    ssh-keygen -t ed25519 -f "$HOME/.ssh/id_ed25519" -N "" -q
    echo -e "${GREEN}  Key created.${NC}"
fi
echo ""

# --- Step 4: Create Projects folder and clone agent-sandbox ---
# agent-sandbox is the tool that sets up your AI coding environment
# inside Docker. It comes with ready-made configurations.
echo -e "${BOLD}[4/5] Setting up Projects folder...${NC}"
PROJECTS_DIR="$HOME/Projects"
if [ -d "$PROJECTS_DIR" ]; then
    echo -e "${GREEN}  ~/Projects already exists.${NC}"
else
    mkdir -p "$PROJECTS_DIR"
    echo -e "${GREEN}  Created ~/Projects.${NC}"
fi

SANDBOX_DIR="$PROJECTS_DIR/agent-sandbox"
echo -e "${BOLD}[5/5] Downloading agent-sandbox...${NC}"
if [ -d "$SANDBOX_DIR" ]; then
    echo -e "${GREEN}  agent-sandbox already exists.${NC}"
else
    git clone https://github.com/jdeworks/agent-sandbox.git "$SANDBOX_DIR"
    echo -e "${GREEN}  agent-sandbox downloaded.${NC}"
fi
echo ""

# --- Done ---
echo -e "${BOLD}========================================${NC}"
echo -e "${GREEN}${BOLD}  All done!${NC}"
echo -e "${BOLD}========================================${NC}"
echo ""
echo "Everything is installed! Go back to your AI chat and tell it:"
echo ""
echo -e "  ${BOLD}The setup is done. What do I do next?${NC}"
echo ""
echo -e "${YELLOW}────────────────────────────────────────${NC}"
echo -e "${BOLD}Optional but recommended: Connect to GitHub${NC}"
echo ""
echo "GitHub saves your work online (free backup) and lets you publish"
echo "your website for the world to see. You can skip this for now."
echo ""
echo "Your computer's key (you'll need this for GitHub):"
echo -e "${GREEN}"
cat "$HOME/.ssh/id_ed25519.pub"
echo -e "${NC}"
echo "Guide: https://jdeworks.github.io/get-me-started/github.html"
echo -e "${YELLOW}────────────────────────────────────────${NC}"
echo ""
read -p "Press Enter to close..."
