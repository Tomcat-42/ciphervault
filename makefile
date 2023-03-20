# this is the build file for project 
# it is autogenerated by the xmake build system.
# do not edit by hand.

CCACHE=/usr/bin/ccache
MM=/usr/bin/gcc
MXX=/usr/bin/gcc
CC=/usr/bin/gcc
CXX=/usr/bin/gcc
RC=/usr/bin/rustc
AS=/usr/bin/gcc
GC=/usr/bin/go
CU=/opt/cuda/bin/nvcc

SH=/usr/bin/g++
RCSH=/usr/bin/rustc
LD=/usr/bin/g++
RCLD=/usr/bin/rustc
GCLD=/usr/bin/go
AR=/usr/bin/ar
RCAR=/usr/bin/rustc
GCAR=/usr/bin/go
CULD=/opt/cuda/bin/nvcc

cipher_CXXFLAGS=-Qunused-arguments -m64 -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Werror -O3 -Iinclude -I/usr/local/include -I/usr/include -isystem /home/pablo/.xmake/packages/c/cxxopts/v3.0.0/533f1970a0884648838ce983784f4181/include -isystem /home/pablo/.xmake/packages/t/tabulate/1.4/f332da4973a7470eb1f7ff02b32fe5d6/include -std=c++2b -DNDEBUG
cipher_CXXFLAGS=-Qunused-arguments -m64 -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Werror -O3 -Iinclude -I/usr/local/include -I/usr/include -isystem /home/pablo/.xmake/packages/c/cxxopts/v3.0.0/533f1970a0884648838ce983784f4181/include -isystem /home/pablo/.xmake/packages/t/tabulate/1.4/f332da4973a7470eb1f7ff02b32fe5d6/include -std=c++2b -DNDEBUG
cipher_ARFLAGS=-cr
ciphervault_CXXFLAGS=-Qunused-arguments -m64 -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Werror -O3 -Iinclude -I/usr/local/include -I/usr/include -isystem /home/pablo/.xmake/packages/c/cxxopts/v3.0.0/533f1970a0884648838ce983784f4181/include -isystem /home/pablo/.xmake/packages/t/tabulate/1.4/f332da4973a7470eb1f7ff02b32fe5d6/include -std=c++2b -DNDEBUG
ciphervault_CXXFLAGS=-Qunused-arguments -m64 -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Werror -O3 -Iinclude -I/usr/local/include -I/usr/include -isystem /home/pablo/.xmake/packages/c/cxxopts/v3.0.0/533f1970a0884648838ce983784f4181/include -isystem /home/pablo/.xmake/packages/t/tabulate/1.4/f332da4973a7470eb1f7ff02b32fe5d6/include -std=c++2b -DNDEBUG
ciphervault_LDFLAGS=-m64 -Lciphervault -L/usr/lib -s -lcipher -lssl -lcrypto
ciphervault_test_CXXFLAGS=-Qunused-arguments -m64 -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Werror -O3 -Iinclude -I/usr/local/include -I/usr/include -isystem /home/pablo/.xmake/packages/g/gtest/1.12.1/20a632ab8cd449b696b952cd2c20ce18/include -std=c++2b -DNDEBUG
ciphervault_test_CXXFLAGS=-Qunused-arguments -m64 -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Werror -O3 -Iinclude -I/usr/local/include -I/usr/include -isystem /home/pablo/.xmake/packages/g/gtest/1.12.1/20a632ab8cd449b696b952cd2c20ce18/include -std=c++2b -DNDEBUG
ciphervault_test_LDFLAGS=-m64 -L/home/pablo/.xmake/packages/g/gtest/1.12.1/20a632ab8cd449b696b952cd2c20ce18/lib -Lciphervault -L/usr/lib -s -lgtest -lgtest_main -lgmock -lcipher -lssl -lcrypto -lpthread
ciphervault_bench_CXXFLAGS=-Qunused-arguments -m64 -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Werror -O3 -Iinclude -I/usr/local/include -I/usr/include -isystem /home/pablo/.xmake/packages/b/benchmark/1.7.0/41e335b0d4864392b8c21cd6ed5e875b/include -std=c++2b -DNDEBUG
ciphervault_bench_CXXFLAGS=-Qunused-arguments -m64 -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Werror -O3 -Iinclude -I/usr/local/include -I/usr/include -isystem /home/pablo/.xmake/packages/b/benchmark/1.7.0/41e335b0d4864392b8c21cd6ed5e875b/include -std=c++2b -DNDEBUG
ciphervault_bench_LDFLAGS=-m64 -L/home/pablo/.xmake/packages/b/benchmark/1.7.0/41e335b0d4864392b8c21cd6ed5e875b/lib -Lciphervault -L/usr/lib -s -lbenchmark_main -lbenchmark -lcipher -lssl -lcrypto -lpthread

