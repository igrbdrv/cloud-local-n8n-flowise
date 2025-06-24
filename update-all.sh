#!/bin/bash

SCRIPT_DIR="$(dirname "$0")/update-files"

"$SCRIPT_DIR/update-n8n.sh" || exit 1
"$SCRIPT_DIR/update-flowise.sh" || exit 1
"$SCRIPT_DIR/update-caddy.sh" || exit 1

echo "✅ All services successfully updated"
exit 0
