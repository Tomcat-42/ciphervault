# this is the build file for project 
# it is autogenerated by the xmake build system.
# do not edit by hand.

CCACHE=/usr/bin/ccache
CC=clang
MXX=/usr/bin/clang
AS=/usr/bin/clang
MRC=/usr/bin/llvm-rc
MM=/usr/bin/clang
CXX=clang

SH=/usr/bin/clang++
LD=/usr/bin/clang++
AR=/usr/bin/ar

ciphervault_CXXFLAGS=-Qunused-arguments -m64 -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Werror -O3 -Iinclude -I/usr/local/include -I/usr/include -isystem /home/pablo/.xmake/packages/c/cxxopts/v3.0.0/533f1970a0884648838ce983784f4181/include -isystem /home/pablo/.xmake/packages/t/tabulate/1.4/f332da4973a7470eb1f7ff02b32fe5d6/include -std=c++2b -DNDEBUG
ciphervault_CXXFLAGS=-Qunused-arguments -m64 -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Werror -O3 -Iinclude -I/usr/local/include -I/usr/include -isystem /home/pablo/.xmake/packages/c/cxxopts/v3.0.0/533f1970a0884648838ce983784f4181/include -isystem /home/pablo/.xmake/packages/t/tabulate/1.4/f332da4973a7470eb1f7ff02b32fe5d6/include -std=c++2b -DNDEBUG
ciphervault_LDFLAGS=-m64 -Lciphervault -L/usr/lib -s -llibciphervault -lfmt -lssl -lcrypto
ciphervault_test_CXXFLAGS=-Qunused-arguments -m64 -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Werror -O3 -Iinclude -I/usr/local/include -I/usr/include -isystem /home/pablo/.xmake/packages/g/gtest/1.12.1/20a632ab8cd449b696b952cd2c20ce18/include -std=c++2b -DNDEBUG
ciphervault_test_CXXFLAGS=-Qunused-arguments -m64 -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Werror -O3 -Iinclude -I/usr/local/include -I/usr/include -isystem /home/pablo/.xmake/packages/g/gtest/1.12.1/20a632ab8cd449b696b952cd2c20ce18/include -std=c++2b -DNDEBUG
ciphervault_test_LDFLAGS=-m64 -L/home/pablo/.xmake/packages/g/gtest/1.12.1/20a632ab8cd449b696b952cd2c20ce18/lib -Lciphervault -L/usr/lib -s -lgtest -lgtest_main -lgmock -llibciphervault -lfmt -lssl -lcrypto -lpthread
ciphervault_bench_CXXFLAGS=-Qunused-arguments -m64 -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Werror -O3 -Iinclude -I/usr/local/include -I/usr/include -isystem /home/pablo/.xmake/packages/b/benchmark/1.7.0/41e335b0d4864392b8c21cd6ed5e875b/include -std=c++2b -DNDEBUG
ciphervault_bench_CXXFLAGS=-Qunused-arguments -m64 -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Werror -O3 -Iinclude -I/usr/local/include -I/usr/include -isystem /home/pablo/.xmake/packages/b/benchmark/1.7.0/41e335b0d4864392b8c21cd6ed5e875b/include -std=c++2b -DNDEBUG
ciphervault_bench_LDFLAGS=-m64 -L/home/pablo/.xmake/packages/b/benchmark/1.7.0/41e335b0d4864392b8c21cd6ed5e875b/lib -Lciphervault -L/usr/lib -s -lbenchmark_main -lbenchmark -llibciphervault -lfmt -lssl -lcrypto -lpthread
libciphervault_CXXFLAGS=-Qunused-arguments -m64 -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Werror -O3 -Iinclude -I/usr/local/include -I/usr/include -isystem /home/pablo/.xmake/packages/c/cxxopts/v3.0.0/533f1970a0884648838ce983784f4181/include -isystem /home/pablo/.xmake/packages/t/tabulate/1.4/f332da4973a7470eb1f7ff02b32fe5d6/include -std=c++2b -DNDEBUG
libciphervault_CXXFLAGS=-Qunused-arguments -m64 -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Werror -O3 -Iinclude -I/usr/local/include -I/usr/include -isystem /home/pablo/.xmake/packages/c/cxxopts/v3.0.0/533f1970a0884648838ce983784f4181/include -isystem /home/pablo/.xmake/packages/t/tabulate/1.4/f332da4973a7470eb1f7ff02b32fe5d6/include -std=c++2b -DNDEBUG
libciphervault_ARFLAGS=-cr

default:  ciphervault ciphervault_test ciphervault_bench libciphervault

all:  ciphervault ciphervault_test ciphervault_bench libciphervault