default:  cipher ciphervault ciphervault_test ciphervault_bench

all:  cipher ciphervault ciphervault_test ciphervault_bench

.PHONY: default all  cipher ciphervault ciphervault_test ciphervault_bench

cipher: ciphervault/libcipher.a
ciphervault/libcipher.a: build/.objs/cipher/linux/x86_64/release/src/cipher/cert.cpp.o
	@echo linking.release libcipher.a
	@mkdir -p ciphervault
	@$(AR) $(cipher_ARFLAGS) ciphervault/libcipher.a build/.objs/cipher/linux/x86_64/release/src/cipher/cert.cpp.o > build/.build.log 2>&1

build/.objs/cipher/linux/x86_64/release/src/cipher/cert.cpp.o: src/cipher/cert.cpp
	@echo ccache compiling.release src/cipher/cert.cpp
	@mkdir -p build/.objs/cipher/linux/x86_64/release/src/cipher
	@clang -c $(cipher_CXXFLAGS) -o build/.objs/cipher/linux/x86_64/release/src/cipher/cert.cpp.o src/cipher/cert.cpp > build/.build.log 2>&1

ciphervault: ciphervault/ciphervault
ciphervault/ciphervault: ciphervault/libcipher.a build/.objs/ciphervault/linux/x86_64/release/src/main.cpp.o
	@echo linking.release ciphervault
	@mkdir -p ciphervault
	@/usr/bin/clang++ -o ciphervault/ciphervault build/.objs/ciphervault/linux/x86_64/release/src/main.cpp.o $(ciphervault_LDFLAGS) > build/.build.log 2>&1

build/.objs/ciphervault/linux/x86_64/release/src/main.cpp.o: src/main.cpp
	@echo ccache compiling.release src/main.cpp
	@mkdir -p build/.objs/ciphervault/linux/x86_64/release/src
	@clang -c $(ciphervault_CXXFLAGS) -o build/.objs/ciphervault/linux/x86_64/release/src/main.cpp.o src/main.cpp > build/.build.log 2>&1

ciphervault_test: ciphervault/ciphervault_test
ciphervault/ciphervault_test: ciphervault/libcipher.a build/.objs/ciphervault_test/linux/x86_64/release/test/cert/cert_rsa_tests.cpp.o build/.objs/ciphervault_test/linux/x86_64/release/test/cert/cert_dsa_tests.cpp.o build/.objs/ciphervault_test/linux/x86_64/release/test/main.cpp.o
	@echo linking.release ciphervault_test
	@mkdir -p ciphervault
	@/usr/bin/clang++ -o ciphervault/ciphervault_test build/.objs/ciphervault_test/linux/x86_64/release/test/cert/cert_rsa_tests.cpp.o build/.objs/ciphervault_test/linux/x86_64/release/test/cert/cert_dsa_tests.cpp.o build/.objs/ciphervault_test/linux/x86_64/release/test/main.cpp.o $(ciphervault_test_LDFLAGS) > build/.build.log 2>&1

