# What Are File Paths (and How to Navigate Folders)?

When you use a terminal, you navigate your computer by typing folder names instead of clicking on them. A **file path** is the address of a file or folder on your computer — like a street address for your files.

## The Basics

### What a path looks like

**Mac/Linux:**
```
/Users/sarah/Projects/my-website/index.html
```

**Windows:**
```
C:\Users\Sarah\Projects\my-website\index.html
```

Reading left to right:
- Start at the root of the drive (`/` on Mac/Linux, `C:\` on Windows)
- Go into `Users`, then `sarah` (or `Sarah`), then `Projects`, then `my-website`
- The file is `index.html`

The slashes (`/` or `\`) separate folder names. Mac/Linux use forward slashes. Windows uses backslashes.

### Where you are right now

The terminal is always "inside" a folder. To see which folder you're in:

**Mac/Linux:**
```
pwd
```

**Windows (PowerShell):**
```
cd
```

This prints your **current directory** — the folder you're currently working in.

## Moving Around

### Go into a folder
```
cd Projects
```
This moves you into a folder called "Projects" that's inside your current folder.

### Go up one folder
```
cd ..
```
The `..` means "the folder above this one." You can chain them: `cd ../..` goes up two levels.

### Go to a specific path
```
cd /Users/sarah/Projects
```
or on Windows:
```
cd C:\Users\Sarah\Projects
```

### Go to your home folder

**Mac/Linux:**
```
cd ~
```
or:
```
cd
```

The `~` symbol is a shorthand for your home folder (`/Users/yourname` on Mac, `/home/yourname` on Linux).

**Windows (PowerShell):**
```
cd $HOME
```
or:
```
cd ~
```

Your home folder is `C:\Users\YourName`.

## Listing What's Here

**Mac/Linux:**
```
ls
```

**Windows (PowerShell):**
```
dir
```

This shows all files and folders in your current location. Use this when you're not sure what's in a folder.

## Creating Folders

```
mkdir my-new-folder
```

This creates a new folder. On Mac/Linux, `mkdir -p path/to/nested/folder` creates all the folders in the path at once, even if the parent folders don't exist yet.

## Common Confusion Points

### "I'm in the wrong folder"

If a command says "file not found" or "no such directory," you're probably in the wrong place. Use `pwd` (Mac/Linux) or `cd` (Windows) to check where you are, then navigate to the right folder.

### Spaces in folder names

If a folder name has a space (like `My Projects`), wrap it in quotes:
```
cd "My Projects"
```

Without quotes, the terminal thinks you're giving it two separate things.

### The `~/Projects` pattern

In this guide, you'll often see `~/Projects`. That means:
- `~` = your home folder
- `/Projects` = a folder called "Projects" inside your home folder

On Windows, the equivalent is `C:\Users\YourName\Projects`.

## You Don't Need to Memorize This

Your AI assistant handles navigation for you. It gives you the exact `cd` command to run. But understanding the basics helps you:

- Know where your files are
- Recognize when you're in the wrong place
- Feel less lost when the terminal shows a path
