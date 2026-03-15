#!/usr/bin/env bash
# Valgrind callgrind — CPU profiling, call graph
# Visualize: speedscope.app → open profiles/callgrind.out
# Usage: ./tools/profiler/run-callgrind.sh <binary_name>
set -e

if [ -z "$1" ]; then
    echo "Usage: $0 <binary_name>"
    exit 1
fi

BINARY=$1
mkdir -p profiles

valgrind --tool=callgrind --callgrind-out-file=./profiles/callgrind.out ./bin/"$BINARY"

echo "Saved: profiles/callgrind.out — visualize: speedscope.app"