.PHONY: default all  ciphervault ciphervault_test ciphervault_bench libciphervault

ciphervault: ciphervault/ciphervault
ciphervault/ciphervault: ciphervault/libciphervault.a build/.objs/ciphervault/linux/x86_64/release/src/main.cpp.o
	@echo linking.release ciphervault
	@mkdir -p ciphervault
	@$(LD) -o ciphervault/ciphervault build/.objs/ciphervault/linux/x86_64/release/src/main.cpp.o $(ciphervault_LDFLAGS) > build/.build.log 2>&1

build/.objs/ciphervault/linux/x86_64/release/src/main.cpp.o: src/main.cpp
	@echo ccache compiling.release src/main.cpp
	@mkdir -p build/.objs/ciphervault/linux/x86_64/release/src
	@$(CXX) -c $(ciphervault_CXXFLAGS) -o build/.objs/ciphervault/linux/x86_64/release/src/main.cpp.o src/main.cpp > build/.build.log 2>&1

ciphervault_test: ciphervault/ciphervault_test
ciphervault/ciphervault_test: ciphervault/libciphervault.a build/.objs/ciphervault_test/linux/x86_64/release/test/cert/cert_rsa_tests.cpp.o build/.objs/ciphervault_test/linux/x86_64/release/test/cert/cert_dsa_tests.cpp.o build/.objs/ciphervault_test/linux/x86_64/release/test/main.cpp.o
	@echo linking.release ciphervault_test
	@mkdir -p ciphervault
	@$(LD) -o ciphervault/ciphervault_test build/.objs/ciphervault_test/linux/x86_64/release/test/cert/cert_rsa_tests.cpp.o build/.objs/ciphervault_test/linux/x86_64/release/test/cert/cert_dsa_tests.cpp.o build/.objs/ciphervault_test/linux/x86_64/release/test/main.cpp.o $(ciphervault_test_LDFLAGS) > build/.build.log 2>&1

build/.objs/ciphervault_test/linux/x86_64/release/test/cert/cert_rsa_tests.cpp.o: test/cert/cert_rsa_tests.cpp
	@echo ccache compiling.release test/cert/cert_rsa_tests.cpp
	@mkdir -p build/.objs/ciphervault_test/linux/x86_64/release/test/cert
	@$(CXX) -c $(ciphervault_test_CXXFLAGS) -o build/.objs/ciphervault_test/linux/x86_64/release/test/cert/cert_rsa_tests.cpp.o test/cert/cert_rsa_tests.cpp > build/.build.log 2>&1

build/.objs/ciphervault_test/linux/x86_64/release/test/cert/cert_dsa_tests.cpp.o: test/cert/cert_dsa_tests.cpp
	@echo ccache compiling.release test/cert/cert_dsa_tests.cpp
	@mkdir -p build/.objs/ciphervault_test/linux/x86_64/release/test/cert
	@$(CXX) -c $(ciphervault_test_CXXFLAGS) -o build/.objs/ciphervault_test/linux/x86_64/release/test/cert/cert_dsa_tests.cpp.o test/cert/cert_dsa_tests.cpp > build/.build.log 2>&1

build/.objs/ciphervault_test/linux/x86_64/release/test/main.cpp.o: test/main.cpp
	@echo ccache compiling.release test/main.cpp
	@mkdir -p build/.objs/ciphervault_test/linux/x86_64/release/test
	@$(CXX) -c $(ciphervault_test_CXXFLAGS) -o build/.objs/ciphervault_test/linux/x86_64/release/test/main.cpp.o test/main.cpp > build/.build.log 2>&1

ciphervault_bench: ciphervault/ciphervault_bench
ciphervault/ciphervault_bench: ciphervault/libciphervault.a build/.objs/ciphervault_bench/linux/x86_64/release/bench/cipher/cipher_rsa_benchmarks.cpp.o build/.objs/ciphervault_bench/linux/x86_64/release/bench/cipher/cipher_dsa_benchmarks.cpp.o build/.objs/ciphervault_bench/linux/x86_64/release/bench/main.cpp.o
	@echo linking.release ciphervault_bench
	@mkdir -p ciphervault
	@$(LD) -o ciphervault/ciphervault_bench build/.objs/ciphervault_bench/linux/x86_64/release/bench/cipher/cipher_rsa_benchmarks.cpp.o build/.objs/ciphervault_bench/linux/x86_64/release/bench/cipher/cipher_dsa_benchmarks.cpp.o build/.objs/ciphervault_bench/linux/x86_64/release/bench/main.cpp.o $(ciphervault_bench_LDFLAGS) > build/.build.log 2>&1

