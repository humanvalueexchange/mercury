# Contributing to Mercury

Thank you for your interest in Mercury. This document defines how all contributions work.

## Core Principle

**Every change goes through a Pull Request. No direct commits to `main`.**

This is a financial sovereignty tool. Governance and auditability are non-negotiable.

---

## Contribution Flow

```
1. Create an Issue (or pick an existing one)
2. Create a branch from main
3. Make your changes
4. Submit a Pull Request referencing the Issue
5. Receive review
6. Merge (maintainer only)
```

---

## Branch Naming

```
feature/<short-description>     New features
fix/<short-description>         Bug fixes
docs/<short-description>        Documentation only
refactor/<short-description>    Code improvements, no behaviour change
infra/<short-description>       Deploy / systemd / config changes
```

---

## Commit Messages

Follow conventional commits:

```
feat: add magma liquidity score command
fix: correct invoice expiry calculation
docs: update ARCHITECTURE with post-share flow
refactor: extract mm_post helper function
```

---

## Pull Requests

- Must reference an Issue where applicable (`Fixes #123`)
- Must include a description of **what** and **why**
- Must pass all existing tests
- Must include a Risk Assessment for changes touching payments or node config

See `.github/pull_request_template.md` — it will auto-populate when you open a PR.

---

## Issues

Use issues for:
- Proposing new features
- Reporting bugs
- Architectural discussions
- Risk-sensitive changes

Not every change requires an issue — small fixes and docs can go straight to PR.

---

## No Secrets Policy

**Never commit:**
- API keys or tokens
- Webhook URLs
- Node credentials or macaroons
- IP addresses of live nodes
- Any content from `~/.mercury/*.env` files

All sensitive config lives in `~/.mercury/` on the operator's machine — never in this repo.

---

## Review Culture

Reviews focus on:
- **Correctness** — does it do what it says?
- **Risk** — could this affect funds, node stability, or security?
- **Clarity** — is the intent obvious?

Not on style, speed, or personal preference.

---

## Maintainer

Hans Westphal — [@HansHWestphal](https://github.com/HansHWestphal)  
CTO review: Claude (CTO, Human Value Exchange) via PR comments

---

*Mercury follows the Bitcoin Core contribution philosophy: review before merge, clarity over speed.*
