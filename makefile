# this is the build file for project 
# it is autogenerated by the xmake build system.
# do not edit by hand.

CCACHE=/usr/bin/ccache
CXX=/usr/bin/clang
MXX=/usr/bin/clang
AS=/usr/bin/clang
MM=/usr/bin/clang
CC=/usr/bin/clang
MRC=/usr/bin/llvm-rc

AR=/usr/bin/ar
SH=/usr/bin/clang++
LD=/usr/bin/clang++

bench_CXXFLAGS=-Qunused-arguments -m64 -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Werror -O3 -std=c++2b -Iinclude -I/usr/local/include -I/usr/include -isystem /home/pablo/.xmake/packages/b/benchmark/1.7.0/41e335b0d4864392b8c21cd6ed5e875b/include -DNDEBUG
bench_CXXFLAGS=-Qunused-arguments -m64 -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Werror -O3 -std=c++2b -Iinclude -I/usr/local/include -I/usr/include -isystem /home/pablo/.xmake/packages/b/benchmark/1.7.0/41e335b0d4864392b8c21cd6ed5e875b/include -DNDEBUG
bench_LDFLAGS=-m64 -L/home/pablo/.xmake/packages/b/benchmark/1.7.0/41e335b0d4864392b8c21cd6ed5e875b/lib -Lbuild/linux/x86_64/release -L/usr/lib -s -lbenchmark_main -lbenchmark -llibciphervault -lfmt -lssl -lcrypto -lpthread
ciphervault_CXXFLAGS=-Qunused-arguments -m64 -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Werror -O3 -std=c++2b -Iinclude -I/usr/local/include -I/usr/include -isystem /home/pablo/.xmake/packages/c/cxxopts/v3.0.0/533f1970a0884648838ce983784f4181/include -DNDEBUG
ciphervault_CXXFLAGS=-Qunused-arguments -m64 -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Werror -O3 -std=c++2b -Iinclude -I/usr/local/include -I/usr/include -isystem /home/pablo/.xmake/packages/c/cxxopts/v3.0.0/533f1970a0884648838ce983784f4181/include -DNDEBUG
ciphervault_LDFLAGS=-m64 -Lbuild/linux/x86_64/release -L/usr/lib -s -llibciphervault -lfmt -lssl -lcrypto
test_CXXFLAGS=-Qunused-arguments -m64 -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Werror -O3 -std=c++2b -Iinclude -I/usr/local/include -I/usr/include -isystem /home/pablo/.xmake/packages/g/gtest/1.12.1/20a632ab8cd449b696b952cd2c20ce18/include -DNDEBUG
test_CXXFLAGS=-Qunused-arguments -m64 -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Werror -O3 -std=c++2b -Iinclude -I/usr/local/include -I/usr/include -isystem /home/pablo/.xmake/packages/g/gtest/1.12.1/20a632ab8cd449b696b952cd2c20ce18/include -DNDEBUG
test_LDFLAGS=-m64 -L/home/pablo/.xmake/packages/g/gtest/1.12.1/20a632ab8cd449b696b952cd2c20ce18/lib -Lbuild/linux/x86_64/release -L/usr/lib -s -lgtest -lgtest_main -lgmock -llibciphervault -lfmt -lssl -lcrypto -lpthread
libciphervault_CXXFLAGS=-Qunused-arguments -m64 -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Werror -O3 -std=c++2b -Iinclude -I/usr/local/include -I/usr/include -isystem /home/pablo/.xmake/packages/c/cxxopts/v3.0.0/533f1970a0884648838ce983784f4181/include -DNDEBUG
libciphervault_CXXFLAGS=-Qunused-arguments -m64 -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Werror -O3 -std=c++2b -Iinclude -I/usr/local/include -I/usr/include -isystem /home/pablo/.xmake/packages/c/cxxopts/v3.0.0/533f1970a0884648838ce983784f4181/include -DNDEBUG
libciphervault_ARFLAGS=-cr

default:  bench ciphervault test libciphervault

all:  bench ciphervault test libciphervault

.PHONY: default all  bench ciphervault test libciphervault

bench: build/linux/x86_64/release/bench
build/linux/x86_64/release/bench: build/linux/x86_64/release/liblibciphervault.a build/.objs/bench/linux/x86_64/release/bench/cipher/cipher_benchmarks.cpp.o build/.objs/bench/linux/x86_64/release/bench/main.cpp.o
	@echo linking.release bench
	@mkdir -p build/linux/x86_64/release
	@$(LD) -o build/linux/x86_64/release/bench build/.objs/bench/linux/x86_64/release/bench/cipher/cipher_benchmarks.cpp.o build/.objs/bench/linux/x86_64/release/bench/main.cpp.o $(bench_LDFLAGS) > build/.build.log 2>&1

build/.objs/bench/linux/x86_64/release/bench/cipher/cipher_benchmarks.cpp.o: bench/cipher/cipher_benchmarks.cpp
	@echo ccache compiling.release bench/cipher/cipher_benchmarks.cpp
	@mkdir -p build/.objs/bench/linux/x86_64/release/bench/cipher
	@$(CXX) -c $(bench_CXXFLAGS) -o build/.objs/bench/linux/x86_64/release/bench/cipher/cipher_benchmarks.cpp.o bench/cipher/cipher_benchmarks.cpp > build/.build.log 2>&1

