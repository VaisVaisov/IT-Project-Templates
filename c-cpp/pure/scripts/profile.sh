#!/bin/bash
echo "Starting profiling..."

echo "C++: valgrind (in Docker)"
tools/profiler/run-valgrind.sh your_cpp_binary

echo "C++: perf (in Docker)"
tools/profiler/run-perf.sh your_cpp_binary

echo "Report saved."
