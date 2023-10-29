test_that("area of a single point is zero", {
  expect_equal(trapez(1, 2), 0)
})

test_that("area of two points is the area of the trapezoid", {
  expect_equal(trapez(c(0, 1), c(5, 8)), 5 * 1 + 1/2 * 3 * 1)
  expect_equal(trapez(c(0, 2), c(5, 8)), 5 * 2 + 1/2 * 3 * 2)
})

test_that("area of many points is the summed area of trapezoids", {
  expect_equal(trapez(0:2, 4:6), trapez(0:1, 4:5) + trapez(1:2, 5:6))
  expect_equal(trapez(0:3, 4:7), trapez(0:2, 4:6) + trapez(2:3, 6:7))
  expect_equal(trapez(c(0, 5, 6), c(1, 1, 0)), 5 * 1 + 1 * 1 * 1/2)
})

test_that("order of input sample points does not matter", {
  expect_equal(trapez(1:0, 3:2), trapez(0:1, 2:3))
})
