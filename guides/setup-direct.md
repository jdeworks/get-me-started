# Setup Path: Direct Install

This path installs coding tools directly on your computer. It's the fastest way to get started — about 5 minutes from nothing to a working coding environment.

---

## What You're Installing (and Why)

| Tool | What it is | Why you need it |
|------|-----------|----------------|
| **Node.js** | A runtime that lets you run website code on your computer | Powers your website during development. Also used to install other tools. |
| **npm** | A package manager (comes with Node.js) | Lets you install libraries and tools with a single command |
| **OpenCode** | A free, open-source AI coding assistant | The AI that helps you write code — you describe what you want in plain English |

**Trade-off vs. the sandbox path**: This is faster to set up, but these tools are installed directly on your system. If you'd rather keep things isolated, see [Setup Sandbox](./setup-sandbox.md) instead.

---

## Step-by-Step

### 1. Open a terminal

If you've never used one, see [What Is a Terminal](./open-terminal.md).

### 2. Install Node.js

Node.js is the engine that makes modern websites work during development. It's free, open-source, and used by millions of developers and companies worldwide.

**Windows / Mac:**
1. Go to https://nodejs.org
2. Click the big green button labeled **LTS** (Long Term Support — the stable version)
3. Run the downloaded installer — accept all the default options
4. **Close your terminal and open a fresh one** (important — the terminal needs to reload to find Node.js)

**Linux** (use nvm — no admin/sudo password needed):
```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
```
Close and reopen the terminal, then:
```
nvm install --lts
```
If `curl` is not found: `sudo apt install curl` (Ubuntu/Debian) or use wget: `wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash`

Verify it works:

```
node -v
```

You should see something like `v20.18.0` or `v22.x.x`. Any version 18 or above is fine.

Also check npm (it installs automatically with Node.js):

```
npm -v
```

Should show a version number like `10.x.x`.

### 3. Install OpenCode

OpenCode is a free AI coding assistant that works in the terminal. You type what you want in plain English, and it writes code, creates files, and runs commands.

**Mac/Linux (install script):**
```
curl -fsSL https://raw.githubusercontent.com/opencode-ai/opencode/refs/heads/main/install | bash
```

**Mac (with Homebrew):**
```
brew install opencode-ai/tap/opencode
```

**Windows:** OpenCode doesn't have a native Windows installer. On Windows, your best options are:
- **Recommended**: Use the [sandbox path](./setup-sandbox.md) instead — OpenCode runs inside Docker, no Windows install needed
- **Alternative**: Install [Claude Code](https://docs.anthropic.com/en/docs/claude-code) (`npm install -g @anthropic-ai/claude-code`) — requires an Anthropic account and API key (has a cost)
- **No-install option**: Stay in your AI chat and have it guide you through building step by step using the paste-back pattern (you run commands and paste output back). Slower but works without a local coding AI

Verify:

```
opencode --version
```

### 4. Create a project folder

Pick a spot for your website project:

**Mac/Linux:**
```
mkdir -p ~/Projects/my-website
cd ~/Projects/my-website
```

**Windows:**
```
mkdir C:\Projects\my-website
cd C:\Projects\my-website
```

### 5. Start coding

```
opencode
```

You should see the OpenCode interface. You're ready to build.

Now tell OpenCode what you want to build:

```
I want to build a website. Use https://github.com/jdeworks/make-a-website to get us started.
```

---

## What You Can Change

### Use a different AI coding assistant

OpenCode is the default because it's free. But you have options:

- **[Claude Code](https://docs.anthropic.com/en/docs/claude-code)** — by Anthropic. Powerful, requires a subscription or API key. Install: `npm install -g @anthropic-ai/claude-code`
- **[Cursor](https://cursor.com)** — a code editor with built-in AI. Download from their website. Has a free tier.
- **[GitHub Copilot](https://github.com/features/copilot)** — works inside VS Code. Requires a GitHub subscription.

The [make-a-website](https://github.com/jdeworks/make-a-website) knowledge base works with all of them — it has entry points for each tool.

### Install Git (you'll need this later)

Git tracks changes to your code and lets you put your website online. You don't need it right now, but you'll want it when you're ready to deploy.

Check if it's installed:
```
git --version
```

If not, see the Git section in [Setup Sandbox](./setup-sandbox.md#3-install-git-if-not-already-installed) — the install steps are the same regardless of which setup path you chose.

For more about what Git and GitHub are, see [What Is GitHub](./what-is-github.md).

### Switch to the sandbox later

If you decide you'd rather keep your tools isolated, you can set up the sandbox at any time. See [Setup Sandbox](./setup-sandbox.md). Your project files don't change — only where the tools run.

---

## Cleaning Up

If you ever want to remove these tools:

**Node.js:**
- **Windows**: Settings > Apps > search for "Node.js" > Uninstall
- **Mac**: `sudo rm -rf /usr/local/lib/node_modules /usr/local/bin/node /usr/local/bin/npm`
- **Linux**: `sudo apt remove nodejs` or `sudo dnf remove nodejs`

**OpenCode:**
- **Mac (Homebrew):** `brew uninstall opencode`
- **Other:** Remove the `opencode` binary from your PATH (check `which opencode` to find its location)

Your project files are just regular files in your Projects folder — they don't depend on these tools being installed.
