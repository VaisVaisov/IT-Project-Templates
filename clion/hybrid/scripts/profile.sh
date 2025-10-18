#!/bin/bash
echo "🔧 Запуск профилирования..."

echo "🐍 Python: cProfile"
python tools/profile_main.py

echo "🐳 C++: valgrind (в Docker)"
tools/profiler/run-valgrind.sh your_cpp_binary

echo "🐳 C++: perf (в Docker)"
tools/profiler/run-perf.sh your_cpp_binary

echo "📊 Отчёт сохранён. Используй snakeviz для визуализации."