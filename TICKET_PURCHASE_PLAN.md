# LA28 Ticket Purchase Plan

**Source data:** [LA28 Schedule Google Sheet](https://docs.google.com/spreadsheets/d/1N8y_tcoS54UFA20kW2Sg3E1lGjupyoHC8c0KZ3WCfvs/edit?gid=906768637#gid=906768637)
*Snapshot date: April 8, 2026. Check the live sheet for updates before purchasing.*

---

## Quick Reference — All Codes

| Code | Event | Date | Time | Venue |
|------|-------|------|------|-------|
| WPO26 | Men's WP Gold | Sat 7/22 | 15:00-17:00 | LB Aquatics |
| WPO25 | Men's WP Bronze | Sat 7/22 | 11:30-13:00 | LB Aquatics |
| WPO23 | Men's WP Semi (2 matches) | Fri 7/21 | 11:30-14:30 | LB Aquatics |
| SWM14 | Swim Finals (100m Free Final) | Fri 7/28 | 18:00-20:00 | 2028 Stadium |
| SWM04 | Swim Finals (100m Fly, 400m IM) | Sun 7/23 | 18:00-20:00 | 2028 Stadium |
| SWM06 | Swim Finals (W 100m Free, 400m IM) | Mon 7/24 | 18:00-20:00 | 2028 Stadium |
| SWM08 | Swim Finals (200m Free, 1500m) | Tue 7/25 | 18:00-20:00 | 2028 Stadium |
| VVO50 | Men's VB Gold | Sat 7/29 | 10:00-13:15 | Honda Center |
| VVO51 | Women's VB Bronze | Sat 7/29 | 14:45-17:15 | Honda Center |
| VVO52 | Women's VB Gold | Sun 7/30 | 10:00-13:15 | Honda Center |
| VVO45 | Men's VB Semi | Wed 7/26 | 11:00-13:30 | Honda Center |
| VBV34 | Beach VB QF (M+W) | Wed 7/26 | 13:00-15:00 | Alamitos Beach |
| VBV35 | Beach VB QF (M+W) | Wed 7/26 | 20:00-22:00 | Alamitos Beach |
| VBV32 | Beach VB QF (M+W) | Tue 7/25 | 13:00-15:00 | Alamitos Beach |

---

## Tier Selection Guide

When you see the seat map, pick the tier at the price point listed below.
Prices are approximate — use the dollar amount as your anchor if tier
labels differ from what's shown here.

### Swimming — 2028 Stadium (~70K capacity, 9 tiers)

Reported tiers (high to low):
`$1,860 / $1,395 / $1,116 / $744 / $558 / $310 / $186 / $104`
` (A)      (B)      (C)      (D)     (E)     (F)     (G)     (H) `

**Select: F-tier (~$310)**

You already own E-tier ($558) for SWM12. F-tier saves ~$250/ticket
while keeping you in the upper-mid sections. G-tier ($186) starts
getting far in a stadium this large — the pool will feel small.
Applies to: SWM14, SWM08, SWM04, SWM06.

### Water Polo — LB Aquatics Center (~5K capacity, est. 4 tiers)

Reported bronze tiers: `$335 / $217 / $130 / $56`
Reported QF tiers:     `$267 / $174 / $99 / $43`
Gold tiers not reported — estimated ~20-30% above bronze.

**Select: Tier 2 of 4 (~$275 for gold, ~$217 for bronze, ~$195 for semi)**

This is a SMALL venue. Tier 2 puts you close to the pool with clear
sightlines. Even tier 3 would be great here — at ~5K seats there
are no bad views. Tier 2 is worth the modest premium.
Applies to: WPO26, WPO25, WPO23.

### Indoor Volleyball — Honda Center (~18K capacity, 4 tiers)

Reported gold tiers: `$961 / $558 / $403 / $104`
Reported semi tiers:  `$620 / $360 / $260 / $81`
`                       (1)    (2)    (3)    (4)`

**Select: Tier 3 of 4 (~$403 for gold, ~$260 for semi/bronze)**

Honda Center is a standard NHL arena. Tier 3 gives you solid
upper-bowl seats with good sightlines to the court. Tier 4 ($104
for gold, $81 for semi) is a steep drop in viewing quality for
moderate savings — not recommended. Tier 2 is great but adds
~$155/ticket for gold.
Applies to: VVO50, VVO51, VVO52, VVO45.

### Beach Volleyball — Alamitos Beach Stadium (~12K temp venue, est. 4 tiers)

Reported prelim tiers: `$558 / $298 / $149 / $28`
Reported final tiers:  `$1,054 / $558 / $279 / $104`
QF tiers not reported — estimated between prelim and final.

**Select: Tier 2 of ~4 (est. ~$150-200 for QF)**

This is a temporary beach stadium with steep, compact seating.
Sightlines are good from almost everywhere. Tier 2 gets you
well-positioned without paying the premium tier. The outdoor
atmosphere is a big part of the experience regardless of seat.
Applies to: VBV34, VBV35, VBV32.

---

## Purchase Sequence

Buy in this order. For each event, try the primary code first, then
fall through to backups. Track two flags (explained below) as you go.

**Before you start, set:**
- `SWIM_BACKUP_USED` = none
- `VB_PLAN` = DOUBLE_HEADER

---

### 1. WATER POLO

> **Buy: WPO26** (Men's Gold, Sat 7/22, 15:00) → **Tier 2 of 4 (~$275)**
>
> If sold out → **WPO25** (Men's Bronze, Sat 7/22, 11:30) → **Tier 2 of 4 (~$217)**
> If sold out → **WPO23** (Men's Semi, Fri 7/21, 11:30) → **Tier 2 of 4 (~$195)** *adds 1 day to trip*

No impact on any other purchase.

---

### 2. SWIMMING — Priority Session

> **Buy: SWM14** (100m Free Final, Fri 7/28, 18:00) → **F-tier (~$310)**
>
> If sold out → **SWM04** (Sun 7/23, 18:00) → **F-tier (~$310)** — set `SWIM_BACKUP_USED` = SWM04
> If sold out → **SWM06** (Mon 7/24, 18:00) → **F-tier (~$310)** — set `SWIM_BACKUP_USED` = SWM06

No impact on other purchases.

---

### 3. VOLLEYBALL — Men's Gold

> **Buy: VVO50** (Men's VB Gold, Sat 7/29, 10:00) → **Tier 3 of 4 (~$403)**
>
> If available → great, keep `VB_PLAN` = DOUBLE_HEADER, proceed to step 4.
>
> **If sold out → CHANGE `VB_PLAN` = FALLBACK and skip step 4. Go to step 3B.**

#### 3B. VOLLEYBALL FALLBACK (only if VVO50 sold out)

> **Buy: VVO52** (Women's VB Gold, Sun 7/30, 10:00) → **Tier 3 of 4 (~$403)** *adds 1 day to trip*
>
> If sold out → **VVO45** (Men's VB Semi, Wed 7/26, 11:00) → **Tier 3 of 4 (~$260)**
>
> **If you bought VVO45: you MUST swap BV in step 5.**
> VBV34 conflicts with VVO45 on 7/26. Use VBV35 or VBV32 instead (see step 5).

---

### 4. VOLLEYBALL — Women's (Double Header)

**Skip this step entirely if `VB_PLAN` = FALLBACK.**

> **Buy: VVO51** (Women's VB Bronze, Sat 7/29, 14:45) → **Tier 3 of 4 (~$260)**
> Same venue as VVO50, 90-min gap. Zero conflict.
>
> If sold out → no replacement. You still have VVO50. Move on.

---

### 5. BEACH VOLLEYBALL

> **If `VB_PLAN` = DOUBLE_HEADER (normal path):**
>
> Buy: **VBV34** (BV QF, Wed 7/26, 13:00) → **Tier 2 of ~4 (~$150)**
> If sold out → **VBV35** (Wed 7/26, 20:00) → **Tier 2 of ~4 (~$150)**
> If sold out → **VBV32** (Tue 7/25, 13:00) → **Tier 2 of ~4 (~$150)**
>
> ---
>
> **If `VB_PLAN` = FALLBACK *and* you bought VVO45 on 7/26:**
>
> Buy: **VBV35** (Wed 7/26, 20:00) → **Tier 2 of ~4 (~$150)**
> If sold out → **VBV32** (Tue 7/25, 13:00) → **Tier 2 of ~4 (~$150)**

---

### 6. SWIMMING — Second Session

> **Buy: SWM08** (200m Free, 1500m Free Finals, Tue 7/25, 18:00) → **F-tier (~$310)**
>
> If sold out, use whichever backup was NOT used in step 2:
> - If `SWIM_BACKUP_USED` = SWM04 → try **SWM06** (Mon 7/24, 18:00) → **F-tier (~$310)**
> - If `SWIM_BACKUP_USED` = SWM06 → try **SWM04** (Sun 7/23, 18:00) → **F-tier (~$310)**
> - If `SWIM_BACKUP_USED` = none → try **SWM04**, then **SWM06** → **F-tier (~$310)**

---

## Resulting Schedules

### Best Case (primary slate)
```
Sat 7/22  Tue 7/25  Wed 7/26  Thu 7/27  Fri 7/28  Sat 7/29
WPO26     SWM08     VBV34     SWM12*    SWM14     VVO50+VVO51
WP Gold   Swim      BV QF     Swim      Swim      VB Gold+Bronze
15:00     18:00     13:00     18:00     18:00     10:00+14:45
```

### If VVO50 sold out → bought VVO52
```
Sat 7/22  Tue 7/25  Wed 7/26  Thu 7/27  Fri 7/28  Sun 7/30
WPO26     SWM08     VBV34     SWM12*    SWM14     VVO52
WP Gold   Swim      BV QF     Swim      Swim      Women VB Gold
15:00     18:00     13:00     18:00     18:00     10:00
```

### If VVO50 sold out → bought VVO45 (7/26 swap)
```
Sat 7/22  Tue 7/25  Wed 7/26        Thu 7/27  Fri 7/28
WPO26     SWM08     VVO45 + VBV35   SWM12*    SWM14
WP Gold   Swim      VB Semi + BV    Swim      Swim
15:00     18:00     11:00 + 20:00   18:00     18:00
```

*All schedules assume SWM14 was available. If SWM14 was replaced,
the backup session (SWM04 on 7/23 or SWM06 on 7/24) adds a day
to the front of the trip but doesn't affect anything else.*

`* = existing ticket`

---

## Budget Estimates (2 tickets per event)

| Event | Venue | Target Tier | $/ticket | x2 |
|-------|-------|:-----------:|:--------:|:---:|
| WPO26 Men's WP Gold | LB Aquatics (~5K) | Tier 2 of 4 | ~$275 | $550 |
| SWM14 Swim Finals | 2028 Stadium (~70K) | F-tier (6 of 9) | ~$310 | $620 |
| SWM08 Swim Finals | 2028 Stadium (~70K) | F-tier (6 of 9) | ~$310 | $620 |
| VVO50 Men's VB Gold | Honda Center (~18K) | Tier 3 of 4 | ~$403 | $806 |
| VVO51 Women's VB Bronze | Honda Center (~18K) | Tier 3 of 4 | ~$260 | $520 |
| VBV34 Beach VB QF | Alamitos Beach (~12K) | Tier 2 of ~4 | ~$150 | $300 |
| **Total** | | | | **~$3,416** |

### Backup price changes at same target tiers
| Backup | Replaces | Target Tier | $/ticket | Savings vs primary |
|--------|----------|:-----------:|:--------:|:------------------:|
| WPO25 (Bronze) | WPO26 | Tier 2 of 4 | ~$217 | ~$58/ticket |
| WPO23 (Semi) | WPO26 | Tier 2 of 4 | ~$195 | ~$80/ticket |
| VVO52 (Women's Gold) | VVO50+51 | Tier 3 of 4 | ~$403 | same price |
| VVO45 (Semi) | VVO50+51 | Tier 3 of 4 | ~$260 | ~$143/ticket |
| SWM04 / SWM06 | SWM14 or SWM08 | F-tier | ~$310 | same price |
