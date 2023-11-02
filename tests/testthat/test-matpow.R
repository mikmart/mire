test_that("raising to a power works", {
  X <- matrix(1:4, 2, 2)
  expect_equal(matpow(X, 1), X)
  expect_equal(matpow(X, 2), X %*% X)
  expect_equal(matpow(X, 3), X %*% X %*% X)
})

test_that("power of zero returns identity", {
  X <- matrix(1:4, 2, 2)
  I <- diag(2)
  expect_equal(matpow(X, 0), I)
})

test_that("negative powers invert", {
  X <- matrix(1:4, 2, 2)
  Xinv <- solve(X)
  expect_equal(matpow(X, -1), Xinv)
  expect_equal(matpow(X, -2), Xinv %*% Xinv)
})

test_that("non-integer powers signal error", {
  X <- matrix(1:4, 2, 2)
  expect_error(matpow(X, 0.5))
})
