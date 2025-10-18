#!/bin/bash
# Запускает perf в Docker

if [ -z "$1" ]; then
  echo "Использование: $0 <бинарный_файл>"
  exit 1
fi

BINARY=$1

docker run --rm -v "$(pwd)/bin:/app" profiler-tool \
    perf record -g /app/$BINARY
docker run --rm -v "$(pwd)/bin:/app" profiler-tool \
    perf report --no-children
