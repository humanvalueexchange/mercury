# Mercury infra — deploy and restore artifacts
#
# This directory contains:
#   mercury-mattermost.env.template  — webhook config template (no secrets)
#   mercury-restore-deps.sh          — post bare-metal restore dependency installer
#
# Sensitive config (actual webhook URLs, macaroons, etc.) lives on the
# operator's machine in ~/.mercury/ and is NEVER committed to this repo.
