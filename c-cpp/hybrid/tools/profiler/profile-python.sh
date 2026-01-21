#!/bin/bash
echo "Profiling Python..."
python -m cProfile -o profile.prof python/main.py
echo "Report saved to profile.prof"
echo "Run: snakeviz profile.prof"
