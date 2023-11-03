test_that("batching works", {
  expect_equal(tabulate(batch(LETTERS, n = 4)), c(7, 7, 6, 6))
  expect_equal(tabulate(batch(LETTERS, n = 4, balance = FALSE)), c(7, 7, 7, 5))
  expect_equal(tabulate(batch(LETTERS, size = 10)), c(10, 10, 6))
  expect_equal(tabulate(batch(LETTERS, size = 10, balance = TRUE)), c(9, 9, 8))
})

test_that("data frames are batched by rows", {
  expect_equal(tabulate(batch(iris, 2)), c(75, 75))
})

test_that("signals appropriate errors for invalid input combinations", {
  expect_snapshot(error = TRUE, batch(LETTERS))
  expect_snapshot(error = TRUE, batch(LETTERS, n = 2, size = 2))
})
