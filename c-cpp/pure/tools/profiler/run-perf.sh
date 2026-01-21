#!/bin/bash
# Runs perf in Docker

if [ -z "$1" ]; then
  echo "Usage: $0 <binary_file>"
  exit 1
fi

BINARY=$1

docker run --rm -v "$(pwd)/bin:/app" profiler-tool \
    perf record -g /app/$BINARY
docker run --rm -v "$(pwd)/bin:/app" profiler-tool \
    perf report --no-children
