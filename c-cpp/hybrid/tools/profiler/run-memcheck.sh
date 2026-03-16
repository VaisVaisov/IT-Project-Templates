#!/usr/bin/env bash
# Valgrind memcheck — memory leaks, use-after-free, invalid access
# Usage:
#   ./tools/profiler/run-memcheck.sh            — run all CTest tests (pre-commit / CI)
#   ./tools/profiler/run-memcheck.sh <binary>   — run specific binary from bin/
set -e

ROOT="$(git rev-parse --show-toplevel)"
BUILD_DIR="$ROOT/cmake-build-linux-debug"

if [ -z "$1" ]; then
    if [ ! -d "$BUILD_DIR" ]; then
        echo "Error: build directory not found. Run: cmake --preset linux-debug && cmake --build --preset linux-debug"
        exit 1
    fi
    cd "$BUILD_DIR"
    ctest -T memcheck --output-on-failure
else
    valgrind --tool=memcheck --leak-check=full --show-leak-kinds=all \
        --error-exitcode=1 "$ROOT/bin/$1"
fi