build/.objs/ciphervault_test/linux/x86_64/release/test/cert/cert_rsa_tests.cpp.o: test/cert/cert_rsa_tests.cpp
	@echo ccache compiling.release test/cert/cert_rsa_tests.cpp
	@mkdir -p build/.objs/ciphervault_test/linux/x86_64/release/test/cert
	@clang -c $(ciphervault_test_CXXFLAGS) -o build/.objs/ciphervault_test/linux/x86_64/release/test/cert/cert_rsa_tests.cpp.o test/cert/cert_rsa_tests.cpp > build/.build.log 2>&1

build/.objs/ciphervault_test/linux/x86_64/release/test/cert/cert_dsa_tests.cpp.o: test/cert/cert_dsa_tests.cpp
	@echo ccache compiling.release test/cert/cert_dsa_tests.cpp
	@mkdir -p build/.objs/ciphervault_test/linux/x86_64/release/test/cert
	@clang -c $(ciphervault_test_CXXFLAGS) -o build/.objs/ciphervault_test/linux/x86_64/release/test/cert/cert_dsa_tests.cpp.o test/cert/cert_dsa_tests.cpp > build/.build.log 2>&1

build/.objs/ciphervault_test/linux/x86_64/release/test/main.cpp.o: test/main.cpp
	@echo ccache compiling.release test/main.cpp
	@mkdir -p build/.objs/ciphervault_test/linux/x86_64/release/test
	@clang -c $(ciphervault_test_CXXFLAGS) -o build/.objs/ciphervault_test/linux/x86_64/release/test/main.cpp.o test/main.cpp > build/.build.log 2>&1

ciphervault_bench: ciphervault/ciphervault_bench
ciphervault/ciphervault_bench: ciphervault/libcipher.a build/.objs/ciphervault_bench/linux/x86_64/release/bench/cipher/cipher_rsa_benchmarks.cpp.o build/.objs/ciphervault_bench/linux/x86_64/release/bench/cipher/cipher_dsa_benchmarks.cpp.o build/.objs/ciphervault_bench/linux/x86_64/release/bench/main.cpp.o
	@echo linking.release ciphervault_bench
	@mkdir -p ciphervault
	@/usr/bin/clang++ -o ciphervault/ciphervault_bench build/.objs/ciphervault_bench/linux/x86_64/release/bench/cipher/cipher_rsa_benchmarks.cpp.o build/.objs/ciphervault_bench/linux/x86_64/release/bench/cipher/cipher_dsa_benchmarks.cpp.o build/.objs/ciphervault_bench/linux/x86_64/release/bench/main.cpp.o $(ciphervault_bench_LDFLAGS) > build/.build.log 2>&1

build/.objs/ciphervault_bench/linux/x86_64/release/bench/cipher/cipher_rsa_benchmarks.cpp.o: bench/cipher/cipher_rsa_benchmarks.cpp
	@echo ccache compiling.release bench/cipher/cipher_rsa_benchmarks.cpp
	@mkdir -p build/.objs/ciphervault_bench/linux/x86_64/release/bench/cipher
	@clang -c $(ciphervault_bench_CXXFLAGS) -o build/.objs/ciphervault_bench/linux/x86_64/release/bench/cipher/cipher_rsa_benchmarks.cpp.o bench/cipher/cipher_rsa_benchmarks.cpp > build/.build.log 2>&1

build/.objs/ciphervault_bench/linux/x86_64/release/bench/cipher/cipher_dsa_benchmarks.cpp.o: bench/cipher/cipher_dsa_benchmarks.cpp
	@echo ccache compiling.release bench/cipher/cipher_dsa_benchmarks.cpp
	@mkdir -p build/.objs/ciphervault_bench/linux/x86_64/release/bench/cipher
	@clang -c $(ciphervault_bench_CXXFLAGS) -o build/.objs/ciphervault_bench/linux/x86_64/release/bench/cipher/cipher_dsa_benchmarks.cpp.o bench/cipher/cipher_dsa_benchmarks.cpp > build/.build.log 2>&1

build/.objs/ciphervault_bench/linux/x86_64/release/bench/main.cpp.o: bench/main.cpp
	@echo ccache compiling.release bench/main.cpp
	@mkdir -p build/.objs/ciphervault_bench/linux/x86_64/release/bench
	@clang -c $(ciphervault_bench_CXXFLAGS) -o build/.objs/ciphervault_bench/linux/x86_64/release/bench/main.cpp.o bench/main.cpp > build/.build.log 2>&1

