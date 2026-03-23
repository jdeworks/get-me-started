# What Is GitHub (and Why You Might Need It)

GitHub is like Google Drive, but for code. It stores your files online, keeps a history of every change you've ever made, and lets you share your work with others — or put your website online for free.

You don't need a GitHub account to start building your website. But you'll want one when you're ready to:

- **Put your website online** (GitHub offers free hosting called "GitHub Pages")
- **Back up your code** (so it's not only on your computer)
- **Show your work** (a GitHub profile is like a portfolio for developers)

---

## Key Concepts (In Plain English)

### Repository (or "repo")

A repository is a project folder that GitHub tracks. It contains your files and the complete history of every change. Think of it as a folder with an undo button that goes all the way back to the beginning.

### Git

Git is the tool that tracks changes. GitHub is the website that stores your Git repositories online. Git runs on your computer; GitHub lives on the internet. They work together.

When people say "push to GitHub," they mean: send the latest version of your files from your computer to GitHub's servers.

### Commit

A commit is a saved snapshot of your code at a specific point in time. Like saving a version of a document with a note about what you changed. You can go back to any commit if something goes wrong.

### Branch

A branch is a parallel version of your code. You can experiment on a branch without affecting the main version. If the experiment works, you merge it in. If it doesn't, you delete the branch. No harm done.

---

## Creating a GitHub Account

1. Go to https://github.com
2. Click **Sign up**
3. Enter your email, create a password, choose a username
4. Complete the verification (they'll send you an email)
5. You're done

Your username becomes part of your GitHub URLs (like `github.com/yourname`), so pick something you'd be comfortable sharing professionally.

---

## Setting Up Git on Your Computer

After creating a GitHub account, tell Git who you are (this labels your changes):

```
git config --global user.name "Your Name"
git config --global user.email "your-email@example.com"
```

Use the same email you used for your GitHub account.

---

## Connecting Your Computer to GitHub

To send code from your computer to GitHub, you need to set up authentication. The easiest way:

### Using GitHub CLI (recommended)

Install it first:
- **Windows**: `winget install --id GitHub.cli` (or download from https://cli.github.com)
- **Mac**: `brew install gh`
- **Linux**: See https://cli.github.com for install instructions

Then run:
```
gh auth login
```

Follow the prompts — it will open your browser to confirm.

### Using SSH keys (alternative)

Your AI assistant can walk you through this when the time comes. It involves generating a key on your computer and adding it to your GitHub account. It sounds complicated but takes about 2 minutes with guidance.

---

## When Will You Need This?

**Not right away.** Focus on building your website first. When you're ready to put it online, your AI coding assistant will walk you through:

1. Creating a repository on GitHub
2. Pushing your code to it
3. Setting up GitHub Pages (free hosting) or another hosting option

The [make-a-website](https://github.com/jdeworks/make-a-website) knowledge base includes complete guides for hosting — your AI assistant will use these when the time comes.

---

## Want to Learn More?

GitHub has much more to offer as you grow:

- **Issues** — track bugs and feature requests for your project
- **Pull Requests** — propose and review code changes (useful when collaborating)
- **Actions** — automate tasks like testing and deploying your website
- **Pages** — host static websites for free directly from a repository
- **Explore** — discover interesting open-source projects and learn from their code

All of the tools in the get-me-started ecosystem are hosted on GitHub as open-source projects. You can read their code, suggest improvements, or use them as inspiration for your own work. That's the power of open source — everything is transparent and shared.
