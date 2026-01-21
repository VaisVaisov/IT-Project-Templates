#!/bin/bash
echo "Profiling Python..."
python -m cProfile -o profile.prof src/main.py
echo "Report saved to profile.prof"
echo "Run: snakeviz profile.prof"
