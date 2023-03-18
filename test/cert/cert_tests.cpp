#include <fmt/color.h>
#include <fmt/format.h>
#include <gtest/gtest.h>
#include <libciphervault/cert.hpp>


TEST(Cert, test_test) {
  // Arrange
  const std::string actual = ciphervault::test();

  // Act
  const std::string expected = "test";

  // Expect
  EXPECT_EQ(actual, expected);
}
