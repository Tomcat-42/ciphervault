#include <fmt/format.h>
#include <openssl/asn1.h>
#include <openssl/bio.h>
#include <openssl/conf.h>
#include <openssl/err.h>
#include <openssl/pem.h>
#include <openssl/x509.h>

#include <cstddef>
#include <fstream>
#include <iostream>
#include <libciphervault/cert.hpp>
#include <memory>
#include <stdexcept>
#include <string>
#include <string_view>
#include <vector>

int main(int argc, const char **argv) {
  if (argc < 2) {
    fmt::print("Usage: {} <cert_file>\n", argv[0]);
    return 1;
  }

  const char *filename = argv[1];

  // Read the certificate to a std::vector<std::byte>
  std::ifstream file(filename, std::ios::binary);
  if (!file.is_open()) {
    fmt::print("Failed to open file: {}\n", filename);
    return 1;
  }
  std::vector<char> cert_data((std::istreambuf_iterator<char>(file)),
                              std::istreambuf_iterator<char>());

  ciphervault::cert cert(cert_data);

  std::cout << cert.get_contents() << std::endl;
  std::cout << cert.get_subject() << std::endl;
  std::cout << cert.get_issuer() << std::endl;
  std::cout << cert.get_not_before() << std::endl;
  std::cout << cert.get_not_after() << std::endl;
  std::cout << cert.get_signature_algorithm() << std::endl;

  return 0;
}
