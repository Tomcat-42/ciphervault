#include <benchmark/benchmark.h>
#include <libciphervault/cipher.hpp>
#include <iostream>

#define INITIAL_SIZE 200
#define FINAL_SIZE 2e3
#define STEP_SIZE 200

static void BM_cipher(benchmark::State &state) {
    for (auto _ : state) {
        ciphervault::test();
    }
}

BENCHMARK(BM_cipher)
->ComputeStatistics("min",
    [](const std::vector<double> &v) -> double {
    return *(
               std::min_element(std::begin(v), std::end(v)));
})
->ComputeStatistics("max",
    [](const std::vector<double> &v) -> double {
    return *(
               std::max_element(std::begin(v), std::end(v)));
})
->DenseRange(INITIAL_SIZE, FINAL_SIZE, STEP_SIZE);
