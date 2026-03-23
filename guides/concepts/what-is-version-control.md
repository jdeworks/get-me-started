# What Is Version Control?

## The Simple Version

Version control is a system that records every change you make to your files, so you can:

- **Go back in time** if something breaks
- **See what changed** and when
- **Work on experiments** without risking your working version
- **Collaborate** with others without overwriting each other's work

Think of it as an unlimited undo button with a detailed history of every change you've ever made.

## The Problem It Solves

Without version control, people do things like:

```
my-website-v1/
my-website-v2/
my-website-v2-final/
my-website-v2-final-FIXED/
my-website-v2-final-FIXED-for-real/
```

Sound familiar? Version control eliminates this. You have one folder, and the tool tracks all the versions behind the scenes.

## Git — The Version Control Tool

**Git** is the most widely used version control tool in the world. It was created by Linus Torvalds (who also created Linux) and is used by virtually every software team on the planet.

Git runs on your computer and tracks changes in a project folder. Key concepts:

### Commit

A **commit** is a snapshot of your files at a point in time, with a message describing what you changed. Like saving a game — you can always load a previous save.

```
commit: "Add navigation bar to homepage"
commit: "Fix broken link on about page"
commit: "Add contact form"
```

### Branch

A **branch** is a parallel version of your project. You can create a branch to try something new. If it works, you merge it into the main branch. If it doesn't, you delete it — no harm done to the main version.

### Repository (Repo)

A **repository** is a project folder tracked by Git. It contains your files plus the hidden `.git` folder where Git stores all the version history.

## Git vs. GitHub

These are related but different:

| | What it is | Where it runs |
|-|-----------|---------------|
| **Git** | The version control tool | On your computer |
| **GitHub** | A website that hosts Git repositories | On the internet |

Git works without GitHub. You can track changes locally and never go online. But GitHub adds:

- A backup of your code in the cloud
- A way to share your code with others
- Free website hosting (GitHub Pages)
- Collaboration tools (issues, pull requests)

See [What Is GitHub](../what-is-github.md) for more.

## When Do You Need Version Control?

Your AI coding assistant sets up Git automatically as part of the project setup. You don't need to learn Git commands — the AI handles commits.

But knowing it's there is useful because:

- If something breaks, you (or the AI) can go back to a working version
- When you're ready to deploy, Git is how your code gets to GitHub
- It's the universal tool of software development — learning the basics eventually pays off

## Want to Learn Git Commands?

You don't need to, but here are the basics if you're curious:

| Command | What it does |
|---------|-------------|
| `git init` | Start tracking a folder with Git |
| `git add .` | Stage all changes for the next commit |
| `git commit -m "message"` | Save a snapshot with a description |
| `git log` | See the history of commits |
| `git status` | See what's changed since the last commit |
| `git branch feature-name` | Create a new branch |
| `git checkout feature-name` | Switch to a branch |
| `git push` | Send your commits to GitHub |

Your AI coding assistant uses these commands for you. But if you want to try them yourself, they won't break anything — Git is designed to be safe.
