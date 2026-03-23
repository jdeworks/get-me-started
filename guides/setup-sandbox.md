# Setup Path: Sandbox (Docker + agent-sandbox)

This guide is meant to be relayed by an AI assistant, one step at a time. It is also readable by humans who want to follow along on their own.

---

## What You're Setting Up (and Why)

You're going to install **Docker Desktop** and then use **agent-sandbox** to create an isolated coding environment. Here's what each piece does:

| Piece | What it is | Why you need it |
|-------|-----------|----------------|
| **Docker Desktop** | An app that runs "containers" — isolated mini-environments on your computer ([details](./install-docker.md)) | Keeps all your coding tools separate from your personal files and apps. Nothing gets cluttered. |
| **agent-sandbox** | A tool that sets up Docker containers specifically for AI-assisted coding | Installs your AI coding assistant, programming languages, and development tools inside a container — automatically |
| **OpenCode** | A free, open-source AI coding assistant | The AI that will actually help you write code. Runs inside the container. |

**The result**: you type `sandbox-me` in any project folder, and you're instantly in a fully equipped coding environment. Close it, and nothing is left running. Your files are saved on your computer — only the tools live inside Docker.

---

## Prerequisites

- A computer running Windows 10/11, macOS, or Linux
- An internet connection
- About 2 GB of free disk space
- ~15-20 minutes for the full setup

---

## Step-by-Step

### 1. Open a terminal

If you've never used a terminal before, see [What Is a Terminal](./open-terminal.md).

### 2. Install Docker Desktop

If Docker is not already installed, see [Install Docker Desktop](./install-docker.md).

Verify it's working:

```
docker --version
```

You should see something like `Docker version 24.x.x` or higher.

Then test it's actually running:

```
docker run hello-world
```

You should see "Hello from Docker!" in the output.

### 3. Install Git (if not already installed)

Git is how you download code from the internet and track changes to your own code. (Want to know more? See [What Is Version Control](./concepts/what-is-version-control.md) and [What Is GitHub](./what-is-github.md).)

Check if it's installed:

```
git --version
```

If not:
- **Windows**: Download from https://git-scm.com/download/win — run installer, accept defaults
- **Mac**: Run `git --version` — macOS will offer to install developer tools. Accept.
- **Linux**: `sudo apt install git` (Ubuntu/Debian) or `sudo dnf install git` (Fedora)

### 4. Create a projects folder and get agent-sandbox

Pick a place for your coding projects:

```
mkdir -p ~/Projects
cd ~/Projects
git clone https://github.com/jdeworks/agent-sandbox.git
cd agent-sandbox
```

On Windows (if not using WSL):
```
mkdir C:\Projects
cd C:\Projects
git clone https://github.com/jdeworks/agent-sandbox.git
cd agent-sandbox
```

### 5. Run the setup

**Mac/Linux/WSL:**
```
./src/scripts/unix/sandbox-setup.sh
```

**Windows (without WSL):**
```
.\tools\build-windows.bat
```

The wizard will ask a few questions:

- **Template**: Choose based on your project:
  - **"Static Website"** — for portfolios, blogs, landing pages (lighter setup)
  - **"Web App"** — for interactive sites, shops, apps with user accounts (includes more tools, also works for simple sites)
- **Customize?**: Say "no" for the quick path (defaults to OpenCode + Node.js)
- Wait for the build to finish (~3-5 minutes)

### 6. Create your first project

```
cd ~/Projects
mkdir my-website
cd my-website
sandbox-me
```

You should see the OpenCode interface. You're in.

---

## What You Can Change

The quickstart picks sensible defaults, but this is YOUR setup. Here's what you can customize:

### Use a different AI coding assistant

The sandbox supports four AI agents:
- **OpenCode** (default) — free, open-source, no API key needed
- **Claude Code** — by Anthropic, requires an API key or subscription
- **Cursor CLI** — command-line version of the Cursor editor
- **GitHub Copilot** — by GitHub/Microsoft, requires a subscription

To change: run `sandbox-setup` again and say "yes" to customize, then pick a different agent. Or edit your profile directly at `~/.agent-sandbox/profiles/<your-profile>/profile.json`.

### Add more programming languages

The default templates include Node.js (for web development). You can add:
- Python, Go, Rust, C#, Java, Ruby, PHP, and more

To change: customize during setup, or re-run `sandbox-setup` and say "yes" to customize.

### Add VS Code Server

Want to code in a browser instead of a terminal? The sandbox can include VS Code Server — a full code editor that runs in your web browser.

To enable: choose to customize during setup and select VS Code Server as an addition.

### Export and share your setup

Once you have a profile you like:
```
sandbox-setup --export my-profile my-profile.json
```

Share that file with anyone, and they can import it:
```
sandbox-setup --import my-profile.json
```

---

## Troubleshooting

| Problem | Solution |
|---------|----------|
| "docker: command not found" | Docker Desktop isn't installed or the terminal needs to be reopened |
| "Cannot connect to the Docker daemon" | Open the Docker Desktop app and wait for it to fully start |
| "sandbox-me: command not found" | Run `source ~/.bash_aliases` to reload your shell, or open a new terminal |
| Build is very slow | Normal on first run — Docker is downloading base images. Subsequent builds are much faster. |
| Ports already in use | The sandbox auto-remaps ports if there's a conflict. Check the output for the actual port numbers. |

---

## How It Works (For the Curious)

When you run `sandbox-me`:

1. It reads the `.sandbox` file in your project folder (or creates one)
2. It finds your profile at `~/.agent-sandbox/profiles/<name>/`
3. It generates a Docker Compose configuration
4. It mounts your project folder into the container (your files stay on YOUR computer)
5. It auto-detects your project type (Node.js, Python, etc.) and installs dependencies
6. It starts the AI coding assistant you configured
7. You're dropped into the container, ready to work

When you exit, the container stops. Your files are still on your computer. Run `sandbox-me` again to pick up where you left off.

The container is disposable. If something goes wrong, delete it and `sandbox-me` creates a new one. Your code is safe because it lives outside the container.
