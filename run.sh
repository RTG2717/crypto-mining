#!/usr/bin/env bash

nix build

set -euo pipefail

# Get current script directory (robust way)
curDir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

LOG_DIR="$curDir/logs"
mkdir -p "$LOG_DIR"

LOG="$LOG_DIR/xmrig_$(date +%Y%m%d_%H%M%S).log"
PID_FILE="$curDir/logs/xmrig_latest.pid"

echo "Starting miner..."
echo "Log file: ./logs/xmrig.log"

sleep 1

"$curDir/result/bin/mine"

