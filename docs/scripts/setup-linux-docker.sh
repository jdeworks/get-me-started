#!/bin/bash
# get-me-started: Linux SAFE setup (Docker + agent-sandbox)
# This script installs everything inside an isolated Docker container.
# Nothing gets installed on your system except Docker and Git.
#
# You can open this file in any text editor to read exactly what it
# does before running it. Every step is commented.

set -e

BOLD='\033[1m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
NC='\033[0m'

echo ""
echo -e "${BOLD}========================================${NC}"
echo -e "${BOLD}  Get Me Started - Linux Safe Setup${NC}"
echo -e "${BOLD}========================================${NC}"
echo ""
echo "This will set up an isolated coding environment using Docker."
echo "Nothing gets installed on your system except Docker and Git."
echo "It should take about 15-20 minutes (mostly downloading)."
echo ""
echo -e "${YELLOW}Note: This script may ask for your password at some points.${NC}"
echo "This is your computer's login password. It's needed to install"
echo "programs, just like when you install any app. You won't see the"
echo "characters as you type. That's a security feature, not a bug."
echo ""

# --- Detect package manager ---
if command -v apt &>/dev/null; then
    PKG="apt"
elif command -v dnf &>/dev/null; then
    PKG="dnf"
elif command -v pacman &>/dev/null; then
    PKG="pacman"
else
    echo -e "${RED}Could not detect your package manager.${NC}"
    echo "Please install Git and Docker manually, then run this script again."
    exit 1
fi

# --- Check for sudo ---
if [ "$EUID" -ne 0 ]; then
    SUDO="sudo"
else
    SUDO=""
fi

# --- Step 1: Install Git ---
# Git is a tool for downloading project files from the internet.
# It's free, safe, and used by millions of developers.
echo -e "${BOLD}[1/4] Checking for Git...${NC}"
if command -v git &>/dev/null; then
    echo -e "${GREEN}  Git $(git --version | cut -d' ' -f3) is already installed.${NC}"
else
    echo "  Installing Git..."
    if [ "$PKG" = "apt" ]; then
        $SUDO apt update -qq && $SUDO apt install -y -qq git
    elif [ "$PKG" = "dnf" ]; then
        $SUDO dnf install -y -q git
    else
        $SUDO pacman -S --noconfirm git
    fi
    echo -e "${GREEN}  Git installed.${NC}"
fi
echo ""

# --- Step 2: Install Docker ---
# Docker creates isolated "containers", like mini computers inside your
# computer. Your AI coding tool will run inside one of these.
echo -e "${BOLD}[2/4] Checking for Docker...${NC}"
if command -v docker &>/dev/null; then
    echo -e "${GREEN}  Docker $(docker --version | cut -d' ' -f3 | tr -d ',') is already installed.${NC}"
else
    echo "  Installing Docker..."
    if ! command -v curl &>/dev/null; then
        if [ "$PKG" = "apt" ]; then $SUDO apt install -y -qq curl
        elif [ "$PKG" = "dnf" ]; then $SUDO dnf install -y -q curl
        else $SUDO pacman -S --noconfirm curl; fi
    fi
    curl -fsSL https://get.docker.com | $SUDO sh
    # Add current user to docker group so they don't need sudo
    if [ -n "$SUDO" ]; then
        $SUDO usermod -aG docker "$USER"
        echo -e "${YELLOW}  Added your user to the docker group.${NC}"
        echo -e "${YELLOW}  You may need to log out and back in for Docker to work without sudo.${NC}"
    fi
    echo -e "${GREEN}  Docker installed.${NC}"
fi
# Start Docker if not running
if ! docker info &>/dev/null 2>&1; then
    echo "  Starting Docker service..."
    $SUDO systemctl start docker 2>/dev/null || true
    sleep 2
fi
echo ""

# --- Step 3: Create Projects folder ---
echo -e "${BOLD}[3/4] Setting up Projects folder...${NC}"
PROJECTS_DIR="$HOME/Projects"
if [ -d "$PROJECTS_DIR" ]; then
    echo -e "${GREEN}  ~/Projects already exists.${NC}"
else
    mkdir -p "$PROJECTS_DIR"
    echo -e "${GREEN}  Created ~/Projects.${NC}"
fi

# --- Step 4: Clone agent-sandbox ---
# agent-sandbox configures Docker for AI-assisted coding with
# ready-made templates and your AI coding assistant pre-installed.
SANDBOX_DIR="$PROJECTS_DIR/agent-sandbox"
echo -e "${BOLD}[4/4] Downloading agent-sandbox...${NC}"
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
echo "Or start the sandbox directly:"
echo "  cd ~/Projects && mkdir my-website && cd my-website && sandbox-me"
