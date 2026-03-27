#!/bin/bash
# get-me-started: Linux setup helper (Quick install)
# This script installs Node.js and OpenCode so you can build websites with AI.
# It's safe to run. It only installs free, open-source tools.
#
# You can open this file in any text editor to read exactly what it
# does before running it. Every step is commented.

set -e

BOLD='\033[1m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo ""
echo -e "${BOLD}========================================${NC}"
echo -e "${BOLD}  Get Me Started - Linux Setup${NC}"
echo -e "${BOLD}========================================${NC}"
echo ""
echo "This will install the tools you need to build websites with AI."
echo "It should take about 5 minutes."
echo ""
echo -e "${YELLOW}Note: This script may ask for your password at some points.${NC}"
echo "This is your computer's login password. It's needed to install"
echo "programs, just like when you install any app. You won't see the"
echo "characters as you type. That's a security feature, not a bug."
echo ""

# --- Detect package manager ---
if command -v apt &>/dev/null; then
    PKG_MANAGER="apt"
    PKG_INSTALL="sudo apt install -y"
    PKG_UPDATE="sudo apt update"
elif command -v dnf &>/dev/null; then
    PKG_MANAGER="dnf"
    PKG_INSTALL="sudo dnf install -y"
    PKG_UPDATE=""
elif command -v pacman &>/dev/null; then
    PKG_MANAGER="pacman"
    PKG_INSTALL="sudo pacman -S --noconfirm"
    PKG_UPDATE="sudo pacman -Sy"
else
    echo -e "${RED}Could not detect your package manager (apt, dnf, or pacman).${NC}"
    echo "Please install Git and Node.js manually, then run this script again."
    exit 1
fi

# --- Install Node.js via nvm ---
echo -e "${BOLD}[1/3] Checking for Node.js...${NC}"
if command -v node &>/dev/null; then
    NODE_VERSION=$(node -v)
    echo -e "${GREEN}  Node.js ${NODE_VERSION} is already installed.${NC}"
else
    echo "  Installing Node.js via nvm (Node Version Manager)..."
    export NVM_DIR="$HOME/.nvm"
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
    # Load nvm for this session
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
    nvm install --lts
    echo -e "${GREEN}  Node.js $(node -v) installed.${NC}"
fi
echo ""

# --- Install OpenCode ---
echo -e "${BOLD}[2/3] Checking for OpenCode...${NC}"
if command -v opencode &>/dev/null; then
    echo -e "${GREEN}  OpenCode is already installed.${NC}"
else
    echo "  Installing OpenCode..."
    curl -fsSL https://opencode.ai/install | bash
    echo -e "${GREEN}  OpenCode installed.${NC}"
fi
echo ""

# --- Create Projects folder ---
echo -e "${BOLD}[3/3] Creating your Projects folder...${NC}"
if [ -d "$HOME/Projects" ]; then
    echo -e "${GREEN}  ~/Projects already exists.${NC}"
else
    mkdir -p "$HOME/Projects"
    echo -e "${GREEN}  Created ~/Projects. This is where your websites will live.${NC}"
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
echo "Or open OpenCode directly:"
echo "  cd ~/Projects && mkdir my-website && cd my-website && opencode"