build/.objs/ciphervault_bench/linux/x86_64/release/bench/cipher/cipher_rsa_benchmarks.cpp.o: bench/cipher/cipher_rsa_benchmarks.cpp
	@echo ccache compiling.release bench/cipher/cipher_rsa_benchmarks.cpp
	@mkdir -p build/.objs/ciphervault_bench/linux/x86_64/release/bench/cipher
	@$(CXX) -c $(ciphervault_bench_CXXFLAGS) -o build/.objs/ciphervault_bench/linux/x86_64/release/bench/cipher/cipher_rsa_benchmarks.cpp.o bench/cipher/cipher_rsa_benchmarks.cpp > build/.build.log 2>&1

build/.objs/ciphervault_bench/linux/x86_64/release/bench/cipher/cipher_dsa_benchmarks.cpp.o: bench/cipher/cipher_dsa_benchmarks.cpp
	@echo ccache compiling.release bench/cipher/cipher_dsa_benchmarks.cpp
	@mkdir -p build/.objs/ciphervault_bench/linux/x86_64/release/bench/cipher
	@$(CXX) -c $(ciphervault_bench_CXXFLAGS) -o build/.objs/ciphervault_bench/linux/x86_64/release/bench/cipher/cipher_dsa_benchmarks.cpp.o bench/cipher/cipher_dsa_benchmarks.cpp > build/.build.log 2>&1

build/.objs/ciphervault_bench/linux/x86_64/release/bench/main.cpp.o: bench/main.cpp
	@echo ccache compiling.release bench/main.cpp
	@mkdir -p build/.objs/ciphervault_bench/linux/x86_64/release/bench
	@$(CXX) -c $(ciphervault_bench_CXXFLAGS) -o build/.objs/ciphervault_bench/linux/x86_64/release/bench/main.cpp.o bench/main.cpp > build/.build.log 2>&1

libciphervault: ciphervault/libciphervault.a
ciphervault/libciphervault.a: build/.objs/libciphervault/linux/x86_64/release/src/libciphervault/cert.cpp.o
	@echo linking.release libciphervault.a
	@mkdir -p ciphervault
	@$(AR) $(libciphervault_ARFLAGS) ciphervault/libciphervault.a build/.objs/libciphervault/linux/x86_64/release/src/libciphervault/cert.cpp.o > build/.build.log 2>&1

build/.objs/libciphervault/linux/x86_64/release/src/libciphervault/cert.cpp.o: src/libciphervault/cert.cpp
	@echo ccache compiling.release src/libciphervault/cert.cpp
	@mkdir -p build/.objs/libciphervault/linux/x86_64/release/src/libciphervault
	@$(CXX) -c $(libciphervault_CXXFLAGS) -o build/.objs/libciphervault/linux/x86_64/release/src/libciphervault/cert.cpp.o src/libciphervault/cert.cpp > build/.build.log 2>&1

clean:  clean_ciphervault clean_ciphervault_test clean_ciphervault_bench clean_libciphervault

clean_ciphervault:  clean_libciphervault
	@rm -rf ciphervault/ciphervault
	@rm -rf ciphervault/ciphervault.sym
	@rm -rf build/.objs/ciphervault/linux/x86_64/release/src/main.cpp.o

clean_ciphervault_test:  clean_libciphervault
	@rm -rf ciphervault/ciphervault_test
	@rm -rf ciphervault/ciphervault_test.sym
	@rm -rf build/.objs/ciphervault_test/linux/x86_64/release/test/cert/cert_rsa_tests.cpp.o
	@rm -rf build/.objs/ciphervault_test/linux/x86_64/release/test/cert/cert_dsa_tests.cpp.o
	@rm -rf build/.objs/ciphervault_test/linux/x86_64/release/test/main.cpp.o

clean_ciphervault_bench:  clean_libciphervault
	@rm -rf ciphervault/ciphervault_bench
	@rm -rf ciphervault/ciphervault_bench.sym
	@rm -rf build/.objs/ciphervault_bench/linux/x86_64/release/bench/cipher/cipher_rsa_benchmarks.cpp.o
	@rm -rf build/.objs/ciphervault_bench/linux/x86_64/release/bench/cipher/cipher_dsa_benchmarks.cpp.o
	@rm -rf build/.objs/ciphervault_bench/linux/x86_64/release/bench/main.cpp.o

clean_libciphervault: 
	@rm -rf ciphervault/libciphervault.a
	@rm -rf ciphervault/libciphervault.sym
	@rm -rf build/.objs/libciphervault/linux/x86_64/release/src/libciphervault/cert.cpp.o

