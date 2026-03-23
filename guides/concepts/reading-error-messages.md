# Reading Error Messages

Error messages look scary. Red text, weird codes, walls of technical jargon. But they are not a sign that you broke something — they are your computer telling you what went wrong and where. Learning to read them is one of the most useful skills in programming.

## The Most Important Thing

**Errors are normal.** Professional developers see them dozens of times a day. An error message is not a failure — it's information. It's the computer saying "I tried to do what you asked, but I got stuck here. Here's why."

## How to Read an Error Message

Most error messages follow the same pattern:

```
Error: Cannot find module 'express'
    at Module._resolveFilename (node:internal/modules/cjs/loader:933:15)
    at Module._load (node:internal/modules/cjs/loader:778:27)
    at Function.executeUserEntryPoint [as runMain] (node:internal/modules/run_main:79:12)
```

**Step 1: Read the first line.** That's almost always the most important part. In this example: `Cannot find module 'express'` — it can't find a piece of software called "express."

**Step 2: Ignore the middle.** The indented lines (the "stack trace") show the path the code took before it hit the error. You rarely need to read this. Your AI assistant can interpret it if needed.

**Step 3: Look for a suggestion.** Some errors include a hint:

```
Error: EACCES: permission denied, access '/usr/local/lib/node_modules'
npm ERR! Try running this command again as root/Administrator.
```

That last line tells you what to do: run the command with higher permissions.

## Common Error Patterns (and What They Mean)

| What you see | What it means | What to do |
|-------------|--------------|-----------|
| `command not found` / `not recognized` | The tool isn't installed, or the terminal can't find it | Install the tool, or close and reopen the terminal |
| `permission denied` / `EACCES` | You don't have permission to do that | On Mac/Linux: add `sudo` before the command. On Windows: run terminal as Administrator |
| `ENOENT: no such file or directory` | A file or folder it expected doesn't exist | Check the path — you might be in the wrong folder. Use `pwd` (Mac/Linux) or `cd` (Windows) to check |
| `EADDRINUSE` / `port already in use` | Something else is already using that network port | Close the other program, or the tool will usually pick another port automatically |
| `Cannot find module` | A required library is missing | Run `npm install` to install all dependencies |
| `SyntaxError` | There's a typo or formatting mistake in the code | Tell your AI assistant — it can usually spot and fix these instantly |
| `ETIMEDOUT` / `ECONNREFUSED` | Network connection failed | Check your internet connection. If it's fine, the service might be temporarily down |
| `Docker daemon is not running` | Docker Desktop isn't open | Open the Docker Desktop app and wait for it to start |

## Warnings vs. Errors

Not everything in red or yellow is an error:

- **Errors** stop the program. Something failed and you need to fix it.
- **Warnings** are advice. The program still works, but something could be improved. You can usually ignore warnings, especially as a beginner.

Example warning (safe to ignore):
```
npm warn deprecated inflight@1.0.6: This module is not supported
```

This means a library your project uses is old. It still works. Don't worry about it.

## What to Do When You See an Error

1. **Don't panic.** Read the first line.
2. **Copy the full error message.** Select it all (even the scary parts).
3. **Paste it to your AI assistant.** Say "I got this error" and paste it. The AI is excellent at diagnosing error messages — this is one of its strongest skills.
4. **Follow the AI's suggestion.** It will usually tell you exactly what went wrong and give you a command to fix it.

If the same error keeps coming back after the fix, tell the AI: "I tried that but I'm getting the same error." It will try a different approach.

## The Golden Rule

When in doubt, copy the error and ask for help. You are never expected to understand error messages by yourself. Even experienced developers Google error messages constantly. The skill isn't memorizing what every error means — it's knowing that the error contains the answer, and knowing who (or what) to ask for help interpreting it.
