# LA28 Olympics Ticket Strategy

A Claude Code skill that builds a personalized ticket purchase strategy for the LA 2028 Olympics.

## What it does

Run `/purchase-plan` in Claude Code and it will:

1. Ask about your preferred sports, budget, dates, and seating preferences
2. Analyze the full LA28 schedule (800+ sessions across 58 sports)
3. Check for time conflicts and venue travel feasibility
4. Recommend specific seating tiers based on venue size and value
5. Generate a prioritized purchase checklist with backup options and cross-sport contingency rules

The output is a `TICKET_PURCHASE_PLAN.md` cheat sheet designed to be used during a time-pressured ticket purchasing window.

## Setup

1. Clone this repo
2. Open it in [Claude Code](https://claude.ai/code)
3. Run `/purchase-plan`

The schedule data refreshes automatically from the [live Google Sheet](https://docs.google.com/spreadsheets/d/1N8y_tcoS54UFA20kW2Sg3E1lGjupyoHC8c0KZ3WCfvs/edit?gid=906768637#gid=906768637) each time a session starts. If the fetch fails (e.g. network restrictions), the local snapshot is used as a fallback.

## Data sources

- **Schedule:** [LA28 Olympic Games Competition Schedule v3.0](https://la28.org/content/dam/latwentyeight/competition-schedule-imagery/uploaded-march-16-v-3-0/LA28OlympicGamesCompetitionScheduleByEventV3.0.pdf), extracted and organized by [u/CertainMoose](https://www.reddit.com/user/CertainMoose/)
- **Prices:** Crowd-sourced from [r/olympics ticket price thread](https://www.reddit.com/r/olympics/comments/1satf4p/ticket_price_requests_thread/), compiled by [u/2hjstan](https://www.reddit.com/user/2hjstan/)

Prices are approximate and not guaranteed.
