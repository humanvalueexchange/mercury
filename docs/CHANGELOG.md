# Changelog

## v0.6.1 — 2026-05-21

### Added
- `mercury post-share <grok-url>` — post Grok/Mika conversations to Mattermost
- Playwright headless Chromium extraction for JS-rendered pages
- Tail extraction (`body[-1000:]`) — posts most recent insight, not conversation opener
- `#growth` Mattermost channel support
- Username override support (posts as `Mika 🚀`)

### Fixed
- Playwright `networkidle` timeout → `domcontentloaded` + `evaluate()` pattern
- HTML entity decoding in extracted content
- `utcnow()` deprecation → `datetime.now(timezone.utc)`

---

## v0.5.5 — 2026-05-15

### Added
- `mercury magma` liquidity intelligence commands
- Multi-channel Mattermost support (tech, alerts, town-square)
- Interactive shell mode (`mercury` with no args)
- `mercury ask` AI query via Ollama (DGX Spark)

---

## v0.3.0 — 2026-05-09

### Added
- Initial Mercury CLI
- `status`, `channels`, `invoices`, `sync`, `logs`, `backup`
- `mercury pay`, `mercury invoice`
- Basic LND + Bitcoin Core integration
