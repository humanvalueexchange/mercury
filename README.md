# Mercury

**Sovereign Bitcoin Lightning Node CLI — AI-native. Terminal-first. Self-hosted.**

Mercury is a terminal-native control interface for a self-hosted Bitcoin + Lightning node. Designed for single-operator sovereignty, it combines node management, Lightning payment operations, Mattermost integration, and AI-assisted intelligence into one clean CLI.

---

## What Mercury Does

```
mercury status          Node health at a glance
mercury channels        Lightning channel overview
mercury invoices        Recent payments
mercury sync            Bitcoin sync progress
mercury pay <bolt11>    Send a Lightning payment
mercury invoice <sat>   Create a Lightning invoice
mercury magma           Liquidity intelligence (Magma/Amboss)
mercury post-share      Post Grok/AI insights → Mattermost
mercury ask "<q>"       Ask your node anything (local AI via Ollama)
```

---

## Design Philosophy

- **Sovereign** — runs on your hardware, your node, your keys
- **Terminal-first** — no web UI required, no browser, no cloud
- **AI-native** — local LLM (Ollama) for intelligence, not cloud APIs
- **Bitcoin Core-grade governance** — every change reviewed before merge

---

## Hardware Target

| | |
|---|---|
| **Node** | Raspberry Pi 5 (16GB) |
| **AI HAT** | Hailo-10H (40 TOPS) |
| **OS** | Ubuntu 24.04 (arm64) |
| **Bitcoin** | Bitcoin Core (full node) |
| **Lightning** | LND |
| **AI inference** | Ollama → DGX Spark (remote) |
| **Comms** | Mattermost (self-hosted) |

---

## Current Version

`v0.6.1` — See [CHANGELOG](docs/CHANGELOG.md)

---

## Getting Started

Mercury is a single Python file deployed to `/usr/local/bin/mercury`.

```bash
# Clone
git clone https://github.com/humanvalueexchange/mercury.git
cd mercury

# Deploy
sudo cp src/mercury /usr/local/bin/mercury
sudo chmod +x /usr/local/bin/mercury

# Install optional dependencies (for post-share)
pip3 install playwright --break-system-packages
playwright install chromium

# Configure
cp infra/mercury-mattermost.env.template ~/.mercury/mattermost.env
# Edit ~/.mercury/mattermost.env with your webhook URLs

# Run
mercury status
```

---

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md). All changes go through Pull Requests. No direct commits to `main`.

---

## Architecture

See [ARCHITECTURE.md](ARCHITECTURE.md).

---

## License

MIT — see [LICENSE](LICENSE)

---

*Mercury is part of the Human Value Exchange sovereign infrastructure stack.*
