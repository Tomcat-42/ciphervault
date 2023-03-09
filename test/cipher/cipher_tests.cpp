#include <fmt/color.h>
#include <fmt/format.h>
#include <gtest/gtest.h>
#include <libciphervault/cipher.hpp>


TEST(Cipher, test_test) {
  // Arrange
  const std::string actual = ciphervault::test();

  // Act
  const std::string expected = "test";

  // Expect
  EXPECT_EQ(actual, expected);
}
