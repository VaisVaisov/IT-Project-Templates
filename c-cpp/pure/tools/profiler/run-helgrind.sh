#!/usr/bin/env bash
# Valgrind helgrind — data race detection
# Usage: ./tools/profiler/run-helgrind.sh <binary_name>
set -e

if [ -z "$1" ]; then
    echo "Usage: $0 <binary_name>"
    exit 1
fi

BINARY=$1

docker run --rm \
    -v "$(pwd)/bin:/app" \
    profiler-tool \
    valgrind --tool=helgrind /app/"$BINARY"
