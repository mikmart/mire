test_that("replacing with predicate function works", {
  expect_equal(replace_if(c(1, NA, 3), is.na, 42), c(1, 42, 3))
})

test_that("passing a non-function predicate gives a reasonable error", {
  expect_snapshot(replace_if(c(1, NA, 3), 2, 42), error = TRUE)
})
