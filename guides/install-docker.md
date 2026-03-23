# Install Docker Desktop

Docker Desktop is a free app that lets you run "containers" — isolated environments on your computer. Think of a container as a mini computer inside your computer. It has its own tools and programs, completely separate from your personal files. (For how Docker fits into the bigger setup picture, see [Setup: Sandbox](./setup-sandbox.md).)

**Why we use it**: Your coding tools and AI assistant run inside a container. When you're done, close the container and nothing is left behind. Want to start fresh? Delete the container and make a new one. Your personal computer stays clean.

---

## What You Need

- Windows 10/11, macOS 10.15+, or a supported Linux distribution
- At least 4 GB of RAM (8 GB recommended)
- About 2 GB of free disk space (the download is ~500 MB, plus ~1-2 GB for the coding environment images)
- Admin/password access on your computer (you'll need it during installation)
- A decent internet connection (if you're on slow or metered internet, the Direct Install path downloads much less — about 30 MB for Node.js)

---

## Installation

### Windows

1. Go to https://www.docker.com/products/docker-desktop/
2. Click **"Download for Windows"**
3. Run the downloaded file (`Docker Desktop Installer.exe`)
4. Accept the defaults — when it asks about **WSL 2**, say **yes**. (WSL stands for "Windows Subsystem for Linux" — it's a built-in feature that lets Windows run Linux tools. Docker needs it to work. You don't need to understand it — saying yes is the right move.)
5. Click **Install**, then **Close and restart** when prompted
6. After your computer restarts, Docker Desktop should open automatically
7. If you see a **Windows Security Alert** about the firewall, click **Allow access**
8. Wait until the Docker icon in your taskbar (bottom-right, near the clock) stops animating — that means it's ready

**If Windows says you need to update WSL**: Open a terminal and run:
```
wsl --update
```
Then restart Docker Desktop.

### Mac

1. Go to https://www.docker.com/products/docker-desktop/
2. Click **"Download for Mac"**
3. Choose the right version:
   - **Apple Silicon** if your Mac has an M1, M2, M3, or M4 chip (most Macs from 2021 onwards)
   - **Intel** if your Mac is older or you're not sure (check: Apple menu > About This Mac > Chip)
4. Open the downloaded `.dmg` file
5. Drag the Docker icon to your **Applications** folder
6. Open Docker from Applications
7. It will ask for your password — that's normal, it needs permission to install networking components
8. Wait for the whale icon in your menu bar (top-right) to stop animating — that means it's ready

### Linux

**The easiest way** is to install Docker Desktop from https://www.docker.com/products/docker-desktop/ — download the `.deb` (Ubuntu/Debian) or `.rpm` (Fedora) package and install it.

**Or install Docker Engine** (command-line only, no desktop app):

Ubuntu/Debian:
```
sudo apt update
sudo apt install docker.io docker-compose-v2
sudo usermod -aG docker $USER
```

Fedora:
```
sudo dnf install docker docker-compose
sudo systemctl enable --now docker
sudo usermod -aG docker $USER
```

After either method, **log out and log back in** for the group change to take effect.

---

## Verify It Works

Open a terminal (see [What Is a Terminal](./open-terminal.md) if needed) and run:

```
docker --version
```

You should see something like:
```
Docker version 24.0.7, build afdd53b
```

Any version 20 or above is fine.

Now test that Docker is actually running:

```
docker run hello-world
```

You should see output that starts with:
```
Hello from Docker!
This message shows that your installation appears to be working correctly.
```

If you see this: Docker is installed and running. You're ready.

---

## Troubleshooting

### "docker: command not found"

Docker Desktop is not installed, or the terminal needs to be reopened. Close the terminal, open a fresh one, and try again. If it still doesn't work, make sure Docker Desktop is installed and that you restarted your computer after installation.

### "Cannot connect to the Docker daemon"

Docker Desktop is installed but not running. Find Docker Desktop in your applications and open it. Wait for the icon to stop animating (it takes a moment to start up). Then try the command again.

### "Permission denied" (Linux)

Run: `sudo usermod -aG docker $USER` then log out and log back in.

### "WSL 2 is not installed" (Windows)

Open a terminal and run: `wsl --install` then restart your computer. Docker Desktop should work after that.

### It's very slow to start

Normal on first launch. Docker is setting up its environment. Subsequent starts are much faster.

### "Virtualization must be enabled" or "Hardware assisted virtualization" (Windows)

Docker needs a CPU feature called hardware virtualization. Most computers have it, but it's sometimes turned off. You need to enable "Intel VT-x" or "AMD-V" in your computer's BIOS/UEFI settings. This involves restarting and pressing a key during boot (often F2, F12, or Delete). If this feels too advanced, consider the [Direct Install path](./setup-direct.md) instead — it doesn't need Docker.

### Antivirus blocks Docker

Some antivirus software flags Docker as suspicious. You may need to add an exception for Docker Desktop in your antivirus settings. The specific steps depend on your antivirus software.

### "Apple cannot verify this app" (Mac)

Go to **System Settings > Privacy & Security**, scroll down, and click **"Open Anyway"** next to the Docker message.

### Docker Desktop asks about a paid subscription

Docker Desktop is **free for personal use** and for small businesses (fewer than 250 employees). If you see a subscription prompt, select personal/individual use. You will not be charged.

---

## What You Can Do Later (For the Curious)

Docker is much more than a beginner tool. Once you're comfortable, you can:

- **Run multiple containers** — one for your website, one for a database, one for an API
- **Use Docker Compose** — define multi-container setups in a single file
- **Share environments** — give someone your Docker configuration and they get the exact same setup
- **Deploy to production** — many professional websites run inside Docker containers in the cloud

You don't need any of this right now. But it's good to know that the tool you just installed is the same one used by companies like Netflix, Spotify, and Airbnb. You're learning a real, professional tool from day one.
