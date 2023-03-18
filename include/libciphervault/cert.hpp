#pragma once

#include <memory>
#include <openssl/bio.h>
#include <openssl/ssl.h>
#include <openssl/x509.h>
#include <string>

namespace ciphervault {
  std::string test();

  // Smart pointers wrappers => RAII
  using bio = std::unique_ptr<BIO, decltype(&BIO_free)>;
  using x509 = std::unique_ptr<X509, decltype(&X509_free)>;
  using asn1_time = std::unique_ptr<ASN1_TIME, decltype(&ASN1_STRING_free)>;

  /**
   * @brief A class to represent a x509 DER certificate
   * */
  class cert {
  private:
    /**
     * @brief The in-memory representation of the certificate
     * */
    ciphervault::x509 certificate = {nullptr, nullptr};
    void setup();
    void cleanup();

  public:
    cert() = delete;
    cert(const cert &) = delete;
    cert(cert &&) = delete;
    cert &operator=(const cert &) = delete;
    cert &operator=(cert &&) = delete;

    /**
     * @brief Construct a new cert object from a string
     * @param cert The string to construct the certificate from
     * */
    explicit cert(std::string const &cert_content);

    ~cert();

    /**
     * @brief Get all the details of the certificate
     * @return std::string The subject name of the certificate
     * */
    std::string get_contents() const;

    /**
     * @brief Get the issuer name of the certificate
     * @return std::string The signature algorithm of the certificate
     * */
    std::string get_issuer() const;

    /**
     * @brief Get the subject name of the certificate
     * @return std::string The subject name of the certificate
     * */
    std::string get_subject() const;

    /**
     * @brief Get the not before date of the certificate
     * @return std::string The issuer name of the certificate
     * */
    std::string get_not_before() const;

    /**
     * @brief Get the not after date of the certificate
     * @return std::string The issuer name of the certificate
     * */
    std::string get_not_after() const;

    /**
     * @brief Get the signature algorithm of the certificate
     * @return std::string The signature algorithm of the certificate
     * */
    std::string get_signature_algorithm() const;
  };
} // namespace ciphervault
