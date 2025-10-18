#!/bin/bash
# Запускает valgrind в Docker

if [ -z "$1" ]; then
  echo "Использование: $0 <бинарный_файл>"
  exit 1
fi

BINARY=$1

docker run --rm -v "$(pwd)/bin:/app" profiler-tool \
    valgrind --leak-check=full --show-leak-kinds=all /app/$BINARY
