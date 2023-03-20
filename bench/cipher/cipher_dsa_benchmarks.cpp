#include <benchmark/benchmark.h>
#include <cipher/cert.hpp>
#include <iostream>

#include <assets/cert/dsa/dsa_1024b.hpp>
#include <assets/cert/dsa/dsa_16k.hpp>
#include <assets/cert/dsa/dsa_2048b.hpp>
#include <assets/cert/dsa/dsa_4096b.hpp>
#include <assets/cert/dsa/dsa_512b.hpp>
#include <assets/cert/dsa/dsa_8192b.hpp>

static void BM_cipher_dsa_512b_constructor(benchmark::State &state) {
  for (auto _ : state) {
    (cipher::cert(assets_cert_dsa_512b_dsa_example_cert_der));
  }
}

static void BM_cipher_dsa_512b_contents(benchmark::State &state) {
  auto cert = cipher::cert(assets_cert_dsa_512b_dsa_example_cert_der);
  for (auto _ : state) {
    cert.get_contents();
  }
}

static void BM_cipher_dsa_1024b_constructor(benchmark::State &state) {
  for (auto _ : state) {
    (cipher::cert(assets_cert_dsa_1024b_dsa_example_cert_der));
  }
}

static void BM_cipher_dsa_1024b_contents(benchmark::State &state) {
  auto cert = cipher::cert(assets_cert_dsa_1024b_dsa_example_cert_der);
  for (auto _ : state) {
    cert.get_contents();
  }
}

static void BM_cipher_dsa_2048b_constructor(benchmark::State &state) {
  for (auto _ : state) {
    (cipher::cert(assets_cert_dsa_2048b_dsa_example_cert_der));
  }
}

static void BM_cipher_dsa_2048b_contents(benchmark::State &state) {
  auto cert = cipher::cert(assets_cert_dsa_2048b_dsa_example_cert_der);
  for (auto _ : state) {
    cert.get_contents();
  }
}

static void BM_cipher_dsa_4096b_constructor(benchmark::State &state) {
  for (auto _ : state) {
    (cipher::cert(assets_cert_dsa_4096b_dsa_example_cert_der));
  }
}

static void BM_cipher_dsa_4096b_contents(benchmark::State &state) {
  auto cert = cipher::cert(assets_cert_dsa_4096b_dsa_example_cert_der);
  for (auto _ : state) {
    cert.get_contents();
  }
}

static void BM_cipher_dsa_8192b_constructor(benchmark::State &state) {
  for (auto _ : state) {
    (cipher::cert(assets_cert_dsa_8192b_dsa_example_cert_der));
  }
}

static void BM_cipher_dsa_8192b_contents(benchmark::State &state) {
  auto cert = cipher::cert(assets_cert_dsa_8192b_dsa_example_cert_der);
  for (auto _ : state) {
    cert.get_contents();
  }
}

static void BM_cipher_dsa_16k_constructor(benchmark::State &state) {
  for (auto _ : state) {
    (cipher::cert(assets_cert_dsa_16k_dsa_example_cert_der));
  }
}

static void BM_cipher_dsa_16k_contents(benchmark::State &state) {
  auto cert = cipher::cert(assets_cert_dsa_16k_dsa_example_cert_der);
  for (auto _ : state) {
    cert.get_contents();
  }
}

BENCHMARK(BM_cipher_dsa_512b_constructor);
BENCHMARK(BM_cipher_dsa_512b_contents);
BENCHMARK(BM_cipher_dsa_1024b_constructor);
BENCHMARK(BM_cipher_dsa_1024b_contents);
BENCHMARK(BM_cipher_dsa_2048b_constructor);
BENCHMARK(BM_cipher_dsa_2048b_contents);
BENCHMARK(BM_cipher_dsa_4096b_constructor);
BENCHMARK(BM_cipher_dsa_4096b_contents);
BENCHMARK(BM_cipher_dsa_8192b_constructor);
BENCHMARK(BM_cipher_dsa_8192b_contents);
BENCHMARK(BM_cipher_dsa_16k_constructor);
BENCHMARK(BM_cipher_dsa_16k_contents);
