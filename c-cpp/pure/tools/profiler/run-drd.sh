#!/usr/bin/env bash
# Valgrind drd — data race detection (more sensitive than helgrind)
# Usage:
#   ./tools/profiler/run-drd.sh            — run all CTest tests
#   ./tools/profiler/run-drd.sh <binary>   — run specific binary from bin/
set -e

ROOT="$(git rev-parse --show-toplevel)"
BUILD_DIR="$ROOT/cmake-build-linux-debug"

if [ -z "$1" ]; then
    if [ ! -d "$BUILD_DIR" ]; then
        echo "Error: build directory not found. Run: cmake --preset linux-debug && cmake --build --preset linux-debug"
        exit 1
    fi
    cd "$BUILD_DIR"
    CTEST_MEMORYCHECK_TYPE=ThreadSanitizer ctest -T memcheck --output-on-failure
else
    valgrind --tool=drd --error-exitcode=1 "$ROOT/bin/$1"
fi
