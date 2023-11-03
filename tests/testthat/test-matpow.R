test_that("raising to a power works", {
  X <- matrix(1:4, 2, 2)
  expect_equal(X %^% 1, X)
  expect_equal(X %^% 2, X %*% X)
  expect_equal(X %^% 3, X %*% X %*% X)
})

test_that("power of zero returns identity", {
  expect_equal(matrix(1:4, 2) %^% 0, diag(2))
})

test_that("negative powers invert", {
  X <- matrix(1:4, 2, 2)
  Xinv <- solve(X)
  expect_equal(X %^% -1, Xinv)
  expect_equal(X %^% -2, Xinv %*% Xinv)
})

test_that("non-integer powers signal error", {
  expect_error(matrix(1:4, 2, 2) %^% 0.5)
})
