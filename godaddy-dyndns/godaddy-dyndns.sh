#!/bin/bash

set -e

cd "$(dirname "$0")"
echo "$(dirname "$0")"

if [[ ! -d venv ]]; then
    echo "venv not initialized!" >& 2
    exit 1
fi

CONFIG_PATH="$1"

source venv/bin/activate
./godaddy-dyndns.py "$CONFIG_PATH"
