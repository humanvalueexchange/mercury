# Security Policy

## Supported Versions

| Version | Supported |
|---|---|
| v0.6.x | ✅ Current |
| < v0.6 | ❌ No |

## Reporting a Vulnerability

Mercury handles Bitcoin Lightning funds. Security reports are taken seriously.

**Do not open a public GitHub Issue for security vulnerabilities.**

Report privately:

**Email:** hans@hveglobal.ca  
**Subject:** `[SECURITY] Mercury — <brief description>`

Include:
- Description of the vulnerability
- Affected component (CLI command, config handling, node interface, etc.)
- Steps to reproduce
- Potential impact (funds at risk, node exposure, data leak, etc.)
- Suggested mitigation if known

You will receive a response within 48 hours. We will coordinate a fix and disclosure timeline with you.

---

## Scope

In scope:
- Mercury CLI (`src/mercury`)
- Config file handling (`~/.mercury/`)
- Node API calls (LND, Bitcoin Core)
- Mattermost webhook integration
- Playwright/browser extraction logic

Out of scope:
- LND itself
- Bitcoin Core
- Mattermost server
- Ollama

---

## No Secrets in This Repo

This repo contains **no credentials, keys, macaroons, or webhook URLs**. All sensitive config lives on the operator's machine in `~/.mercury/`. If you find a secret accidentally committed, report it immediately at the email above.
