#!/bin/bash
echo "🔧 Запуск профилирования..."

echo "🐳 C++: valgrind (в Docker)"
tools/profiler/run-valgrind.sh your_cpp_binary

echo "🐳 C++: perf (в Docker)"
tools/profiler/run-perf.sh your_cpp_binary

echo "📊 Отчёт сохранён."
