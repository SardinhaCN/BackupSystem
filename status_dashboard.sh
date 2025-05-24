#!/bin/bash

source "$(dirname "$0")/config.sh"

echo "=========================================="
echo "          Status dos Logs de Backup       "
echo "=========================================="

for log in "$LOG_DIR"/*.log*; do
    echo "----- $(basename "$log") -----"
    tail -n 10 "$log"
    echo
done

echo "=========================================="