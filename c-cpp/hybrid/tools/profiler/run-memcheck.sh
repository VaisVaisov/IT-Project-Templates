#!/usr/bin/env bash
# Valgrind memcheck — memory leaks, use-after-free, invalid access
# Usage: ./tools/profiler/run-memcheck.sh <binary_name>
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
    valgrind --tool=memcheck --leak-check=full --show-leak-kinds=all \
        --error-exitcode=1 /app/"$BINARY"
