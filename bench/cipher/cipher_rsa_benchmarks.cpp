#include <benchmark/benchmark.h>
#include <cipher/cert.hpp>

#include <assets/cert/rsa/rsa_1024b.hpp>
#include <assets/cert/rsa/rsa_16k.hpp>
#include <assets/cert/rsa/rsa_2048b.hpp>
#include <assets/cert/rsa/rsa_32k.hpp>
#include <assets/cert/rsa/rsa_4096b.hpp>
#include <assets/cert/rsa/rsa_512b.hpp>
#include <assets/cert/rsa/rsa_8192b.hpp>

static void BM_cipher_rsa_512b_constructor(benchmark::State &state) {
  for (auto _ : state) {
    (cipher::cert(assets_cert_rsa_512b_rsa_example_cert_der));
  }
}

static void BM_cipher_rsa_512b_contents(benchmark::State &state) {
  auto cert = cipher::cert(assets_cert_rsa_512b_rsa_example_cert_der);
  for (auto _ : state) {
    cert.get_contents();
  }
}

static void BM_cipher_rsa_1024b_constructor(benchmark::State &state) {
  for (auto _ : state) {
    (cipher::cert(assets_cert_rsa_1024b_rsa_example_cert_der));
  }
}

static void BM_cipher_rsa_1024b_contents(benchmark::State &state) {
  auto cert = cipher::cert(assets_cert_rsa_1024b_rsa_example_cert_der);
  for (auto _ : state) {
    cert.get_contents();
  }
}

static void BM_cipher_rsa_2048b_constructor(benchmark::State &state) {
  for (auto _ : state) {
    (cipher::cert(assets_cert_rsa_2048b_rsa_example_cert_der));
  }
}

static void BM_cipher_rsa_2048b_contents(benchmark::State &state) {
  auto cert = cipher::cert(assets_cert_rsa_2048b_rsa_example_cert_der);
  for (auto _ : state) {
    cert.get_contents();
  }
}

static void BM_cipher_rsa_4096b_constructor(benchmark::State &state) {
  for (auto _ : state) {
    (cipher::cert(assets_cert_rsa_4096b_rsa_example_cert_der));
  }
}

static void BM_cipher_rsa_4096b_contents(benchmark::State &state) {
  auto cert = cipher::cert(assets_cert_rsa_4096b_rsa_example_cert_der);
  for (auto _ : state) {
    cert.get_contents();
  }
}

static void BM_cipher_rsa_8192b_constructor(benchmark::State &state) {
  for (auto _ : state) {
    (cipher::cert(assets_cert_rsa_8192b_rsa_example_cert_der));
  }
}

static void BM_cipher_rsa_8192b_contents(benchmark::State &state) {
  auto cert = cipher::cert(assets_cert_rsa_8192b_rsa_example_cert_der);
  for (auto _ : state) {
    cert.get_contents();
  }
}

static void BM_cipher_rsa_16k_constructor(benchmark::State &state) {
  for (auto _ : state) {
    (cipher::cert(assets_cert_rsa_16k_rsa_example_cert_der));
  }
}

static void BM_cipher_rsa_16k_contents(benchmark::State &state) {
  auto cert = cipher::cert(assets_cert_rsa_16k_rsa_example_cert_der);
  for (auto _ : state) {
    cert.get_contents();
  }
}

static void BM_cipher_rsa_32k_constructor(benchmark::State &state) {
  for (auto _ : state) {
    (cipher::cert(assets_cert_rsa_32k_rsa_example_cert_der));
  }
}

static void BM_cipher_rsa_32k_contents(benchmark::State &state) {
  auto cert = cipher::cert(assets_cert_rsa_32k_rsa_example_cert_der);
  for (auto _ : state) {
    cert.get_contents();
  }
}

BENCHMARK(BM_cipher_rsa_512b_constructor);
BENCHMARK(BM_cipher_rsa_512b_contents);
BENCHMARK(BM_cipher_rsa_1024b_constructor);
BENCHMARK(BM_cipher_rsa_1024b_contents);
BENCHMARK(BM_cipher_rsa_2048b_constructor);
BENCHMARK(BM_cipher_rsa_2048b_contents);
BENCHMARK(BM_cipher_rsa_4096b_constructor);
BENCHMARK(BM_cipher_rsa_4096b_contents);
BENCHMARK(BM_cipher_rsa_8192b_constructor);
BENCHMARK(BM_cipher_rsa_8192b_contents);
BENCHMARK(BM_cipher_rsa_16k_constructor);
BENCHMARK(BM_cipher_rsa_16k_contents);
BENCHMARK(BM_cipher_rsa_32k_constructor);
BENCHMARK(BM_cipher_rsa_32k_contents);
