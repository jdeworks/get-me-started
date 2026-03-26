# Requirements: get-me-started

This document defines what the project must deliver and how to verify it works. Every feature has a testable acceptance criterion.

---

## 1. Core Principle

**The user never writes code.** An AI coding tool (OpenCode) writes code for them. The user describes what they want in plain words. Everything in this project exists to get that tool running on their computer.

---

## 2. ChatGPT / AI Chat Behavior

The AI-GUIDE.md is the instruction set for AI chatbots. When a user pastes the prompt into ChatGPT (or similar), the chatbot must behave as follows:

### 2.1 First response format
- **MUST** be 2-4 sentences max
- **MUST** end with exactly ONE question: "what do you want your website to do?"
- **MUST NOT** list steps, show a roadmap, ask multiple questions, or use bullet lists
- **MUST NOT** ask about the user's OS (the setup page detects this)
- **MUST NOT** mention code, HTML, CSS, JavaScript, or any technical terms
- **MUST** mention that an AI tool writes the code for them

**Test:** Paste the prompt into ChatGPT. The first response should be ~3 sentences + one question about their website idea. If it shows numbered steps, bullet lists, or multiple questions, the guide needs improvement.

### 2.2 Second response (after user describes their idea)
- **MUST** send the user to the setup page: `https://jdeworks.github.io/get-me-started/`
- **MUST** be 2-4 sentences max
- **MUST NOT** explain what the page does (the page explains itself)

**Test:** Reply with "I want a page for my pizza shop." The chatbot should respond with the setup page URL and nothing else significant.

### 2.3 Third response (after user says "setup is done")
- **MUST** tell the user how to start OpenCode and paste the make-a-website prompt
- **MUST** include the user's idea from their first message

**Test:** Reply with "The setup is done." The chatbot should give a short instruction to launch OpenCode with the make-a-website URL.

### 2.4 General rules (all responses)
- ONE question per message, never more
- No jargon without immediate plain-language explanation
- No code blocks (exception: Phase 5 "stay in chat" mode)
- No telling user to install a code editor (VS Code, Sublime, etc.)
- Invite questions: "Want me to explain how that works?"

---

## 3. Setup Page (docs/index.html)

### 3.1 AI prompt section (for direct visitors)
- **MUST** show a copy-pasteable prompt at the top
- **MUST** have "Copy to clipboard" button that works
- **MUST** have "Open in ChatGPT" button that opens ChatGPT with the prompt pre-filled (via `?q=` parameter)
- **MUST** have buttons for Claude and Gemini (paste required for these)

**Test:** Click "Open in ChatGPT". ChatGPT should open with the prompt in the input field.

### 3.2 Experience level selector
- Three options: "Step by step" (default), "Just the essentials", "Quick setup"
- **MUST** default to "Step by step"
- **MUST** persist choice in localStorage
- **MUST** show/hide content appropriately per level:
  - Step by step: full screenshots, explanations, "why" notes
  - Just the essentials: numbered lists without screenshots
  - Quick setup: one-liner commands only

**Test:** Select each level and verify content changes. Refresh page and verify selection persists.

### 3.3 OS detection and selection
- **MUST** auto-detect OS via User-Agent
- **MUST** allow manual override via buttons
- **MUST** pre-select the detected OS

### 3.4 Download section (per OS)
- Every OS **MUST** offer two tabs: "Quick install" and "Safe install"
- Download buttons **MUST** say "Download for [OS]" (not "Download safe/quick setup")
- Every download **MUST** have a "What does this script do? Read it line by line" link to explained.html
- Links **MUST** resolve to real sections (no broken anchors)

**Test:** Click every "What does this script do?" link. Each must open explained.html scrolled to the correct section.

### 3.5 Step 3 (next steps), OS-aware
- **MUST** show the correct next step based on OS + install type chosen in Steps 1-2
- Windows safe: "Open agent-sandbox.exe" (no terminal commands)
- Windows quick: PowerShell commands with `C:\Projects`
- Mac/Linux quick: Unix terminal commands with `~/Projects`
- Mac/Linux safe: `sandbox-me` terminal commands
- "Came from AI chat" option: always visible
- Code blocks **MUST NOT** have horizontal scrollbars (use word-wrap)

