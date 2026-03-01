#!/usr/bin/env bash
# Run valgrind memcheck on test binary (debug build).
# ADAPT: Set TEST_TARGET to match your project's test executable name.
# Called by pre-commit; rebuilds the test binary before checking.
set -e

ROOT="$(git rev-parse --show-toplevel)"

# ADAPT: Change test_example to your actual CMake test target / binary name
TEST_TARGET="test_example"

cmake --build "$ROOT/cmake-build-linux-debug" --target "$TEST_TARGET" -j"$(nproc)" 2>/dev/null

valgrind --leak-check=full --error-exitcode=1 --quiet \
    "$ROOT/bin/$TEST_TARGET"
