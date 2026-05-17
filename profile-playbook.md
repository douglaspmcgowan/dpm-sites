# Profile Playbook

How to build a structured personal-profile system that reads cleanly across applications, interviews, talks, and your own future-self search.

The deliverable is two-layered: (1) **canonical markdown** versioned in a public Git repo so it's accessible from any laptop or shared link, and (2) a **dashboard layer** in a personal knowledge tool (Obsidian Bases, Notion DB, Tana, etc.) that lets you query and re-cut the same material without copy-paste. Optionally, a **rendered website page** for public reading.

This playbook walks through the version Doug McGowan built in May 2026, but the pattern generalizes.

---

## Why this exists

Personal materials sprawl. Your CV is in one place. Your fellowship statements are in five Drive folders. Your recommendation-letter packet is its own Frankenstein. Your LinkedIn copy diverges from your resume bullets diverges from the bio you sent to a podcast last spring. When the next deadline lands, you reinvent everything from a search across PDFs.

The fix is a **single source of truth** with multiple cuts:

- Canonical markdown — versioned, linkable, diff-able.
- A dashboard view — filter and group the same material by audience, status, tier.
- A web-rendered version — for public consumption.

You write content **once**. You re-cut it for every audience.

---

## The 17-doc canon

The minimal set Doug uses:

| File | What it holds |
|---|---|
| `README.md` | Index + source-document log |
| `bio.md` | Five bio lengths (tag, 1-line, 50w, 100w, 250w) + speaker bio + funder bio |
| `headline-and-pitch.md` | LinkedIn headlines + 15s/30s/60s/2min pitches + cold-email templates |
| `about.md` | Long-form personal narrative — the personal-statement-grade version |
| `experience.md` | Full chronological record, reverse-chron |
| `research.md` | Current research thesis + past research + audience cheat-sheet |
| `skills.md` | Tiered skills inventory (core / working / exposure) by domain |
| `education.md` | Degrees, study abroad, coursework |
| `awards-honors.md` | Fellowships, scholarships, athletic + leadership awards |
| `leadership-impact.md` | Multi-year leadership arcs with operating principles |
| `stories.md` | 8–12 signature anecdotes with tagline, length, "shows," and "use when" |
| `values-and-vision.md` | Internal compass — values, career trajectory, lines you won't cross |
| `fellowship-talking-points.md` | Audience-keyed framing for each program |
| `signature-numbers.md` | The metrics you cite consistently (with sources) |
| `quick-reference.md` | One-page cheat sheet |
| `people.md` | Recommenders, mentors, collaborators with framing notes |
| `content-mapping.md` | Which source backs which claim — catches discrepancies |
| `profile.json` | Machine-readable version (optional but valuable for tools) |

---

## The discipline

Three rules that keep the system from rotting:

### 1. Single source of truth per fact

Every claim has one canonical home. The Rivian patent narrative lives in `experience.md`. When you reference it in `about.md`, you cross-link rather than restate. When numbers conflict (e.g. CV says 8 small groups, Hertz statement says 10), `content-mapping.md` flags the discrepancy so you can resolve it before the next submission.

### 2. Audience-keyed framing, not audience-keyed content

You don't write a different "About me" for NSF and DoD. You write **one** about, then `fellowship-talking-points.md` tells you which framing to lean into and which to avoid for each program. The underlying facts stay constant — what changes is emphasis.

### 3. Refresh on event triggers, not calendar

Update when:
- A new fellowship/award lands → `awards-honors.md` + `signature-numbers.md`
- A new role or paper → `experience.md` + `research.md`
- A new story arc emerges → `stories.md`
- Mid-year for everything else

Don't try to maintain on a schedule. You'll fall off and the docs will rot. Tie updates to events.

---

## The dashboard layer (Obsidian Bases)

The markdown is the canon. The dashboard is the lens.

For each entity type (experience, award, skill, person, application, story), create one note per entity with structured frontmatter:

```yaml
---
type: experience
category: research | industry | leadership | athletics | music
org: 
role: 
start: YYYY-MM-DD
end: YYYY-MM-DD or null (for ongoing)
location: 
current: true|false
peak_size: 
tags: []
---
```

