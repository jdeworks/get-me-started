#!/bin/bash
# get-me-started: Mac setup helper
# This script installs Node.js and OpenCode so you can build websites with AI.
# It's safe to run — it only installs free, open-source tools.

set -e

BOLD='\033[1m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo ""
echo -e "${BOLD}========================================${NC}"
echo -e "${BOLD}  Get Me Started — Mac Setup${NC}"
echo -e "${BOLD}========================================${NC}"
echo ""
echo "This will install the tools you need to build websites with AI."
echo "It should take about 5 minutes."
echo ""

# --- Check for Xcode Command Line Tools (includes git) ---
echo -e "${BOLD}[1/4] Checking for developer tools (includes Git)...${NC}"
if xcode-select -p &>/dev/null; then
    echo -e "${GREEN}  Already installed.${NC}"
else
    echo "  Installing Xcode Command Line Tools..."
    echo "  A popup may appear — click 'Install' and wait for it to finish."
    xcode-select --install 2>/dev/null || true
    echo ""
    echo -e "${YELLOW}  Waiting for installation to complete...${NC}"
    echo "  (If a popup appeared, follow it. This script will wait.)"
    until xcode-select -p &>/dev/null; do
        sleep 5
    done
    echo -e "${GREEN}  Developer tools installed.${NC}"
fi
echo ""

# --- Install Node.js ---
echo -e "${BOLD}[2/4] Checking for Node.js...${NC}"
if command -v node &>/dev/null; then
    NODE_VERSION=$(node -v)
    echo -e "${GREEN}  Node.js ${NODE_VERSION} is already installed.${NC}"
else
    echo "  Installing Node.js via Homebrew..."
    if command -v brew &>/dev/null; then
        brew install node
    else
        echo "  Homebrew not found — installing Homebrew first..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        # Add brew to PATH for this session
        if [ -f /opt/homebrew/bin/brew ]; then
            eval "$(/opt/homebrew/bin/brew shellenv)"
        elif [ -f /usr/local/bin/brew ]; then
            eval "$(/usr/local/bin/brew shellenv)"
        fi
        brew install node
    fi
    echo -e "${GREEN}  Node.js $(node -v) installed.${NC}"
fi
echo ""

# --- Install OpenCode ---
echo -e "${BOLD}[3/4] Checking for OpenCode...${NC}"
if command -v opencode &>/dev/null; then
    echo -e "${GREEN}  OpenCode is already installed.${NC}"
else
    echo "  Installing OpenCode..."
    if command -v brew &>/dev/null; then
        brew install opencode-ai/tap/opencode
    else
        curl -fsSL https://raw.githubusercontent.com/opencode-ai/opencode/refs/heads/main/install | bash
    fi
    echo -e "${GREEN}  OpenCode installed.${NC}"
fi
echo ""

# --- Create Projects folder ---
echo -e "${BOLD}[4/4] Creating your Projects folder...${NC}"
if [ -d "$HOME/Projects" ]; then
    echo -e "${GREEN}  ~/Projects already exists.${NC}"
else
    mkdir -p "$HOME/Projects"
    echo -e "${GREEN}  Created ~/Projects — this is where your websites will live.${NC}"
fi
echo ""

# --- Done ---
echo -e "${BOLD}========================================${NC}"
echo -e "${GREEN}${BOLD}  All done!${NC}"
echo -e "${BOLD}========================================${NC}"
echo ""
echo "Everything is installed. Go back to your AI chat and tell it:"
echo ""
echo -e "  ${BOLD}The setup is done. What do I do next?${NC}"
echo ""
echo "You can close this window now."
echo ""
read -p "Press Enter to close..."
