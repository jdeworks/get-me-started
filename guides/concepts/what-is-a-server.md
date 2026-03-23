# What Is a Server?

## The Simple Version

A **server** is a computer that provides something to other computers. That's it. There's nothing magical about servers — they're regular computers with a specific job.

When people say "server," they usually mean one of two things:

1. **A physical computer** sitting in a data center somewhere, running 24/7
2. **A program** running on that computer that responds to requests

## How It Relates to Websites

When you visit a website, here's what happens:

1. You type `mywebsite.com` in your browser
2. Your browser finds the server that hosts that website
3. Your browser asks the server: "Can I have the homepage?"
4. The server sends back the HTML, CSS, and JavaScript files
5. Your browser displays the page

The server is the computer that holds the website's files and sends them to anyone who asks.

## Localhost — Your Computer as a Server

When you develop a website, your own computer acts as a server. The address `localhost` (or `127.0.0.1`) means "this computer." When you run `npm run dev` and open `http://localhost:3000`, you're telling your browser: "Ask this computer for the website, on port 3000."

Nobody else can access it — it's just for you to preview your work.

### What's a port?

Think of your computer as a building with thousands of doors. A **port** is a door number. Port 3000, port 8080, port 5173 — these are just different entry points. Your development server picks one, and your browser goes to that specific door.

If you see a message like "port 3000 already in use," it means something else is already using that door. The dev server will usually pick another one automatically (3001, 3002, etc.).

## Types of Servers

| Type | What it does | Example |
|------|-------------|---------|
| **Web server** | Sends website files to browsers | Nginx, Apache, your `npm run dev` server |
| **API server** | Responds to data requests from apps | Express.js, Django, FastAPI |
| **Database server** | Stores and retrieves data | PostgreSQL, MySQL, SQLite |
| **File server** | Stores and serves files | Amazon S3, Cloudflare R2 |

For a simple static website, you only need a web server — and hosting services provide one for free.

For a dynamic website (with user accounts, a database, etc.), you need a web server plus an API server plus usually a database server. That's why dynamic hosting isn't always free, though many services offer generous free tiers.

## "Serverless"

You might hear the term **serverless**. It doesn't mean there are no servers — it means you don't manage them. You upload your code, and the hosting service runs it on their servers automatically. You don't worry about the server computer itself.

This is how services like Vercel, Netlify Functions, and AWS Lambda work.

## Do You Need to Understand Servers?

Not right now. When you run `npm run dev`, a local server starts automatically. When you deploy, the hosting service manages the server for you.

But understanding the concept helps you make sense of:
- Why `localhost:3000` works only on your computer
- Why some hosting is free (static files are cheap to serve) and some costs money (running your code takes resources)
- What the AI means when it says "we need a server for this feature"
