# What Is a Package Manager?

## The Simple Version

A package manager is a tool that installs, updates, and removes software **packages** (pre-built code libraries) with a single command.

Instead of manually downloading files from websites and figuring out where to put them, you type:

```
npm install some-library
```

And the package manager handles everything.

## Why It Exists

Modern software is built on top of other software. Your website might use:

- A styling library (like Tailwind CSS) so you don't write all CSS from scratch
- A testing framework (like Vitest) to check that your code works
- A build tool (like Vite) to bundle everything for production
- Hundreds of small utilities that these tools depend on

These are called **dependencies** — things your project depends on to work. A package manager tracks all of them, installs the right versions, and keeps them up to date.

## npm — The Package Manager You'll Use

**npm** (Node Package Manager) comes bundled with Node.js. When you install Node.js, you get npm automatically.

Key commands:

| Command | What it does |
|---------|-------------|
| `npm install` | Installs all dependencies listed in your project's `package.json` file |
| `npm install some-library` | Adds a specific library to your project |
| `npm run dev` | Runs a script defined in your project (usually starts the development server) |
| `npm run build` | Builds your project for production (deployment) |

## The package.json File

Every Node.js project has a `package.json` file — think of it as a recipe card. It lists:

- The project name and description
- All the dependencies (libraries) the project needs
- Scripts (commands) you can run, like `npm run dev`

When someone shares a project with you, you run `npm install` and it reads `package.json` to install everything needed. This is how the [project-starter-kit](https://github.com/jdeworks/project-starter-kit) starter template works — one command and all dependencies are ready.

## The node_modules Folder

When npm installs dependencies, it puts them in a folder called `node_modules`. This folder can get very large (hundreds of megabytes) because it contains all the libraries and everything *they* depend on.

You never need to look inside it or edit anything in it. And you never upload it to GitHub — the `package.json` file is enough for anyone to recreate it with `npm install`.

## Other Package Managers

npm isn't the only one. You might hear about:

| Manager | Ecosystem | Notes |
|---------|-----------|-------|
| **npm** | Node.js/JavaScript | Default, comes with Node.js |
| **yarn** | Node.js/JavaScript | Alternative to npm, similar commands |
| **pnpm** | Node.js/JavaScript | Faster alternative, saves disk space |
| **pip** | Python | Installs Python packages |
| **cargo** | Rust | Installs Rust packages |
| **apt/dnf** | Linux | Installs system-level software |

For building websites, npm is the default and works great. You don't need to switch unless you have a reason to.

## Do You Need to Understand This?

Not deeply. Your AI coding assistant runs `npm install` and `npm run dev` for you. But knowing what a package manager does helps you understand:

- Why `npm install` takes a moment (it's downloading libraries)
- What `package.json` is (the project's ingredient list)
- Why `node_modules` is huge (lots of dependencies)
- What the AI means when it says "I'll install a library for that"
