test_that("can find the gcd of integers", {
  expect_equal(gcd(c(48, 18)), 6)
})

test_that("missing values propagate", {
  expect_equal(gcd(c(NA, 2)), NA_integer_)
  expect_equal(gcd(c(2, NA)), NA_integer_)
})

test_that("can determine gcd == 1 even with missing values", {
  expect_equal(gcd(c(2, NA, 3)), 1)
})

test_that("zero length vectors return NA", {
  expect_equal(gcd(c()), NA_integer_)
})

test_that("zeroes are ignored", {
  expect_equal(gcd(c(2, 0, 3)), 1)
  expect_equal(gcd(c(0, 0, 0)), NA_integer_)
})