build/.objs/bench/linux/x86_64/release/bench/main.cpp.o: bench/main.cpp
	@echo ccache compiling.release bench/main.cpp
	@mkdir -p build/.objs/bench/linux/x86_64/release/bench
	@$(CXX) -c $(bench_CXXFLAGS) -o build/.objs/bench/linux/x86_64/release/bench/main.cpp.o bench/main.cpp > build/.build.log 2>&1

ciphervault: build/linux/x86_64/release/ciphervault
build/linux/x86_64/release/ciphervault: build/linux/x86_64/release/liblibciphervault.a build/.objs/ciphervault/linux/x86_64/release/src/main.cpp.o
	@echo linking.release ciphervault
	@mkdir -p build/linux/x86_64/release
	@$(LD) -o build/linux/x86_64/release/ciphervault build/.objs/ciphervault/linux/x86_64/release/src/main.cpp.o $(ciphervault_LDFLAGS) > build/.build.log 2>&1

build/.objs/ciphervault/linux/x86_64/release/src/main.cpp.o: src/main.cpp
	@echo ccache compiling.release src/main.cpp
	@mkdir -p build/.objs/ciphervault/linux/x86_64/release/src
	@$(CXX) -c $(ciphervault_CXXFLAGS) -o build/.objs/ciphervault/linux/x86_64/release/src/main.cpp.o src/main.cpp > build/.build.log 2>&1

test: build/linux/x86_64/release/test
build/linux/x86_64/release/test: build/linux/x86_64/release/liblibciphervault.a build/.objs/test/linux/x86_64/release/test/cert/cert_tests.cpp.o build/.objs/test/linux/x86_64/release/test/main.cpp.o
	@echo linking.release test
	@mkdir -p build/linux/x86_64/release
	@$(LD) -o build/linux/x86_64/release/test build/.objs/test/linux/x86_64/release/test/cert/cert_tests.cpp.o build/.objs/test/linux/x86_64/release/test/main.cpp.o $(test_LDFLAGS) > build/.build.log 2>&1

build/.objs/test/linux/x86_64/release/test/cert/cert_tests.cpp.o: test/cert/cert_tests.cpp
	@echo ccache compiling.release test/cert/cert_tests.cpp
	@mkdir -p build/.objs/test/linux/x86_64/release/test/cert
	@$(CXX) -c $(test_CXXFLAGS) -o build/.objs/test/linux/x86_64/release/test/cert/cert_tests.cpp.o test/cert/cert_tests.cpp > build/.build.log 2>&1

build/.objs/test/linux/x86_64/release/test/main.cpp.o: test/main.cpp
	@echo ccache compiling.release test/main.cpp
	@mkdir -p build/.objs/test/linux/x86_64/release/test
	@$(CXX) -c $(test_CXXFLAGS) -o build/.objs/test/linux/x86_64/release/test/main.cpp.o test/main.cpp > build/.build.log 2>&1

libciphervault: build/linux/x86_64/release/liblibciphervault.a
build/linux/x86_64/release/liblibciphervault.a: build/.objs/libciphervault/linux/x86_64/release/src/libciphervault/cert.cpp.o
	@echo linking.release liblibciphervault.a
	@mkdir -p build/linux/x86_64/release
	@$(AR) $(libciphervault_ARFLAGS) build/linux/x86_64/release/liblibciphervault.a build/.objs/libciphervault/linux/x86_64/release/src/libciphervault/cert.cpp.o > build/.build.log 2>&1

build/.objs/libciphervault/linux/x86_64/release/src/libciphervault/cert.cpp.o: src/libciphervault/cert.cpp
	@echo ccache compiling.release src/libciphervault/cert.cpp
	@mkdir -p build/.objs/libciphervault/linux/x86_64/release/src/libciphervault
	@$(CXX) -c $(libciphervault_CXXFLAGS) -o build/.objs/libciphervault/linux/x86_64/release/src/libciphervault/cert.cpp.o src/libciphervault/cert.cpp > build/.build.log 2>&1

clean:  clean_bench clean_ciphervault clean_test clean_libciphervault

clean_bench:  clean_libciphervault
	@rm -rf build/linux/x86_64/release/bench
	@rm -rf build/linux/x86_64/release/bench.sym
	@rm -rf build/.objs/bench/linux/x86_64/release/bench/cipher/cipher_benchmarks.cpp.o
	@rm -rf build/.objs/bench/linux/x86_64/release/bench/main.cpp.o

clean_ciphervault:  clean_libciphervault
	@rm -rf build/linux/x86_64/release/ciphervault
	@rm -rf build/linux/x86_64/release/ciphervault.sym
	@rm -rf build/.objs/ciphervault/linux/x86_64/release/src/main.cpp.o

clean_test:  clean_libciphervault
	@rm -rf build/linux/x86_64/release/test
	@rm -rf build/linux/x86_64/release/test.sym
	@rm -rf build/.objs/test/linux/x86_64/release/test/cert/cert_tests.cpp.o
	@rm -rf build/.objs/test/linux/x86_64/release/test/main.cpp.o

clean_libciphervault: 
	@rm -rf build/linux/x86_64/release/liblibciphervault.a
	@rm -rf build/linux/x86_64/release/libciphervault.sym
	@rm -rf build/.objs/libciphervault/linux/x86_64/release/src/libciphervault/cert.cpp.o

