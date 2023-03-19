#pragma once

#include <memory>
#include <openssl/bio.h>
#include <openssl/ssl.h>
#include <openssl/x509.h>
#include <string>
#include <vector>

namespace ciphervault {
  std::string test();

  // Smart pointers wrappers => RAII
  using bio = std::unique_ptr<BIO, decltype(&BIO_free)>;
  using x509 = std::unique_ptr<X509, decltype(&X509_free)>;
  using asn1_time = std::unique_ptr<ASN1_TIME, decltype(&ASN1_STRING_free)>;

  /**
   * @brief A class to represent a x509 DER certificate
   *
   * This class is a wrapper around the OpenSSL x509 structure. It provides
   * methods to get the details of the certificate.
   * */
  class cert {
  private:
    /**
     * @brief The in-memory representation of the certificate
     * */
    ciphervault::x509 certificate = {nullptr, nullptr};

    /**
     * @brief Initialize the OpenSSL library
     * */
    void setup();

    /**
     * @brief Cleanup the OpenSSL library
     * */
    void cleanup();

  public:
    cert() = default;
    cert(const cert &) = delete;
    cert(cert &&) = default;
    cert &operator=(const cert &) = delete;
    cert &operator=(cert &&) = default;

    /**
     * @brief Construct a new cert object from a vector of chars
     * @param cert The certificate in DER format as a vector of chars
     * */
    explicit cert(const std::vector<unsigned char> &cert);

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
