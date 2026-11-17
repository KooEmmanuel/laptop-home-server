#!/usr/bin/env bash
# Makes the .env file Nextcloud's compose.yaml reads:
#   - two random database passwords (you never need to see or type them)
#   - the addresses Nextcloud will answer on: the laptop's home address, its Tailscale address, and its Tailscale name
# Run it on the server, in the same folder as compose.yaml, AFTER Tailscale is set up:
#   bash make-env.sh
# Use a different Tailscale name than "homeserver" like this:  TS_NAME=myserver bash make-env.sh
set -euo pipefail
cd "$(dirname "$0")"

if [ -e .env ]; then
  echo ".env already exists, so it was left as it is."
  echo "(Nextcloud keeps the passwords from its first start. Only delete .env before that first start.)"
  exit 0
fi

LAN_IP=$(hostname -I | awk '{print $1}')
TS_IP=$(tailscale ip -4 2>/dev/null | head -n 1 || true)
TS_NAME=${TS_NAME:-homeserver}

if [ -z "$LAN_IP" ]; then echo "This machine has no network address yet. Connect it to Wi-Fi first (docs/03-wifi.md)."; exit 1; fi
if [ -z "$TS_IP" ]; then echo "Note: no Tailscale address found. Nextcloud will only work from home until you add it (docs/07-nextcloud.md)."; fi

TRUSTED=$(echo "$LAN_IP $TS_IP $TS_NAME" | xargs)
umask 077
printf 'DB_ROOT_PASSWORD=%s\nDB_PASSWORD=%s\nTRUSTED=%s\n' "$(openssl rand -hex 16)" "$(openssl rand -hex 16)" "$TRUSTED" > .env
chmod 600 .env
echo "Wrote .env (only you can read it). Nextcloud will answer on: $TRUSTED"
