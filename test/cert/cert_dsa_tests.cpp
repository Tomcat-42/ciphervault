#include <fmt/color.h>
#include <fmt/format.h>
#include <fstream>
#include <gtest/gtest.h>
#include <libciphervault/cert.hpp>

#include <assets/cert/dsa/dsa_1024b.hpp>
#include <assets/cert/dsa/dsa_16k.hpp>
#include <assets/cert/dsa/dsa_2048b.hpp>
#include <assets/cert/dsa/dsa_4096b.hpp>
#include <assets/cert/dsa/dsa_512b.hpp>
#include <assets/cert/dsa/dsa_8192b.hpp>

// Test Certdsa fixture
class CertdsaTest : public ::testing::Test {
protected:
  const ciphervault::cert cert_dsa_512b{
      assets_cert_dsa_512b_dsa_example_cert_der};
  const ciphervault::cert cert_dsa_1024b{
      assets_cert_dsa_1024b_dsa_example_cert_der};
  const ciphervault::cert cert_dsa_2048b{
      assets_cert_dsa_2048b_dsa_example_cert_der};
  const ciphervault::cert cert_dsa_4096b{
      assets_cert_dsa_4096b_dsa_example_cert_der};
  const ciphervault::cert cert_dsa_8192b{
      assets_cert_dsa_8192b_dsa_example_cert_der};
  const ciphervault::cert cert_dsa_16k{
      assets_cert_dsa_16k_dsa_example_cert_der};

  const std::string expected_subject{
      "C=JP, ST=Tokyo, O=Frank4DD, CN=www.example.com"};
  const std::string expected_issuer{
      "C=JP, ST=Tokyo, L=Chuo-ku, O=Frank4DD, OU=WebCert Support, CN=Frank4DD "
      "Web CA/emailAddress=support@frank4dd.com"};

  void SetUp() override {}
};

TEST_F(CertdsaTest, test_cert_dsa_512b) {
  // Arrange
  const std::string actual_subject = cert_dsa_512b.get_subject();
  const std::string actual_issuer = cert_dsa_512b.get_issuer();

  // Act
  const bool result = (actual_issuer == expected_issuer) &&
                      (actual_subject == expected_subject);

  // Expect
  EXPECT_TRUE(result);
}

TEST_F(CertdsaTest, test_cert_dsa_1024b) {
  // Arrange
  const std::string actual_subject = cert_dsa_1024b.get_subject();
  const std::string actual_issuer = cert_dsa_1024b.get_issuer();

  // Act
  const bool result = (actual_issuer == expected_issuer) &&
                      (actual_subject == expected_subject);

  // Expect
  EXPECT_TRUE(result);
}

TEST_F(CertdsaTest, test_cert_dsa_2048b) {
  // Arrange
  const std::string actual_subject = cert_dsa_2048b.get_subject();
  const std::string actual_issuer = cert_dsa_2048b.get_issuer();

  // Act
  const bool result = (actual_issuer == expected_issuer) &&
                      (actual_subject == expected_subject);

  // Expect
  EXPECT_TRUE(result);
}

TEST_F(CertdsaTest, test_cert_dsa_4096b) {
  // Arrange
  const std::string actual_subject = cert_dsa_4096b.get_subject();
  const std::string actual_issuer = cert_dsa_4096b.get_issuer();

  // Act
  const bool result = (actual_issuer == expected_issuer) &&
                      (actual_subject == expected_subject);

  // Expect
  EXPECT_TRUE(result);
}

TEST_F(CertdsaTest, test_cert_dsa_8192b) {
  // Arrange
  const std::string actual_subject = cert_dsa_8192b.get_subject();
  const std::string actual_issuer = cert_dsa_8192b.get_issuer();

  // Act
  const bool result = (actual_issuer == expected_issuer) &&
                      (actual_subject == expected_subject);

  // Expect
  EXPECT_TRUE(result);
}

TEST_F(CertdsaTest, test_cert_dsa_16k) {
  // Arrange
  const std::string actual_subject = cert_dsa_16k.get_subject();
  const std::string actual_issuer = cert_dsa_16k.get_issuer();

  // Act
  const bool result = (actual_issuer == expected_issuer) &&
                      (actual_subject == expected_subject);

  // Expect
  EXPECT_TRUE(result);
}
