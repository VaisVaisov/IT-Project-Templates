#!/usr/bin/env bash
# Valgrind massif — heap profiling over time
# Usage: ./tools/profiler/run-massif.sh <binary_name>
set -e

if [ -z "$1" ]; then
    echo "Usage: $0 <binary_name>"
    exit 1
fi

BINARY=$1
mkdir -p profiles

valgrind --tool=massif --massif-out-file=./profiles/massif.out ./bin/"$BINARY"
ms_print ./profiles/massif.out

echo "Saved: profiles/massif.out"
