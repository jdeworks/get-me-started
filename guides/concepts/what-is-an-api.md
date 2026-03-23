# What Is an API (and What Is an API Key)?

## API — The Simple Version

An **API** (Application Programming Interface) is a way for programs to talk to each other. Just like a website is designed for humans to interact with (using a browser), an API is designed for programs to interact with (using code).

**Example**: When a weather app on your phone shows today's forecast, it's not measuring the weather itself. It's asking a weather service's API: "What's the weather in Amsterdam?" The API sends back the data, and the app displays it.

## Why You'll Encounter APIs

When building a website, APIs let you add features without building everything from scratch:

- Show a map → use Google Maps API
- Send emails → use an email service API
- Accept payments → use Stripe API
- Use AI → use OpenAI, Anthropic, or other AI APIs

Your AI coding assistant might suggest using APIs for features like these. You don't need to understand the technical details — the AI writes the code that talks to the API.

## What Is an API Key?

An API key is like a password that identifies you to a service. When you use someone's API, they want to know who's making the request — to track usage, enforce limits, and bill you if applicable.

**Example**: To use OpenAI's API (the technology behind ChatGPT), you'd:
1. Create an account on OpenAI's website
2. Generate an API key (a long string of random characters)
3. Put that key in your code or configuration
4. When your code calls the API, it includes the key so OpenAI knows it's you

## Important: Keep API Keys Secret

API keys are like passwords. Never:
- Share them publicly (like posting them on GitHub)
- Put them directly in your code
- Send them in chat messages

Instead, store them in a special file called `.env` (environment file) that stays on your computer and doesn't get uploaded anywhere. Your AI coding assistant knows how to set this up safely.

## Do You Need API Keys to Get Started?

**No.** The default setup uses OpenCode, which is free and doesn't require an API key. You only need API keys if you:

- Switch to a paid AI tool (like Claude Code)
- Add features that use external services (maps, payments, etc.)
- Want to use the think-tank project planner with your own AI provider

Your AI assistant will tell you if and when an API key is needed, and walk you through getting one.

## Free vs. Paid APIs

Many APIs have a **free tier** — you can make a certain number of requests for free, and only pay if you exceed that. For a personal website, the free tier is usually more than enough.

| Service | Free tier | Typical use |
|---------|-----------|------------|
| GitHub API | Very generous | Code hosting, deployment |
| OpenAI API | Small free credit, then pay-per-use | AI features |
| Google Maps | $200/month free credit | Maps and location |
| Stripe | Free until you make money | Payments |

You won't need any of these to build your first website. But it's good to know they exist for when you want to add features later.
