#!/usr/bin/env bash
# Valgrind drd — data race detection (more sensitive than helgrind)
# Usage: ./tools/profiler/run-drd.sh <binary_name>
set -e

if [ -z "$1" ]; then
    echo "Usage: $0 <binary_name>"
    exit 1
fi

BINARY=$1

docker run --rm \
    -v "$(pwd)/bin:/app" \
    profiler-tool \
    valgrind --tool=drd /app/"$BINARY"
