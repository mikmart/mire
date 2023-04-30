test_that("unfilling works", {
  expect_equal(unfill(c(1, 1, 2)), c(1, NA, 2))
})

test_that("missing values break runs", {
  expect_equal(unfill(c(1, NA, 1, 2)), c(1, NA, 1, 2))
})
