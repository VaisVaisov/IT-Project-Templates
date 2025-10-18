#!/bin/bash
echo "🐍 Профилируем Python..."
python -m cProfile -o profile.prof python/main.py
echo "📊 Отчёт сохранён в profile.prof"
echo "💡 Запусти: snakeviz profile.prof"