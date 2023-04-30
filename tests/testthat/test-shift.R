test_that("shifting works", {
  expect_equal(shift_right(1:3), c(NA, 1:2))
  expect_equal(shift_left(1:3), c(2:3, NA))
})

test_that("can vary amount", {
  expect_equal(shift_right(1:3, 2), c(NA, NA, 1))
  expect_equal(shift_left(1:3, 2), c(3, NA, NA))
})

test_that("can set value used to fill shifted positions", {
  expect_equal(shift_right(1:3, 1, 1), c(1, 1, 1))
  expect_equal(shift_left(1:3, 1, 1), c(3, 1, 1))
})
