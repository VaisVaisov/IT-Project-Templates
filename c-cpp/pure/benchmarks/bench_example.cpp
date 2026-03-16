#include <benchmark/benchmark.h>

// Example benchmark — replace with your own function under test
static void BM_VectorPushBack(benchmark::State& state) {
    for (auto _ : state) {
        std::vector<int> v;
        v.reserve(state.range(0));
        for (int i = 0; i < state.range(0); ++i)
            v.push_back(i);
        benchmark::DoNotOptimize(v);
    }
}
BENCHMARK(BM_VectorPushBack)->Range(8, 8 << 10);

BENCHMARK_MAIN();
