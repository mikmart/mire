test_that("shifting works", {
  expect_equal(shift_right(1:3), c(NA, 1:2))
  expect_equal(shift_left(1:3), c(2:3, NA))
})

test_that("can vary amount", {
  expect_equal(shift_right(1:3, 2), c(NA, NA, 1))
  expect_equal(shift_left(1:3, 2), c(3, NA, NA))
})

test_that("zero shift is a no-op", {
  x <- 1:3
  expect_equal(shift_right(x, 0), x)
  expect_equal(shift_left(x, 0), x)
})

test_that("can set value used to fill shifted positions", {
  expect_equal(shift_right(1:3, fill = 42), c(42, 1, 2))
  expect_equal(shift_left(1:3, fill = 42), c(2, 3, 42))
})
