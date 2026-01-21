#!/bin/bash
# Runs valgrind in Docker

if [ -z "$1" ]; then
  echo "Usage: $0 <binary_file>"
  exit 1
fi

BINARY=$1

docker run --rm -v "$(pwd)/bin:/app" profiler-tool \
    valgrind --leak-check=full --show-leak-kinds=all /app/$BINARY
