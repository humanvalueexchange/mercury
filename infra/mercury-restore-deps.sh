#!/usr/bin/env bash
# Mercury Pi — post-restore dependency installer
# Run as hermes user after bare-metal restore
# Part of Phase 4 restore sequence (after GitHub pull)

set -e

echo "==> Mercury post-restore deps starting..."

# Playwright (required for mercury post-share — Grok → Mattermost)
pip3 install playwright --break-system-packages
/home/hermes/.local/bin/playwright install chromium
echo "  ✓ Playwright + Chromium installed"

echo ""
echo "==> Mercury deps complete."
echo ""
echo "Remaining manual steps:"
echo "  1. Restore ~/.mercury/mattermost.env (webhooks from Mattermost System Console)"
echo "  2. Enable username override: Mattermost → System Console → Integration Management"
echo "  3. Test: mercury post-share <grok-share-url>"
