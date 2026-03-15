#!/usr/bin/env bash
# perf — CPU profiling with hardware performance counters
# Requires kernel PMU access (CAP_PERFMON or --privileged container)
# Visualize: flamegraph — https://github.com/brendangregg/FlameGraph
# Usage: ./tools/profiler/run-perf.sh <binary_name>
set -e

if [ -z "$1" ]; then
    echo "Usage: $0 <binary_name>"
    exit 1
fi

BINARY=$1

perf record -g ./bin/"$BINARY"
perf report --no-children
