---
name: purchase-plan
description: Build a personalized LA28 Olympics ticket purchase strategy with prioritized event codes, tier guidance, backup options, and cross-sport contingency rules.
argument-hint: (optional) sports or preferences to start with, e.g. "swimming, basketball, budget $3000"
---

# LA28 Ticket Purchase Plan Builder

You are helping the user build a personalized ticket purchase strategy for the
LA 2028 Olympics. The output is a cheat sheet they'll use during a time-pressured
ticket purchasing window — it must be scannable, actionable, and handle sell-out
contingencies gracefully.

## Step 1: Read the Schedule Data

**Source of truth (live Google Sheet):**
https://docs.google.com/spreadsheets/d/1N8y_tcoS54UFA20kW2Sg3E1lGjupyoHC8c0KZ3WCfvs/edit?gid=906768637#gid=906768637

The repo contains `LA28 SCHEDULE.xlsx`, a local snapshot of this sheet.
Before building a plan, tell the user:

> The schedule data is from a local snapshot. The live version may have updates.
> Check the Google Sheet link above and re-download the xlsx if the sheet has
> been modified since the snapshot was taken.

Read the spreadsheet `LA28 SCHEDULE.xlsx` in the repo root using Python with
openpyxl. Extract data from these sheets:

- **Schedule By Time Slot** — one row per bookable session (this is the primary
  sheet for building the plan; each row = one ticket/session code)
- **REPORTED PRICES** — crowd-sourced price tier data per sport
- **ABOUT** — venue zones and metadata

Parse into structured data you can query: session code, sport, venue, zone, date,
session type (Preliminary/Quarterfinal/Semifinal/Bronze/Final), description,
start time, end time.

## Step 2: Gather User Preferences

Ask the user the following. If they provided info via $ARGUMENTS, skip questions
you can already answer.

1. **Sports interest** — ranked list. Ask for must-haves vs. nice-to-haves.
2. **Existing tickets** — any sessions they already own (session codes or
   sport + date). These are schedule constraints.
3. **Blocked dates** — dates they cannot attend events.
4. **Date availability** — full games (Jul 10-30) or a subset? Are they
   traveling from out of town? What trip length is reasonable?
5. **Tickets per event** — how many tickets per session (e.g., 2 for a pair).
6. **Total ticket limit** — max tickets they can purchase in this window.
7. **Budget range** — total budget ceiling and/or per-ticket comfort zone.
   Ask if they have a reference point (e.g., "I paid $X for sport Y before").
8. **Session type preference** — finals/medals only, or are prelims and
   earlier rounds acceptable?
9. **Seating priority** — cheapest available, best value mid-tier, or
   premium seats regardless of cost?
10. **Double-header tolerance** — are they open to multiple events in one day?
    If so, how much buffer between events do they want? (Same venue is safest.)
11. **Any sports/events to explicitly exclude.**

## Step 3: Build the Candidate List

Based on preferences, filter sessions from the schedule:

- Match preferred sports
- Exclude blocked dates and conflicting times with existing tickets
- Prioritize session types the user wants (finals > semis > prelims, or as stated)
- Note venue and zone for each — this matters for multi-event days

Present the relevant sessions to the user grouped by sport, showing:
- Session code, date, time, venue, zone, session type, event description
- Which sessions overlap or conflict with each other
- Which sessions could form same-day pairings (with travel time estimates)

### Venue Travel Times (approximate, account for Olympic traffic)

Use these estimates when checking same-day feasibility:

- Inglewood (2028 Stadium) <-> Long Beach: 30-45 min
- Inglewood <-> Exposition Park: 15-20 min
- Inglewood <-> Anaheim (Honda Center): 40-50 min
- Long Beach <-> Anaheim: 25-35 min
- Exposition Park <-> Long Beach: 30-40 min
- Exposition Park <-> Anaheim: 40-50 min
- Carson <-> Inglewood: 15-25 min
- Carson <-> Long Beach: 15-20 min
- Pasadena <-> Inglewood: 30-45 min

For double-headers at DIFFERENT venues, require at minimum 2 hours between
end of event 1 and start of event 2 (to account for exiting, transit, entry).
For SAME venue, 60 minutes is sufficient.

## Step 4: Select the Slate

Work with the user to narrow down to a specific slate of events that:

- Fits within their ticket limit (total tickets / tickets per event = max events)
- Respects all schedule conflicts
- Creates a reasonable trip shape (no long gaps with an outlier event isolated
  days away from the cluster, unless the user is fine with it)