**Test:** Select each OS, each install tab. Verify Step 3 shows only the matching card.

### 3.6 Journey section
- Shows the full path: Setup → GitHub (optional) → Build → Design → Publish
- GitHub step **MUST** be marked as "optional"
- "Put it online" **MUST** clarify that free hosting works for simple sites only

### 3.7 Term tooltips
- Technical terms **MUST** have dotted underline
- Hover (desktop) or click (mobile) shows explanation popup
- Popup **MUST NOT** disrupt text flow (positioned absolutely, not inline)
- Click elsewhere closes popup

---

## 4. Script Explainer Page (docs/explained.html)

### 4.1 Coverage
- **MUST** have sections for all 6 scripts:
  - Windows safe, Windows quick, Mac quick, Mac safe (Docker), Linux quick, Linux safe (Docker)
- Selector buttons **MUST** match all 6 variants
- URL hash anchors **MUST** auto-open the correct section (#win-safe, #win-quick, #mac, #mac-docker, #linux, #linux-docker)

### 4.2 Line-by-line accuracy
- Every line of the script **MUST** be represented (no skipping, no summarizing)
- Line numbers **MUST** match the actual file
- Code **MUST** wrap (no horizontal scrollbars)
- Explanations **MUST** cover:
  - What comments are (lines starting with #)
  - What Write-Host / echo does (prints text on screen)
  - What color codes do (visual styling, nothing installed)
  - What if/then checks do (skip if already installed)
  - What each install command does and why
  - What PATH refresh does
  - What error handling does
- Users **MUST** be able to open the script in a text editor and follow along line-for-line

**Test:** Open each script in a text editor side-by-side with the explained page. Every line group must be accounted for with matching line numbers.

---

## 5. Setup Scripts

### 5.1 What each script installs

| Script | Installs | Does NOT install |
|--------|----------|------------------|
| Windows safe (.ps1) | Docker Desktop, agent-sandbox.exe, Projects folder | Git, SSH keys, Node.js, OpenCode |
| Windows quick (.ps1) | Node.js, OpenCode, Projects folder | Git, SSH keys, Docker |
| Mac quick (.command) | Xcode CLT, Node.js (via Homebrew), OpenCode, Projects folder | Git explicitly, SSH keys, Docker |
| Mac Docker (.command) | Xcode CLT, Docker (manual), agent-sandbox (via git clone), Projects folder | SSH keys, Node.js, OpenCode |
| Linux quick (.sh) | Node.js (via nvm), OpenCode, Projects folder | Git, SSH keys, Docker |
| Linux Docker (.sh) | Git, Docker, agent-sandbox (via git clone), Projects folder | SSH keys, Node.js, OpenCode |

### 5.2 Script behavior rules
- **MUST** skip already-installed tools (check before installing)
- **MUST** show colored output (green=success, yellow=note, red=error)
- **MUST** explain permission prompts before they appear (password, UAC)
- **MUST** show "All done!" at the end
- **MUST NOT** install SSH keys (GitHub is optional, handled separately)
- **MUST NOT** require Git in quick install paths
- Step numbering **MUST** be consistent (e.g., [1/3], [2/3], [3/3])
- Header comments **MUST** say "You can open this file in any text editor to read exactly what it does"

**Test:** Run each script on a clean system. Run again on the same system. All steps should show "already installed" and complete instantly.

### 5.3 Windows safe install specifics
- Downloads agent-sandbox.exe from GitHub Releases (not git clone)
- Tells user to open the .exe after script completes (GUI wizard, no terminal)
- Handles Docker restart requirement (tells user to re-run script after restart)

### 5.4 Mac/Linux Docker specifics
- Uses git clone for agent-sandbox (no .exe available)
- Git is a dependency (installed as part of the script)
- Mac: Docker requires manual installation (script opens download page)
- Linux: Docker installed automatically via get.docker.com

---

## 6. GitHub Setup (docs/github.html)

- **MUST** be clearly optional (not a blocker for getting started)
- **MUST** explain why it's recommended (backup, free hosting, sharing)
- **MUST** clarify that free hosting is for simple/static sites only
- **MUST** have OS-specific SSH key retrieval commands
- **MUST** have step-by-step account creation guide
- **MUST NOT** be referenced as a required step in any script

---

## 7. README.md

- **MUST** list setup page as Option 1 (easiest)
- **MUST** list AI prompt as Option 2
- **MUST** list git clone as Option 3 (for developers)
- **MUST** have AI routing instructions for LLMs reading the bundle
- **MUST NOT** duplicate the prompt (one copy only)
- **MUST NOT** list manual setup steps (setup page handles this)

---

## 8. AI-GUIDE.md (prompts/AI-GUIDE.md)

- **MUST** open with scripted first response (exact wording for the chatbot)
- **MUST** contain "DO NOT" rules visible to the AI (not in HTML comments)
- **MUST** reference the setup page URL
- **MUST** reference the GitHub page URL as optional
- **MUST** have Phase 3 (manual setup) as fallback only
- **MUST** have Phase 5 (stay in chat) as alternative for users who can't install tools
- **MUST** include the make-a-website handoff prompt
- **MUST** include next steps after building (make-it-look-good, hosting)

---

## 9. Known Limitations

- ChatGPT may ignore the guide's format rules despite explicit instructions. The prompt includes "Your first reply should ONLY ask me what I want to build, nothing else" as a direct constraint, but ChatGPT compliance varies.
- The `?q=` parameter for ChatGPT is undocumented and may break.
- Claude and Gemini do not support pre-filled prompts via URL.
- Scripts require internet access. No offline mode.
- Windows safe install requires a GitHub Release of agent-sandbox.exe to exist.
- Mac Docker path requires manual Docker Desktop installation (not automated by the script).

---

## 10. Test Checklist

Run these before any release:

### ChatGPT flow
- [ ] Paste prompt into ChatGPT. First response is short + one question
- [ ] Reply with website idea. Response sends to setup page
- [ ] Reply "setup is done". Response gives OpenCode launch instructions
- [ ] ChatGPT never mentions VS Code, code editors, or asks user to write code

### Setup page
- [ ] Page loads, OS auto-detected
- [ ] All 3 experience levels toggle content correctly
- [ ] Windows: both safe/quick tabs work, download buttons work
- [ ] Mac: both quick/safe tabs work, download buttons work
- [ ] Linux: both quick/safe tabs work, download buttons work
- [ ] Step 3 changes dynamically based on OS + install type
- [ ] All "What does this script do?" links resolve correctly
- [ ] All copy buttons work
- [ ] Term tooltips appear on hover/click, don't break text flow
- [ ] No horizontal scrollbars anywhere

### Scripts
- [ ] Windows safe: installs Docker + downloads .exe + creates folder
- [ ] Windows quick: installs Node.js + OpenCode + creates folder
- [ ] Mac quick: installs CLT + Node.js + OpenCode + creates folder
- [ ] Mac Docker: installs CLT + guides Docker install + clones sandbox
- [ ] Linux quick: installs Node.js (nvm) + OpenCode + creates folder
- [ ] Linux Docker: installs Git + Docker + clones sandbox
- [ ] No script installs SSH keys or mentions GitHub
- [ ] All scripts skip already-installed tools
- [ ] All scripts show "All done!" at the end

### Explainer page
- [ ] All 6 script variants have sections
- [ ] All links from landing page resolve to correct sections
- [ ] Line numbers match actual files
- [ ] No horizontal scrollbar on code lines
- [ ] Click-to-explain works on every line

### GitHub page
- [ ] Marked as optional
- [ ] Account creation steps are complete
- [ ] SSH key retrieval shown for all 3 OS
- [ ] Works standalone (doesn't assume user came from a specific page)
