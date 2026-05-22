# dpm-sites

Sites hub for all of Douglas McGowan's web deployments.
Live: **https://dpm-sites.vercel.app**
Source: **https://github.com/douglaspmcgowan/dpm-sites**

## Repo structure

| Path | Purpose |
|---|---|
| `index.html` | Main sites hub — editorial + dashboard views |
| `styles.css` | Shared stylesheet |
| `profile/` | Consolidated personal reference (bios, experience, stories, fellowships) |
| `data/project-status.json` | Tracked project goals, states, and last-commit cache |
| `scripts/` | Update utilities (PowerShell, etc.) |
| `.claude/` | Session hooks and repo-level Claude Code config |
| `profile-playbook.md` | Profile System playbook (P7) |

## Sites (16 total)

### Research (12)
| # | Repo slug | URL |
|---|---|---|
| 01 | idetc-paper-site | idetc-paper-site.vercel.app |
| 02 | web-design-guide | web-design-guide-lilac.vercel.app |
| 03 | app-aesthetics-guide | app-aesthetics-guide.vercel.app |
| 04 | viz-research-hub | viz-research-hub.vercel.app |
| 05 | ai-industry-map-explorer | ai-industry-map-explorer.vercel.app |
| 06 | ai-industry-map | ai-industry-map.vercel.app |
| 07 | ai-schools-of-thought-explorer | ai-schools-of-thought-explorer.vercel.app |
| 08 | terminology-hub | terminology-site.vercel.app |
| 09 | dpm-research-hub | dpm-research-hub.vercel.app |
| 10 | dfm-graph-explorer | dfm-graph-explorer.vercel.app |
| 11 | dfm-kg-agent-v2 | dfm-kg-agent-v2.vercel.app |
| 12 | ai-in-design-map | ai-in-design-map.vercel.app |

### Personal (5)
| # | Repo slug | URL |
|---|---|---|
| 12.5 | dpm-sites-profile | dpm-sites.vercel.app/profile/ |
| 13 | dpm5970_digital_garden | dpm5970digitalgarden.vercel.app |
| 14 | dpm-share-hub | dpm-share-hub.vercel.app |
| 15 | zahra-portfolio | zahra-portfolio-chi.vercel.app |
| 16 | zahra-career-hub | zahra-career-hub.vercel.app |

## Active projects (tracked in project-status.json)
- **psych-battery-app** — cognitive battery instrument (Active)
- **idetc-paper-site** — ASME IDETC 2026 companion (Active)
- **dfm-graph-explorer** — DFM discourse graph (Stable)
- **ai-in-design-map** — field map for AI in engineering design (Stable)
- **dpm-research-hub** — research documentation hub (Stable)
- **site-runtime-baseline** — reusable site scaffold (Shipped)

## Workflow assets

### Claude Code Skills (8)
| Slash | Description |
|---|---|
| /deep-search | Web-grounded parallel research sweeps |
| /environment-preflight | Validate deps, ports, env vars before builds |
| /fellowship-review | Structured editorial review of fellowship materials |
| /hue | Design language + CSS theme generator |
| /parallelize | Decompose work into concurrent sub-agents |
| /process-linkedin-inbox | Triage inbox, draft replies, extract research leads |
| /research-asset-manifest | Inventory research folder → stable IDs + issue list |
| /update-sites-hub | Refresh project status, dates, counts; commit + push |

### Playbooks (7)
- `build-playbook.md` — Content hub from scratch (Express + Vercel)
- `explainer_site_playbook.md` — Explainer/educational site template
- `dfm-graph-explorer/PLAYBOOK.md` — Single-file SPA knowledge graph
- `ai-engineering-design-db/PLAYBOOK.md` — Database + knowledge graph
- `ai-schools-of-thought-explorer/PLAYBOOK.md` — Research content workflow
- `dashboard-tracker-playbook.md` — Conferences/fellowships/jobs tracker
- `profile-playbook.md` — Single-source-of-truth personal profile system

### Hooks (8 + 1 scheduled)
| Trigger | File | What it does |
|---|---|---|
| PreToolUse·Bash | check-secret-exposure.js | Blocks commands printing credentials |
| PreToolUse·Bash | block-dangerous-bash.js | Intercepts rm -rf, sudo, curl\|sh patterns |
| PreToolUse·Write/Edit | protect-firmware.js | Guards firmware/system-critical paths |
| PreToolUse·Obsidian | block-obsidian-delete.js | Stops destructive note deletion |
| PostToolUse·Write/Edit | format-on-edit.js | Auto-formats code after every write |
| Stop | check-session-size.js | Warns at 8 MB JSONL session size |
| Stop | stop-hook-git-check.sh | Checks uncommitted/unpushed changes at session end |
| SessionStart | session-start.sh | Loads project context on startup/resume |
| Scheduled·Daily | zahra-job-scan | Daily Zahra workflow updates |

## Update procedure

Run `/update-sites-hub` to:
1. Check GitHub repos for latest commit dates
2. Update `data/project-status.json`
3. Update the "Updated" date in `index.html` header
4. Review and reconcile site/skill/hook/playbook counts
5. Commit and push to the current branch

For a **scheduled 4-day auto-update**: set up a recurring Claude Code web session at
code.claude.com with the task "run /update-sites-hub in the dpm-sites repo" on a 4-day
cron (e.g., `0 6 */4 * *`).

## Deploy
Vercel auto-deploys on push to `main`. No build step — pure static HTML/CSS/JS.

## Branching
Work on `claude/…` branches. Push, verify deploy preview, merge to main.