- Balances budget across events

When finalizing, confirm:
- The exact session codes
- The number of tickets per session
- That no two sessions overlap or create impossible transit

## Step 5: Determine Tier Selections

For each event on the slate, recommend a specific seating tier based on:

### Tier Selection Principles

1. **Venue size matters most.** Small venues (< 10K like aquatics centers)
   have no bad seats — mid-tier is excellent. Massive venues (> 50K like
   stadiums) require higher tiers for the experience to be worth it vs. TV.

2. **Use the REPORTED PRICES sheet** to identify how many tiers exist for
   each sport/session type and what the price points are.

3. **Match the user's stated budget and seating priority.** If they gave a
   reference purchase (e.g., "I paid $X for sport Y"), use that as the
   calibration point.

4. **General guidelines by venue capacity:**
   - ~5K venue (aquatics, etc.): Tier 2 of 4 is great value
   - ~12-15K venue (temp stadiums, arenas): Tier 2-3 of 4
   - ~18-20K venue (NBA/NHL arenas): Tier 3 of 4 for value, Tier 2 for quality
   - ~50K+ venue (stadiums): Upper-mid tiers. Avoid the cheapest 1-2 tiers
     unless budget requires it — the experience suffers at that distance.

5. **Present the tier as:** "Tier X of Y (~$NNN)" — both the position and
   dollar amount, since the ticketing platform may label tiers differently.

## Step 6: Build Backup Chains

For each event on the slate, identify 1-3 backup session codes in case the
primary sells out. Backups should:

- Be the same sport or a comparable experience
- Not conflict with other events on the slate
- Ideally be on the same day or nearby dates to preserve trip shape
- Include the recommended tier and price for each backup

### Cross-Sport Contingencies

**This is critical.** Identify any cases where a backup for one sport would
create a conflict with another sport's primary or backup. Common patterns:

- A backup moves to a different day that already has another event
- A backup moves to the same day/venue as another event at a conflicting time
- Falling back to an earlier round changes the date, affecting trip shape

For each cross-sport dependency, write an explicit IF/THEN rule:
> "If [Event A] is sold out and you buy [Backup X] instead,
> then you MUST also change [Event B] from [code] to [alt code]
> because [reason]."

## Step 7: Generate the Cheat Sheet

Create a markdown file called `TICKET_PURCHASE_PLAN.md` (or a user-specified
filename) with the following sections:

### 7a. Quick Reference Table
All session codes (primary + backups) with date, time, venue in one table
for fast lookup.

### 7b. Tier Selection Guide
One subsection per sport explaining:
- Venue name and approximate capacity
- All known price tiers (from REPORTED PRICES)
- Which tier to select and why
- The dollar amount to look for on the seat map

### 7c. Purchase Sequence
A numbered checklist of events in purchase priority order. Each step shows:
- The primary session code + tier + price
- Inline "if sold out" fallback chain with codes + tiers
- Any flag/rule triggers for cross-sport contingencies

**Purchase priority order should balance:**
- User's preference ranking (what they want most)
- Sell-out risk (swimming/gymnastics finals sell first; large-venue prelims last)
- Dependency order (buy the event that others depend on first)

### 7d. Contingency Flags
If there are cross-sport dependencies, define simple tracking flags the user
sets as they go (e.g., `VB_PLAN = DOUBLE_HEADER or FALLBACK`). Reference
these flags in the purchase steps so the user knows when a swap is triggered.

### 7e. Resulting Schedules
Show 2-3 calendar views:
- Best case (all primaries available)
- Most likely fallback scenario(s)
Each as a simple text calendar showing date, event code, sport, time.

### 7f. Budget Summary
Table with every primary event: venue, target tier, price per ticket,
quantity, subtotal. Show total. Then a backup price comparison table.

## Important Notes

- **All prices in the REPORTED PRICES sheet are approximate** — sourced from
  Reddit and previous sales. Note this caveat prominently.
- **The schedule data is from the official LA28 competition schedule v3.0.**
  Session codes and times may change; advise checking la28.org before purchase.
- Session types labeled "Final" in the schedule sometimes include semifinals
  or qualifying rounds in the same session — look at the event description
  for what's actually in the session.
- The user may need to iterate. Be prepared to swap events, adjust budget,
  or change backup chains based on their feedback.
