#!/usr/bin/env bash
# Valgrind cachegrind — cache miss analysis (L1/L2)
# Visualize: speedscope.app → open profiles/cachegrind.out
# Usage: ./tools/profiler/run-cachegrind.sh <binary_name>
set -e

if [ -z "$1" ]; then
    echo "Usage: $0 <binary_name>"
    exit 1
fi

BINARY=$1
mkdir -p profiles

docker run --rm \
    -v "$(pwd)/bin:/app" \
    -v "$(pwd)/profiles:/profiles" \
    profiler-tool \
    bash -c "valgrind --tool=cachegrind --cachegrind-out-file=/profiles/cachegrind.out /app/$BINARY \
        && cg_annotate /profiles/cachegrind.out"

echo "Saved: profiles/cachegrind.out — visualize: speedscope.app"
