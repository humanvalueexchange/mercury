# Mercury Architecture

## System Overview

Mercury is a single-operator sovereign Bitcoin + Lightning node CLI. It runs on a Raspberry Pi 5 and provides terminal-native control over the full Bitcoin/Lightning stack, with AI intelligence powered by a remote DGX Spark running Ollama.

---

## Component Map

```
┌─────────────────────────────────────────────────────┐
│                   Mercury Pi (arm64)                 │
│                                                      │
│  /usr/local/bin/mercury  ←  Mercury CLI (Python)     │
│                                                      │
│  ├── Bitcoin Core (bitcoind)   full node             │
│  ├── LND                       Lightning Network     │
│  ├── Mattermost                self-hosted comms     │
│  └── Ollama (light)            local AI fallback     │
│                                                      │
└───────────────────┬─────────────────────────────────┘
                    │ SSH / local API
          ┌─────────▼──────────┐
          │   DGX Spark        │
          │   Ollama (primary) │
          │   128GB unified    │
          │   LLM inference    │
          └────────────────────┘
```

---

## Mercury CLI Architecture

Mercury is a **single Python file** (`src/mercury`) with two execution modes:

### 1. Argparse mode (one-shot)
```bash
mercury status
mercury pay lnbc...
mercury post-share https://grok.com/share/...
```

### 2. Interactive shell mode
```bash
mercury          # enters REPL
⚡ status        # run commands interactively
⚡ ask "..."     # AI query
```

Both modes share the same command handlers — the shell loop dispatches to the same functions as argparse.

---

## Key Subsystems

### Node Interface
- Communicates with LND via `lncli` subprocess calls
- Communicates with Bitcoin Core via `bitcoin-cli`
- All node calls are wrapped with timeout + error handling

### AI Intelligence (`mercury ask`)
- Primary: DGX Spark at `192.168.1.10:11434` (Ollama — Qwen2.5:14b)
- Fallback: local Ollama on Mercury Pi (lighter model)
- Node context (block height, balance, channels) injected into every prompt

### Mattermost Bridge (`mercury post-share`)
- Webhook-based posting to self-hosted Mattermost (`localhost:8065`)
- Channels: `#tech`, `#alerts`, `#town-square`, `#growth`
- Config: `~/.mercury/mattermost.env` (never committed)
- Playwright (headless Chromium) renders JS pages for full content extraction

### Liquidity Intelligence (`mercury magma`)
- Queries Amboss/Magma API for inbound liquidity offers
- Provides channel recommendations based on local balance + peer scoring

---

## Configuration

All sensitive config lives outside the repo:

| File | Contents |
|---|---|
| `~/.mercury/mattermost.env` | Webhook URLs |
| `~/.lnd/` | LND macaroons + TLS cert |
| `~/.bitcoin/bitcoin.conf` | Bitcoin Core config |

---

## External Systems

| System | Role | Interface |
|---|---|---|
| DGX Spark | Primary LLM inference | HTTP REST (Ollama API) |
| Hermes (CFO agent) | Treasury intelligence | Reads Mercury node data |
| Mattermost | Team comms | Webhook POST |
| Grok / Mika (xAI) | CGO AI insights | Playwright + post-share |

Hermes and Mika are **external systems** — Mercury feeds data to them but does not depend on them for core node operations.

---

## Bare Metal Restore

Full Mercury restore after a clean OS install:

```bash
git clone https://github.com/humanvalueexchange/mercury.git
sudo cp mercury/src/mercury /usr/local/bin/mercury
sudo chmod +x /usr/local/bin/mercury
bash mercury/infra/mercury-restore-deps.sh
```

See `infra/` for systemd units and restore scripts.

---

## Versioning

Mercury follows semantic versioning. Current: `v0.6.1`

| Version | Milestone |
|---|---|
| v0.6.1 | post-share + Playwright extraction (current) |
| v1.0.0 | Full feature parity + tests + docs complete |
