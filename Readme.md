<p align="center">
    <img src="https://cdn4.iconfinder.com/data/icons/digital-marketing-gradient-rave-and-glow/512/Privacy-512.png" width=138/>
</p>

<h1 align="center">ciphervault</h1>

<div align="center">
    <a href="https://hub.docker.com/r/tomcat0x42/ciphervault" target="_blank">
    <img src="https://img.shields.io/docker/v/tomcat0x42/ciphervault"></a>
    <a href="https://github.com/Tomcat-42/ciphervault" target="_blank">
    <img alt="GitHub Repo stars" src="https://img.shields.io/github/stars/Tomcat-42/ciphervault?style=social">
</div>

> A x509 DER digital certificates wrapper library and comman line application.

<!-- TOC start -->
- [Building](#building)
  * [Building in a Docker Container](#building-in-a-docker-container)
  * [Building locally with xmake](#building-locally-with-xmake)
  * [Building locally with make or cmake](#building-locally-with-make-or-cmake)
- [Installing](#installing)
  * [Pre built docker container](#pre-built-docker-container)
  * [xmake or make](#xmake-or-make)
- [Running](#running)
  * [In the provided container](#in-the-provided-container)
  * [Locally](#locally)
- [Usage example](#usage-example)
- [Tests and Benchmarks](#tests-and-benchmarks)
- [CI/CD](#cicd)
- [Documentation](#documentation)
- [Error handling](#error-handling)
- [Design Patterns, idioms and general considerations](#design-patterns-idioms-and-general-considerations)
<!-- TOC end -->

<!-- TOC --><a name="building"></a>
## Building

This project have four targets:

- `libcipher.a`: A static library that contains all the logic. Depends on
  `libssl3`.
- `ciphervault`: A binary command line application that uses `libcipher` to
  manage x509 DER certs.
- `ciphervault_test`: Unit tests. Depends on `libcipher` and `gtest`.
- `ciphervault_bench`: Execution benchmarks. Depends on `libcipher` and
  `benchmark`.

Build of separate targets is supported if one do not want to download a specific
dependency, e.g. `gtest`.

The supported build tools are as follows:

<!-- TOC --><a name="building-in-a-docker-container"></a>
### Building in a Docker Container

This is the recomended build engine, as it uses the pre-made C++ environment
[cppdev](https://github.com/Tomcat-42/cppdev). First, you have to download the
container:

```bash
docker pull tomcat0x42/cppdev
```

For installing it:

```bash
docker pull tomcat0x42/cppdev
```

Finally, just run the build script:

```bash
./scripts/build
```

After the build is complete, the resulting targets will be available in the
folder `./ciphervault`.

<!-- TOC --><a name="building-locally-with-xmake"></a>
### Building locally with xmake

Using the excelent tool [xmake](https://xmake.io/#/), you can download all the
build dependencies and build the project:

```bash
xrepo install -y fmt cxxopts gtest benchmark tabulate
xmake build -y
```

The resulting files will be at `./ciphervault`

<!-- TOC --><a name="building-locally-with-make-or-cmake"></a>
### Building locally with make or cmake

If you choose the old way, you must download all the dependencies listed abobe
using you favorite package manager. After that you can build:

```bash
make
# or
mkdir -p build && cd build && cmake .. && make
```

The resulting files will be at `./ciphervault`

<!-- TOC --><a name="installing"></a>
## Installing

After the build is complete, you should install the project. There are multiple
ways of doing so:

<!-- TOC --><a name="pre-built-docker-container"></a>
### Pre built docker container

A pre built [container](https://hub.docker.com/r/tomcat0x42/ciphervault) with
all the targets and dependencies is available. For downloading it:

```bash
docker pull tomcat0x42/ciphervault
```

<!-- TOC --><a name="xmake-or-make"></a>
### xmake or make

After the build, all targets will be at `./ciphervault` and the default
installation path is `/usr/local/{bin,lib}`. So, for installing the targets
choose one method:

```bash
make install
#or
xmake install
```

<!-- TOC --><a name="running"></a>
## Running

<!-- TOC --><a name="in-the-provided-container"></a>
### In the provided container

Just run the following command. The container will be downloaded if not found.
Note the `assets/.../...der` file, here you can pass any _x509 DER_ cert, but
before you must map the file or dir containing it as a docker **volume(-v)**

```bash
docker run -v ${PWD}/assets:/ciphervault/assets -it tomcat0x42/ciphervault assets/cert/dsa/1024b-dsa-example-cert.der --table
```

<!-- TOC --><a name="locally"></a>
### Locally

If you followed the instalation section, all the targets should be at your path.
So just run it normally:

```bash
ciphervault
```

You can also use xmake to run a specific target:

```bash
xmake run ciphervault
xmake run ciphervault_test
xmake run ciphervault_bench
```

<!-- TOC --><a name="usage-example"></a>
## Usage example

```
$ ciphervault --help

ciphervault --  A x509 DER digital certificates wrapper library and comman line application.
Usage:
  ciphervault [OPTION...] positional parameters

  -c, --contents   Print the contents of the certificate.
  -i, --issuer     Print the issuer of the certificate.
  -s, --subject    Print the subject of the certificate.
  -b, --notbefore  Print the not before date of the certificate.
  -a, --notafter   Print the not after date of the certificate.
  -g, --sigalg     Print the signature algorithm of the certificate.
  -t, --table      Print the certificate in a table.
  -h, --help       Print this help message.
```

You can print all the cert content, separated fields or a table with some field.
e.g.:

```
$ciphervault assets/cert/dsa/1024b-dsa-example-cert.der --table

+------------+-----------------------------------------------------------------------------------------------------------------+
|   Issuer   | C=JP, ST=Tokyo, L=Chuo-ku, O=Frank4DD, OU=WebCert Support, CN=Frank4DD Web CA/emailAddress=support@frank4dd.com |
+------------+-----------------------------------------------------------------------------------------------------------------+
|   Subject  |                                  C=JP, ST=Tokyo, O=Frank4DD, CN=www.example.com                                 |
+------------+-----------------------------------------------------------------------------------------------------------------+
| Not Before |                                             Aug 22 07:27:02 2012 GMT                                            |
+------------+-----------------------------------------------------------------------------------------------------------------+
|  Not After |                                             Aug 21 07:27:02 2017 GMT                                            |
+------------+-----------------------------------------------------------------------------------------------------------------+
```

<!-- TOC --><a name="tests-and-benchmarks"></a>
## Tests and Benchmarks

This project have a `ciphervault_test` and `ciphervault_bench` targets, for
respectively unittesting and micro-benchmarking. Whilst you can run those alone,
they are more useful In the [CI/CD pipeline](./.github/workflows/cicd.yml).

<!-- TOC --><a name="cicd"></a>
## CI/CD

The file `.github/workflows/cicd.yml` describe a **cascading** CI/CD pipeline
using [Github Actions](https://docs.github.com/en/actions) as follows:

- The project is built in a container.
- The targets are copied to the host.
- Unit tests are executed.
- A docker image is published
- A github release is published.

Note that if one step fails, the others are not executed.

<!-- TOC --><a name="documentation"></a>
## Documentation

This project uses [Doxygen](https://www.doxygen.nl/) for documenting classes and
funtions. A html and latex version is available inside `./doc/`.

One can also generate the docs using the `doxygen` command in the project root.

<!-- TOC --><a name="error-handling"></a>
## Error handling

I mainly use **C++ exceptions** to handle errors, using the rule that libraries
should not handle them, just raising, threfore containing all the error handling
logic in the consumer targets.

<!-- TOC --><a name="design-patterns-idioms-and-general-considerations"></a>
## Design Patterns, idioms and general considerations

This project makes extensive use of
[RAII](https://en.wikipedia.org/wiki/Resource_acquisition_is_initialization) for
memory management. The basic idea of RAII is to allocate all resources that one
object needs in its initialization and free them when the object is not needed
anymore, e.g. when it goes out of scope. In C++ we can achieve that unsing the
object constructor and destructor coupled with the use of
[smart pointers](https://en.wikipedia.org/wiki/Smart_pointer). Also, I use some
of the **sane** idioms of OOP.

Also, this project is divided in a **shared library**, containing all the main
classes, functions and logics of the domain and in various consumer targets,
like the command line application, unit tests and benchmarks. Using this
pattern, I can make code more maintanable and extensive, e.g. if I want to add
another target(like a GUI one), I just import the needed classes from the lib. I
want to thanks the [Rust programming language](https://www.rust-lang.org/) for
teaching this useful pattern.
