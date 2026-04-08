# LA28 Ticket Purchase Plan

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

## Purchase Sequence

Buy in this order. For each event, try the primary code first, then
fall through to backups. Track two flags (explained below) as you go.

**Before you start, set:**
- `SWIM_BACKUP_USED` = none
- `VB_PLAN` = DOUBLE_HEADER

---

### 1. WATER POLO

> **Buy: WPO26** (Men's Gold, Sat 7/22, 15:00)
>
> If sold out → **WPO25** (Men's Bronze, Sat 7/22, 11:30)
> If sold out → **WPO23** (Men's Semi, Fri 7/21, 11:30) *adds 1 day to trip*

No impact on any other purchase.

---

### 2. SWIMMING — Priority Session

> **Buy: SWM14** (100m Free Final, Fri 7/28, 18:00)
>
> If sold out → **SWM04** (Sun 7/23, 18:00) — set `SWIM_BACKUP_USED` = SWM04
> If sold out → **SWM06** (Mon 7/24, 18:00) — set `SWIM_BACKUP_USED` = SWM06

No impact on other purchases.

---

### 3. VOLLEYBALL — Men's Gold

> **Buy: VVO50** (Men's VB Gold, Sat 7/29, 10:00)
>
> If available → great, keep `VB_PLAN` = DOUBLE_HEADER, proceed to step 4.
>
> **If sold out → CHANGE `VB_PLAN` = FALLBACK and skip step 4. Go to step 3B.**

#### 3B. VOLLEYBALL FALLBACK (only if VVO50 sold out)

> **Buy: VVO52** (Women's VB Gold, Sun 7/30, 10:00) *adds 1 day to trip*
>
> If sold out → **VVO45** (Men's VB Semi, Wed 7/26, 11:00)
>
> **If you bought VVO45: you MUST swap BV in step 5.**
> VBV34 conflicts with VVO45 on 7/26. Use VBV35 or VBV32 instead (see step 5).

---

### 4. VOLLEYBALL — Women's (Double Header)

**Skip this step entirely if `VB_PLAN` = FALLBACK.**

> **Buy: VVO51** (Women's VB Bronze, Sat 7/29, 14:45)
> Same venue as VVO50, 90-min gap. Zero conflict.
>
> If sold out → no replacement. You still have VVO50. Move on.

---

### 5. BEACH VOLLEYBALL

> **If `VB_PLAN` = DOUBLE_HEADER (normal path):**
>
> Buy: **VBV34** (BV QF, Wed 7/26, 13:00)
> If sold out → **VBV35** (Wed 7/26, 20:00)
> If sold out → **VBV32** (Tue 7/25, 13:00)
>
> ---
>
> **If `VB_PLAN` = FALLBACK *and* you bought VVO45 on 7/26:**
>
> Buy: **VBV35** (Wed 7/26, 20:00) — evening session avoids VVO45 conflict
> If sold out → **VBV32** (Tue 7/25, 13:00)

---

### 6. SWIMMING — Second Session

> **Buy: SWM08** (200m Free, 1500m Free Finals, Tue 7/25, 18:00)
>
> If sold out, use whichever backup was NOT used in step 2:
> - If `SWIM_BACKUP_USED` = SWM04 → try **SWM06** (Mon 7/24, 18:00)
> - If `SWIM_BACKUP_USED` = SWM06 → try **SWM04** (Sun 7/23, 18:00)
> - If `SWIM_BACKUP_USED` = none → try **SWM04**, then **SWM06**

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

| Event | $/ticket (target tier) | x2 |
|-------|:---:|:---:|
| WPO26 Men's WP Gold | ~$275 | $550 |
| SWM14 Swim Finals | ~$310 (F-tier) | $620 |
| SWM08 Swim Finals | ~$310 (F-tier) | $620 |
| VVO50 Men's VB Gold | ~$403 (Tier 3) | $806 |
| VVO51 Women's VB Bronze | ~$260 (Tier 3 est.) | $520 |
| VBV34 Beach VB QF | ~$150 (Tier 2 est.) | $300 |
| **Total** | | **~$3,416** |

Backup price changes:
- WPO25 (Bronze) saves ~$60/ticket
- WPO23 (Semi) saves ~$75/ticket
- VVO45 (Semi) saves ~$140/ticket vs VVO50
- VVO52 (Women's Gold) same price as VVO50 (~$403)