Then create a `.base` file that aggregates by type with table and card views:

```yaml
filters:
  and:
    - file.inFolder("Profile/Experiences")
properties:
  category:
    displayName: Category
views:
  - type: cards
    name: "All experiences at a glance"
    cardSize: medium
  - type: table
    name: "Current only"
    filters:
      and:
        - current == true
    order:
      - file.name
      - role
      - org
      - start
```

Embed those base views in a hub note with `\`\`\`base` code blocks for live dashboards.

The benefit: when you add a new role, you write a single note with the right frontmatter, and **every dashboard updates**. No copy-paste across files.

---

## The web-rendered layer

Two patterns:

### Pattern A — Long-form single page

One `index.html` that ships all 17 docs as collapsible sections with a sticky TOC. Easy to maintain (one file), easy to read (single page), easy to deep-link (anchors). Best for personal pages where the content doesn't change often.

### Pattern B — Per-doc pages

`/profile/about.html`, `/profile/bio.html`, etc. — each with the same shared header, sidebar nav, and footer. Best for higher-traffic sites where each doc deserves its own URL and SEO.

Doug's site uses Pattern A on the public deploy at `dpm-sites.vercel.app/profile/`.

---

## Privacy guard

Public repo means consider what's exposed:

**Keep out:**
- Phone number, home address
- SSN-bearing transcripts
- Specific clearance levels (say "previous Secret clearance," not the level + agency)
- Birth date, license numbers
- Recommender private contact info

**Keep in (already public via CV / LinkedIn):**
- Email, LinkedIn, GitHub, professional site
- All academic and professional history
- Awards and recognitions
- Affiliations

The fellowship-statement narratives are borderline. They were written for review committees, not the open internet. Doug's call: include them in the markdown, but surface them as "interview-ready stories" not as raw application essays.

---

## Discrepancy reconciliation

The most underrated value of `content-mapping.md`. When you build the system you'll find fact drift — same claim, different numbers across docs. Six examples Doug found:

1. DM small-group count (CV 8, Hertz 10)
2. Learning Factory class size (250+ vs. 200+ in older drafts)
3. NUS prototype description inconsistency
4. Boxing tryout timeline phrasing (one team year vs. multi-year)
5. Rivian patent-application language (verify exact disclosure wording)
6. NASA family detail (single-mom NASA engineer + father with NASA career — be specific when asked)

The map doesn't fix the discrepancy. It just surfaces it so you can decide on a canonical answer before the next reviewer asks.

---

## Build cost

For Doug's case (May 2026):
- 4 hrs to read source materials (CV, 4 fellowship apps, 2 rec letters, 1 portfolio)
- 3 hrs to write the 17-doc canon
- 1 hr to build the Obsidian Bases dashboards
- 2 hrs to render the web pages
- 30 min to push, link, verify deploy

Total: ~10 hrs end to end. Once built, ongoing maintenance is ~30 min/month.

---

## What you do with it

- **Fellowship deadline lands** → open `fellowship-talking-points.md`, copy the program-keyed framing, pull the relevant numbers from `signature-numbers.md`, lift stories from `stories.md`. Draft in 60% of the time.
- **Recruiter asks for a 100-word bio** → copy from `bio.md`. Done in 30 seconds.
- **Podcast asks for a speaker bio** → `bio.md` has one pre-written. Done in 30 seconds.
- **Applying for a recommendation letter** → copy from `people.md` the framing for that recommender, attach `Guide to Writing My Rec Letter.pdf`. Send packet.
- **Imposter syndrome attacks** → read `signature-numbers.md`. The receipts are right there.
- **Six months from now you forget what you've done** → `experience.md` is your search-friendly record.

---

## Things to skip

- Don't bother with images of every project — they go stale and bloat the repo. Link to the canonical project sites instead.
- Don't try to maintain word-counts in your bios. Pre-write at five lengths and pick.
- Don't write a separate "about me for technical audiences" and "about me for non-technical audiences." Write one strong about, plus framing notes.
- Don't put live calendars or "currently reading" widgets in here. That's a different system. Profile is for who you are, not what you're doing this week.
