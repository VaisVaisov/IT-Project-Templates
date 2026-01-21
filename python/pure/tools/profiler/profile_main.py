import cProfile
import pstats
import sys

sys.path.append("../python")
from main import run_main

def profile():
    profiler = cProfile.Profile()
    profiler.enable()
    run_main()  # Основная функция
    profiler.disable()

    # Сохраняем результат
    with open("profile_stats.txt", "w") as f:
        ps = pstats.Stats(profiler, stream=f)
        ps.sort_stats("cumulative")
        ps.print_stats()

    # Для визуализации: snakeviz
    profiler.dump_stats("profile.prof")

if __name__ == "__main__":
    profile()