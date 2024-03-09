test_that("can find the gcd of integers", {
  expect_equal(gcd(c(48, 18)), 6)
})

test_that("can find the gcd of floats", {
  expect_equal(gcd(c(1.5, 0.5)), 0.5)
})

test_that("missing values propagate", {
  expect_equal(gcd(c(1, NA)), NA_real_)
})

test_that("zero length vectors return NA", {
  expect_equal(gcd(c()), NA_real_)
})
