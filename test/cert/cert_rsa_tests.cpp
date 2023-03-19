#include <gtest/gtest.h>
#include <libciphervault/cert.hpp>

#include <assets/cert/rsa/rsa_1024b.hpp>
#include <assets/cert/rsa/rsa_16k.hpp>
#include <assets/cert/rsa/rsa_2048b.hpp>
#include <assets/cert/rsa/rsa_32k.hpp>
#include <assets/cert/rsa/rsa_4096b.hpp>
#include <assets/cert/rsa/rsa_512b.hpp>
#include <assets/cert/rsa/rsa_8192b.hpp>
#include <assets/cert/rsa/rsa_999b.hpp>

// Test CertRsa fixture
class CertRsaTest : public ::testing::Test {
protected:
  const ciphervault::cert cert_rsa_512b{
      assets_cert_rsa_512b_rsa_example_cert_der};
  const ciphervault::cert cert_rsa_999b{
      assets_cert_rsa_999b_rsa_example_cert_der};
  const ciphervault::cert cert_rsa_1024b{
      assets_cert_rsa_1024b_rsa_example_cert_der};
  const ciphervault::cert cert_rsa_2048b{
      assets_cert_rsa_2048b_rsa_example_cert_der};
  const ciphervault::cert cert_rsa_4096b{
      assets_cert_rsa_4096b_rsa_example_cert_der};
  const ciphervault::cert cert_rsa_8192b{
      assets_cert_rsa_8192b_rsa_example_cert_der};
  const ciphervault::cert cert_rsa_16k{
      assets_cert_rsa_16k_rsa_example_cert_der};
  const ciphervault::cert cert_rsa_32k{
      assets_cert_rsa_32k_rsa_example_cert_der};

  const std::string expected_subject{
      "C=JP, ST=Tokyo, O=Frank4DD, CN=www.example.com"};
  const std::string expected_issuer{
      "C=JP, ST=Tokyo, L=Chuo-ku, O=Frank4DD, OU=WebCert Support, CN=Frank4DD "
      "Web CA/emailAddress=support@frank4dd.com"};

  void SetUp() override {}
};

TEST_F(CertRsaTest, test_cert_rsa_512b) {
  // Arrange
  const std::string actual_subject = cert_rsa_512b.get_subject();
  const std::string actual_issuer = cert_rsa_512b.get_issuer();

  // Act
  const bool result = (actual_issuer == expected_issuer) &&
                      (actual_subject == expected_subject);

  // Expect
  EXPECT_TRUE(result);
}

TEST_F(CertRsaTest, test_cert_rsa_999b) {
  // Arrange
  const std::string actual_subject = cert_rsa_999b.get_subject();
  const std::string actual_issuer = cert_rsa_999b.get_issuer();

  // Act
  const bool result = (actual_issuer == expected_issuer) &&
                      (actual_subject == expected_subject);

  // Expect
  EXPECT_FALSE(result);
}

TEST_F(CertRsaTest, test_cert_rsa_1024b) {
  // Arrange
  const std::string actual_subject = cert_rsa_1024b.get_subject();
  const std::string actual_issuer = cert_rsa_1024b.get_issuer();

  // Act
  const bool result = (actual_issuer == expected_issuer) &&
                      (actual_subject == expected_subject);

  // Expect
  EXPECT_TRUE(result);
}

TEST_F(CertRsaTest, test_cert_rsa_2048b) {
  // Arrange
  const std::string actual_subject = cert_rsa_2048b.get_subject();
  const std::string actual_issuer = cert_rsa_2048b.get_issuer();

  // Act
  const bool result = (actual_issuer == expected_issuer) &&
                      (actual_subject == expected_subject);

  // Expect
  EXPECT_TRUE(result);
}

TEST_F(CertRsaTest, test_cert_rsa_4096b) {
  // Arrange
  const std::string actual_subject = cert_rsa_4096b.get_subject();
  const std::string actual_issuer = cert_rsa_4096b.get_issuer();

  // Act
  const bool result = (actual_issuer == expected_issuer) &&
                      (actual_subject == expected_subject);

  // Expect
  EXPECT_TRUE(result);
}

TEST_F(CertRsaTest, test_cert_rsa_8192b) {
  // Arrange
  const std::string actual_subject = cert_rsa_8192b.get_subject();
  const std::string actual_issuer = cert_rsa_8192b.get_issuer();

  // Act
  const bool result = (actual_issuer == expected_issuer) &&
                      (actual_subject == expected_subject);

  // Expect
  EXPECT_TRUE(result);
}

TEST_F(CertRsaTest, test_cert_rsa_16k) {
  // Arrange
  const std::string actual_subject = cert_rsa_16k.get_subject();
  const std::string actual_issuer = cert_rsa_16k.get_issuer();

  // Act
  const bool result = (actual_issuer == expected_issuer) &&
                      (actual_subject == expected_subject);

  // Expect
  EXPECT_TRUE(result);
}

TEST_F(CertRsaTest, test_cert_rsa_32k) {
  // Arrange
  const std::string actual_subject = cert_rsa_32k.get_subject();
  const std::string actual_issuer = cert_rsa_32k.get_issuer();

  // Act
  const bool result = (actual_issuer == expected_issuer) &&
                      (actual_subject == expected_subject);

  // Expect
  EXPECT_TRUE(result);
}
