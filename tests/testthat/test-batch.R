test_that("batching works", {
  expect_equal(tabulate(batch(LETTERS, n = 4)), c(7, 7, 6, 6))
  expect_equal(tabulate(batch(LETTERS, n = 4, balance = FALSE)), c(7, 7, 7, 5))
  expect_equal(tabulate(batch(LETTERS, size = 10)), c(10, 10, 6))
  expect_equal(tabulate(batch(LETTERS, size = 10, balance = TRUE)), c(9, 9, 8))
})
