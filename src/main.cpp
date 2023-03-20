#include <openssl/asn1.h>
#include <openssl/bio.h>
#include <openssl/conf.h>
#include <openssl/err.h>
#include <openssl/pem.h>
#include <openssl/x509.h>

#include <cipher/cert.hpp>
#include <cstddef>
#include <fstream>
#include <iostream>
#include <memory>
#include <sstream>
#include <stdexcept>
#include <string>
#include <string_view>
#include <vector>

#include <cxxopts.hpp>

int main(int argc, const char **argv) {
  cxxopts::Options options("ciphervault",
                           "ciphervault --  A x509 DER digital certificates "
                           "wrapper library and comman line application.");

  // clang-format off
    options.add_options()
    ("f,filename", "The certificate file to parse.", cxxopts::value<std::string>())
    ("c,contents", "Print the contents of the certificate.")
    ("i,issuer", "Print the issuer of the certificate.")
    ("s,subject", "Print the subject of the certificate.")
    ("b,notbefore", "Print the not before date of the certificate.")
    ("a,notafter", "Print the not after date of the certificate.")
    ("g,sigalg", "Print the signature algorithm of the certificate.")
    ("t, table", "Print the certificate in a table.")
    ("h,help", "Print this help message.");
  // clang-format on

  options.parse_positional({"filename"});
  auto result = options.parse(argc, argv);

  if (result.count("help") || !result.count("filename")) {
    std::cout << options.help() << std::endl;
    exit(0);
  }

  // try to open the file
  std::ifstream file(result["filename"].as<std::string>());
  if (!file.is_open()) {
    std::cerr << "Could not open file: " << result["filename"].as<std::string>()
              << std::endl;
    exit(1);
  }
  std::vector<unsigned char> buffer((std::istreambuf_iterator<char>(file)),
                                    std::istreambuf_iterator<char>());

  // try to load the certificate
  cipher::cert cert;
  try {
    cert = cipher::cert{buffer};
  } catch (const std::runtime_error &e) {
    std::cerr << "Could not parse certificate: " << e.what() << std::endl;
    exit(1);
  }

  if (result.count("contents")) {
    std::string res;
    try {
      res = cert.get_contents();
    } catch (const std::runtime_error &e) {
      std::cerr << "Could not get contents: " << e.what() << std::endl;
      exit(1);
    }

    std::cout << res << std::endl;
  }

  if (result.count("issuer")) {
    std::string res;
    try {
      res = cert.get_issuer();
    } catch (const std::runtime_error &e) {
      std::cerr << "Could not get issuer: " << e.what() << std::endl;
      exit(1);
    }

    std::cout << res << std::endl;
  }

  if (result.count("subject")) {
    std::string res;
    try {
      res = cert.get_subject();
    } catch (const std::runtime_error &e) {
      std::cerr << "Could not get subject: " << e.what() << std::endl;
      exit(1);
    }

    std::cout << res << std::endl;
  }

  if (result.count("notbefore")) {
    std::string res;
    try {
      res = cert.get_not_before();
    } catch (const std::runtime_error &e) {
      std::cerr << "Could not get not before: " << e.what() << std::endl;
      exit(1);
    }

    std::cout << res << std::endl;
  }

  if (result.count("notafter")) {
    std::string res;
    try {
      res = cert.get_not_after();
    } catch (const std::runtime_error &e) {
      std::cerr << "Could not get not after: " << e.what() << std::endl;
      exit(1);
    }

    std::cout << res << std::endl;
  }

  if (result.count("sigalg")) {
    std::string res;
    try {
      res = cert.get_signature_algorithm();
    } catch (const std::runtime_error &e) {
      std::cerr << "Could not get signature algorithm: " << e.what()
                << std::endl;
      exit(1);
    }

    std::cout << res << std::endl;
  }

  if (result.count("table")) {
    std::stringstream s;
    try {
      s << cert;
    } catch (const std::runtime_error &e) {
      std::cerr << "Could not get table: " << e.what() << std::endl;
      exit(1);
    }

    std::cout << s.rdbuf() << std::endl;
  }

  return 0;
}