clean:  clean_cipher clean_ciphervault clean_ciphervault_test clean_ciphervault_bench

clean_cipher: 
	@rm -rf ciphervault/libcipher.a
	@rm -rf ciphervault/cipher.sym
	@rm -rf build/.objs/cipher/linux/x86_64/release/src/cipher/cert.cpp.o

clean_ciphervault:  clean_cipher
	@rm -rf ciphervault/ciphervault
	@rm -rf ciphervault/ciphervault.sym
	@rm -rf build/.objs/ciphervault/linux/x86_64/release/src/main.cpp.o

clean_ciphervault_test:  clean_cipher
	@rm -rf ciphervault/ciphervault_test
	@rm -rf ciphervault/ciphervault_test.sym
	@rm -rf build/.objs/ciphervault_test/linux/x86_64/release/test/cert/cert_rsa_tests.cpp.o
	@rm -rf build/.objs/ciphervault_test/linux/x86_64/release/test/cert/cert_dsa_tests.cpp.o
	@rm -rf build/.objs/ciphervault_test/linux/x86_64/release/test/main.cpp.o

clean_ciphervault_bench:  clean_cipher
	@rm -rf ciphervault/ciphervault_bench
	@rm -rf ciphervault/ciphervault_bench.sym
	@rm -rf build/.objs/ciphervault_bench/linux/x86_64/release/bench/cipher/cipher_rsa_benchmarks.cpp.o
	@rm -rf build/.objs/ciphervault_bench/linux/x86_64/release/bench/cipher/cipher_dsa_benchmarks.cpp.o
	@rm -rf build/.objs/ciphervault_bench/linux/x86_64/release/bench/main.cpp.o

install_cipher: cipher
	@mkdir -p $(DESTDIR)/usr/local/lib
	@cp -f ciphervault/libcipher.a $(DESTDIR)/usr/local/lib/libcipher.a
	@chmod 644 $(DESTDIR)/usr/local/lib/libcipher.a
	@mkdir -p $(DESTDIR)/usr/local/include/cipher
	@cp -f include/cipher/cert.hpp $(DESTDIR)/usr/local/include/cipher/cert.hpp
	@chmod 644 $(DESTDIR)/usr/local/include/cipher/cert.hpp

install_ciphervault: ciphervault
	@mkdir -p $(DESTDIR)/usr/local/bin
	@cp -f ciphervault/ciphervault $(DESTDIR)/usr/local/bin/ciphervault
	@chmod 755 $(DESTDIR)/usr/local/bin/ciphervault

install_ciphervault_test: ciphervault_test
	@mkdir -p $(DESTDIR)/usr/local/bin
	@cp -f ciphervault/ciphervault_test $(DESTDIR)/usr/local/bin/ciphervault_test
	@chmod 755 $(DESTDIR)/usr/local/bin/ciphervault_test

install_ciphervault_bench: ciphervault_bench
	@mkdir -p $(DESTDIR)/usr/local/bin
	@cp -f ciphervault/ciphervault_bench $(DESTDIR)/usr/local/bin/ciphervault_bench
	@chmod 755 $(DESTDIR)/usr/local/bin/ciphervault_bench

uninstall:
	@rm -f $(DESTDIR)/usr/local/lib/libcipher.a
	@rm -f $(DESTDIR)/usr/local/include/cipher/cert.hpp
	@rm -f $(DESTDIR)/usr/local/bin/ciphervault
	@rm -f $(DESTDIR)/usr/local/bin/ciphervault_test
	@rm -f $(DESTDIR)/usr/local/bin/ciphervault_bench

install: install_cipher install_ciphervault install_ciphervault_test install_ciphervault_bench

test: ciphervault_test
	@./ciphervault/ciphervault_test

.PHONY: default all  ciphervault ciphervault_test ciphervault_bench libciphervault test install clean
