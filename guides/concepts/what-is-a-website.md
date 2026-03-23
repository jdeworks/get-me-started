# What Is a Website (Technically)?

You use websites every day. But what actually happens when you open one?

## The Simple Version

A website is a collection of files — mostly text files — that your browser (Chrome, Firefox, Safari) knows how to display as the pages you see.

When you type a web address or click a link:

1. Your browser asks a server (a computer somewhere on the internet) for those files
2. The server sends them back
3. Your browser reads the files and draws the page you see

That's it. A website is files on a computer, and a browser that knows how to read them.

## The Three Languages of the Web

Almost every website is built with three languages that work together:

### HTML — The Structure

HTML (HyperText Markup Language) defines **what's on the page**. Headings, paragraphs, images, buttons, links. Think of it as the skeleton.

```html
<h1>Welcome to My Website</h1>
<p>This is a paragraph of text.</p>
<button>Click me</button>
```

You don't need to memorize this. Your AI assistant writes it for you. But it's good to know that behind every webpage, there's HTML like this.

### CSS — The Style

CSS (Cascading Style Sheets) defines **how things look**. Colors, fonts, spacing, layout. Think of it as the paint and decoration.

```css
h1 {
  color: blue;
  font-size: 36px;
}
```

This makes all main headings blue and 36 pixels tall. CSS is how you make things look good.

### JavaScript — The Behavior

JavaScript defines **what things do**. When you click a button and something happens, that's JavaScript. Dropdown menus, form validation, animations, loading new content without refreshing the page.

```javascript
button.addEventListener('click', () => {
  alert('You clicked the button!');
});
```

Not every website needs JavaScript. A simple portfolio or blog can be just HTML and CSS. But anything interactive needs it.

## Static vs. Dynamic Websites

### Static Website

The files are pre-built and the same for everyone. Like a printed brochure — the same every time you look at it.

**Good for**: portfolios, blogs, documentation, small business pages.
**Hosting**: free on GitHub Pages and many other services.

### Dynamic Website

The server builds pages on the fly, often using a database. Like a newspaper that updates throughout the day.

**Good for**: shops, social networks, apps with user accounts, anything where content changes based on who's viewing it.
**Hosting**: needs a server that runs your code (services like Railway, Vercel, or your own server).

Your AI assistant will ask what you want to build and recommend the right approach.

## What Is "Running a Website Locally"?

When you develop a website, you don't put it on the internet right away. Instead, you run it on your own computer. This is called **running locally** or **localhost**.

Your computer starts a small web server, and you open `http://localhost:3000` (or a similar address) in your browser. You see your website, but nobody else can — it's just on your machine.

This lets you make changes and see them instantly, without affecting anything online. When you're happy with how it looks, you **deploy** it — which means putting it on a real server so the world can see it.

## What Is a Framework?

As websites get more complex, people use **frameworks** — pre-built tools that handle common patterns so you don't have to reinvent the wheel.

For example, **React** (by Meta) makes it easier to build interactive user interfaces. **Tailwind CSS** makes it easier to style things consistently. **Vite** makes your development experience faster.

The [make-a-website](https://github.com/jdeworks/make-a-website) knowledge base starts you with plain HTML, CSS, and JavaScript (the simplest approach) and offers a path to upgrade to React later if your project needs it. You don't have to decide now.

## Do You Need to Understand All This?

Not to get started. Your AI assistant handles the code. But understanding the basics helps you:

- Know what the AI is doing (and ask better questions)
- Make decisions about your website ("I want a static site" vs. "I need user accounts")
- Debug when something doesn't look right ("the CSS might be wrong" vs. being completely lost)

The more you build, the more this will make sense naturally.
