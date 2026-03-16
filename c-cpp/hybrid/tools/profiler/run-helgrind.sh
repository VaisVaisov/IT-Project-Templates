#!/usr/bin/env bash
# Valgrind helgrind — data race detection
# Usage:
#   ./tools/profiler/run-helgrind.sh            — run all CTest tests
#   ./tools/profiler/run-helgrind.sh <binary>   — run specific binary from bin/
set -e

ROOT="$(git rev-parse --show-toplevel)"
BUILD_DIR="$ROOT/cmake-build-linux-debug"

if [ -z "$1" ]; then
    if [ ! -d "$BUILD_DIR" ]; then
        echo "Error: build directory not found. Run: cmake --preset linux-debug && cmake --build --preset linux-debug"
        exit 1
    fi
    cd "$BUILD_DIR"
    CTEST_MEMORYCHECK_TYPE=Helgrind ctest -T memcheck --output-on-failure
else
    valgrind --tool=helgrind --error-exitcode=1 "$ROOT/bin/$1"
fi
