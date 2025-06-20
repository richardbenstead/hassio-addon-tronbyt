#!/usr/bin/env bash
set -e

# ensure media folders exist
mkdir -p /media/apps /media/cache

# read env‐vars (from config.json options)
HOST="${HOST:-0.0.0.0}"
PORT="${PORT:-8000}"
SYSTEM_APPS_REPO="${SYSTEM_APPS_REPO:-https://github.com/tronbyt/apps.git}"

# start the server
exec python -m server.main \
  --host "$HOST" --port "$PORT" \
  --system-apps-repo "$SYSTEM_APPS_REPO"

