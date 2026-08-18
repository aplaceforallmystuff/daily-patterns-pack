# Daily Patterns Pack

*Turn your daily notes into a system that learns how you work.*

![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)
![Claude Code Plugin](https://img.shields.io/badge/Claude%20Code-Plugin-6C5CE7)

![Daily Patterns Pack](docs/images/architecture-diagram.png)

A two-tool feedback loop: capture what you do, discover what you should automate.

## Demo Video

[![How 3 Weeks of Daily Notes Built My AI Agents](https://img.youtube.com/vi/ZztxFamiMa8/maxresdefault.jpg)](https://www.youtube.com/watch?v=ZztxFamiMa8)

## Why

You use Claude Code. You get things done. But then:

- Tomorrow, you forget what you decided today
- You repeat the same manual workflows weekly
- You never notice which tasks drain your time
- You can't see your own work patterns

Claude doesn't remember between sessions. Your daily notes do—but only if you write to them, and only if something reads them back.

## Install

```bash
# In Claude Code:
/plugin marketplace add aplaceforallmystuff/marketplace
/plugin install daily-patterns-pack@aplaceforallmystuff
```

<details>
<summary>Manual install (without the marketplace)</summary>

```bash
# Clone the pack
git clone https://github.com/aplaceforallmystuff/daily-patterns-pack.git
cd daily-patterns-pack

# Run the installer
./install.sh

# Or manually copy
cp -r skills/log-to-daily ~/.claude/skills/
cp agents/vault-analyst.md ~/.claude/agents/
```
</details>

## Use cases

- Use it when you finish a Claude Code session and want a structured record of what you did, decided, and changed.
- Use it when you make an important decision mid-session and want the rationale captured before you forget it.
- Use it when you switch contexts and want to checkpoint the work so far.
- Use it after two or more weeks of logs to find which manual workflows you repeat and should automate.
- Use it when you want to see your own time and productivity patterns—deep work versus admin, day-of-week clustering.
- Use it when you need concrete, evidence-backed skill or agent build recommendations instead of guesses.

## How it works

Two tools. One feedback loop.

### `/log-to-daily` — Capture

At the end of each session, run `/log-to-daily`. Claude analyzes your conversation and appends a structured log to today's daily note:

```markdown
## Session Log - 2:45 PM

**Focus:** Local LLM integration for cost optimization

### Completed
- Overhauled inbox-processor with local_classify
- Created keep-warm launchd agent for Ollama
- Tested classification accuracy (~66%)

### Decisions Made
| Decision | Rationale |
|----------|-----------|
| Hybrid local/cloud pattern | Local does mechanical work, Claude does judgment |
| 4-minute keep-warm interval | Prevents cold start without wasting resources |

### Files Modified
- [[inbox-processor]] - Added local LLM integration

### Next Steps
- [ ] Monitor token savings over next week
```

**What gets captured:**
- Concrete outcomes (not just "worked on stuff")
- Decisions with rationale
- Files created/modified (with wiki links)
- Follow-up tasks

### `@vault-analyst` — Discover

After a few weeks of logs, run `@vault-analyst`. It reads your daily notes and surfaces:

- **Recurring tasks** you do manually every week
- **Time patterns** (when you do deep work vs admin)
- **Friction points** (what blocks you repeatedly)
- **Automation candidates** (specific skills/agents to build)

`@vault-analyst` is read-only. It observes, analyzes, and recommends; it never modifies your vault.

### The compounding effect

Week 1: You log sessions. Nothing special yet.

Week 4: Vault-analyst spots your Friday financial review pattern. You build a skill.

Week 8: That skill appears in your logs. Vault-analyst notices you always run it *after* checking email. Suggests an agent that coordinates both.

Week 12: Your system now handles things you used to do manually. Your logs shift to higher-level work. Vault-analyst notices *that* pattern too.

**The more you log, the more patterns emerge. The more patterns, the better your automation. The better your automation, the more valuable work you log.**

### What makes good logs

**Specific outcomes:**
- ✅ "Created inbox-processor with local_classify integration"
- ❌ "Worked on inbox stuff"

**Decisions with reasoning:**
- ✅ "Chose hybrid local/cloud pattern because local model accuracy was only 66%"
- ❌ "Made some decisions about the approach"

**Linked files:**
- ✅ "Modified [[inbox-processor]] and [[vault-analyst]]"
- ❌ "Changed some files"

The quality of your logs determines the quality of vault-analyst's recommendations.

## Example

After two or more weeks of logs, ask the analyst what to automate:

```
@vault-analyst what should I automate?
```

It returns a report citing the specific patterns behind each recommendation. Illustrative output:

```markdown
## Vault Analysis Report

**Analyzed:** 30 daily notes (Jan 1 - Jan 30)

### Automation Recommendations

**1. weekly-financial-sync** — Priority: High
- **Why:** "Sync MoneyWiz" appears in 4 of 4 Friday notes
- **What it would do:** Auto-pull transactions, categorize, update Notion
- **Time saved:** ~30 min/week
- **Effort to build:** Medium

**2. newsletter-preflight** — Priority: High
- **Why:** 6 session logs mention "check slop", "verify links", "SEO meta"
- **What it would do:** Run all pre-publish checks in sequence
- **Time saved:** ~15 min/issue
- **Effort to build:** Low (compose existing skills)
```

Other invocations:

```
# Full analysis of the last 30 days
@vault-analyst analyze my vault

# Time and productivity patterns
@vault-analyst what are my productivity patterns?
```

## Configuration

Requirements:

- **Daily notes in Obsidian** — Format: `00 Daily/YYYY/YYYYMMDD.md` (configurable)
- **Claude Code** — These are Claude Code skills/agents
- **Consistency** — The system learns from repetition. Sporadic logging = weak patterns.

Edit the daily note path in `log-to-daily/SKILL.md`:

```markdown
<daily_note_location>
Path: `00 Daily/YYYY/YYYYMMDD.md`
</daily_note_location>
```

Adjust to match your vault structure.

### Files included

```
daily-patterns-pack/
├── agents/
│   └── vault-analyst.md
├── skills/
│   └── log-to-daily/
│       └── SKILL.md
├── install.sh
├── LICENSE
└── README.md
```

## Philosophy

Most AI tools optimize for single sessions. This pack optimizes for *months*.

Your daily notes become training data—not for an AI model, but for your personal automation system. Every session logged is a data point. Every pattern detected is an automation waiting to be built.

**You're not just using Claude. You're teaching your vault to work like you do.**

## License

MIT — see [LICENSE](LICENSE).

---

*Part of the Claude Code plugin ecosystem. Start small, compound over time.*
