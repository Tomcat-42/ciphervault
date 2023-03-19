#include <openssl/asn1.h>
#include <openssl/bio.h>
#include <openssl/conf.h>
#include <openssl/err.h>
#include <openssl/pem.h>
#include <openssl/x509.h>

#include <libciphervault/cert.hpp>
#include <memory>
#include <string>

#include <iostream>

#include <tabulate/table.hpp>

namespace ciphervault {
  const auto bio_to_string = [](bio &bio, int size) {
    std::string str;
    str.resize(size);
    const int bytes_read = BIO_read(bio.get(), str.data(), size);
    if (bytes_read < 0) {
      ERR_print_errors_fp(stderr);
      throw std::runtime_error("Unable to read from BIO");
    }
    str.resize(bytes_read);
    return str;
  };

  cert::cert(const std::vector<unsigned char> &cert) {
    this->setup();

    ciphervault::bio cert_bio(BIO_new_mem_buf(cert.data(), cert.size()),
                              BIO_free);
    if (!(cert_bio.get())) {
      ERR_print_errors_fp(stderr);
      throw std::runtime_error("unable to open cert file");
    }

    // create x509 object and read cert into it
    ciphervault::x509 certificate(X509_new(), X509_free);
    if (!certificate) {
      ERR_print_errors_fp(stderr);
      throw std::runtime_error("Unable to create X509 object");
    }
    // init certificate
    this->certificate = std::move(certificate);

    // read cert into x509 object
    auto a = this->certificate.get();
    if (d2i_X509_bio(cert_bio.get(), &a) == nullptr) {
      ERR_print_errors_fp(stderr);
      throw std::runtime_error("Unable to read certificate from file");
    }
  }

  std::string cert::get_issuer() const {
    ciphervault::bio output(BIO_new(BIO_s_mem()), BIO_free);
    X509_NAME *issuer = X509_get_issuer_name(this->certificate.get());

    if (issuer == nullptr) {
      ERR_print_errors_fp(stderr);
      throw std::runtime_error("Unable to extract issuer from certificate");
    }

    X509_NAME_print_ex(output.get(), issuer, 0, 0);
    std::string cert_issuer = bio_to_string(output, 32768);
    return cert_issuer;
  }

  std::string cert::get_contents() const {
    ciphervault::bio output(BIO_new(BIO_s_mem()), BIO_free);
    X509_print_ex(output.get(), this->certificate.get(), 0, 0);
    std::string cert_details = bio_to_string(output, 32768);
    return cert_details;
  }

  std::string cert::get_subject() const {
    X509_NAME *subject = X509_get_subject_name(this->certificate.get());

    if (subject == nullptr) {
      ERR_print_errors_fp(stderr);
      throw std::runtime_error("Unable to extract subject from certificate");
    }

    ciphervault::bio output(BIO_new(BIO_s_mem()), BIO_free);
    X509_NAME_print_ex(output.get(), subject, 0, 0);
    std::string cert_subject = bio_to_string(output, 4096);
    return cert_subject;
  }

  std::string cert::get_not_before() const {
    // extract validity period
    ASN1_TIME *not_before = X509_get_notBefore(this->certificate.get());
    if (not_before == nullptr) {
      ERR_print_errors_fp(stderr);
      throw std::runtime_error("Unable to extract notBefore from certificate");
    }

    ciphervault::bio output(BIO_new(BIO_s_mem()), BIO_free);
    ASN1_TIME_print(output.get(), not_before);

    std::string not_before_str = bio_to_string(output, 4096);

    return not_before_str;
  }

  std::string cert::get_not_after() const {
    // extract validity period
    ASN1_TIME *not_after = X509_get_notAfter(this->certificate.get());
    if (not_after == nullptr) {
      ERR_print_errors_fp(stderr);
      throw std::runtime_error("Unable to extract notAfter from certificate");
    }

    ciphervault::bio output(BIO_new(BIO_s_mem()), BIO_free);
    ASN1_TIME_print(output.get(), not_after);

    std::string not_after_str = bio_to_string(output, 4096);

    return not_after_str;
  }

  std::string cert::get_signature_algorithm() const {
    // extract signature algorithm
    const X509_ALGOR *signature_algorithm =
        X509_get0_tbs_sigalg(this->certificate.get());
    if (signature_algorithm == nullptr) {
      ERR_print_errors_fp(stderr);
      throw std::runtime_error(
          "Unable to extract signature algorithm from certificate");
    }
    ciphervault::bio output(BIO_new(BIO_s_mem()), BIO_free);
    std::string signature_algorithm_str = bio_to_string(output, 4096);
    return signature_algorithm_str;
  }

  // << operator overload for cert
  std::ostream &operator<<(std::ostream &os, const cert &c) {
    tabulate::Table table;
    table.add_row({"Issuer", c.get_issuer()});
    table.add_row({"Subject", c.get_subject()});
    table.add_row({"Not Before", c.get_not_before()});
    table.add_row({"Not After", c.get_not_after()});
    // table.add_row({"Signature Algorithm", c.get_signature_algorithm()});
    table.format()
        .font_style({tabulate::FontStyle::bold})
        .font_align(tabulate::FontAlign::center)
        .font_color(tabulate::Color::white)
        .border_color(tabulate::Color::white)
        .corner_color(tabulate::Color::white);

    return os << table;
  }

  // >> operator overload for cert. The stream must be a vector of bytes
  std::istream &operator>>(std::istream &is, cert &c) {
    std::vector<unsigned char> cert_bytes((std::istreambuf_iterator<char>(is)),
                                          std::istreambuf_iterator<char>());
    c = cert(cert_bytes);
    return is;
  }

  cert::~cert() { this->cleanup(); }

  void cert::setup() {
    OpenSSL_add_all_algorithms();
    ERR_load_crypto_strings();
    ERR_clear_error();
    OPENSSL_no_config();
  }

  void cert::cleanup() {
    CONF_modules_unload(1);
    CONF_modules_free();
    ERR_free_strings();
    EVP_cleanup();
    CRYPTO_cleanup_all_ex_data();
  }
} // namespace ciphervault
