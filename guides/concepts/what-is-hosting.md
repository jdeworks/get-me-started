# What Is Hosting (and How Does Your Website Get Online)?

## The Simple Version

When you build a website on your computer, only you can see it. **Hosting** means putting your website's files on a computer that's connected to the internet 24/7, so anyone in the world can visit it.

That computer is called a **server** — because it *serves* your website to visitors.

## How It Works

1. You build your website on your computer (this is called **development**)
2. You upload your files to a hosting service (this is called **deployment**)
3. The hosting service runs a server that's always on
4. When someone types your web address, the server sends them your files
5. Their browser displays your website

## Types of Hosting

### Static Hosting (simplest, often free)

Your website files are uploaded as-is and served directly. No code runs on the server — it just sends the files.

**Good for**: portfolios, blogs, documentation, landing pages
**Cost**: often free
**Examples**: GitHub Pages, Netlify, Cloudflare Pages, Vercel

**GitHub Pages** is straightforward — if your code is already on GitHub, you flip a switch and your site is live. The [make-a-website](https://github.com/jdeworks/make-a-website) knowledge base walks you through this.

### Server Hosting (for dynamic sites)

Your website includes code that runs on the server — for example, to check a database, process a payment, or handle user accounts. The server does work before sending the page.

**Good for**: shops, apps with login, anything with a database
**Cost**: usually has a free tier, then scales with usage
**Examples**: Railway, Vercel, Render, Fly.io, DigitalOcean

### What About "The Cloud"?

"The cloud" just means "someone else's computer." When people say a website is "hosted in the cloud," they mean it's running on servers owned by companies like Amazon (AWS), Google (GCP), or Microsoft (Azure). Most hosting services use these under the hood.

You don't need to think about the cloud directly. Your hosting service handles it.

## Domain Names

A **domain name** is your website's address — like `mywebsite.com`. Without one, your site still works but has an ugly URL like `yourname.github.io/my-project`.

Domains cost about $10-15/year from registrars like Namecheap, Porkbun, or Cloudflare. This is the one thing you might need to pay for, but it's optional — your AI assistant will help you set it up when you're ready.

## When Do You Need to Think About Hosting?

Not until your website is ready to show the world. The development workflow runs everything locally (on your computer) first. When you're happy with it, your AI coding assistant will guide you through deployment.

The typical path:
1. Build and test locally → free, no hosting needed
2. Deploy to GitHub Pages → free for static sites
3. If you need a server, deploy to Railway or similar → free tier available
4. Optionally buy a domain name → ~$10-15/year
