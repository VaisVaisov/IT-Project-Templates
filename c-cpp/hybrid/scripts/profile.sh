#!/bin/bash
echo "Starting profiling..."

echo "Python: cProfile"
python tools/profile_main.py

echo "C++: valgrind (in Docker)"
tools/profiler/run-valgrind.sh your_cpp_binary

echo "C++: perf (in Docker)"
tools/profiler/run-perf.sh your_cpp_binary

echo "Report saved. Use snakeviz for visualization."
