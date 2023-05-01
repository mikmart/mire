test_that("can bind variables", {
  expect_equal(let(x = 1, x), 1)
  expect_equal(let(x = 1, y = 2, x + y), 3)
})

test_that("interaction with calling scope works", {
  a <- 42
  expect_equal(let(a), a)
  expect_equal(let(x = 1, x + a), 1 + a)
  expect_equal(let(x = 1, a = 2, x + a), 1 + 2)
  expect_equal(let(x = a, a = 2, x + a), a + 2)
})

test_that("can refer to variables sequentially", {
  expect_equal(let(x = 2, y = x + 3, y * y), 25)
  expect_equal(let(x = 2, x = x + 3, x * x), 25)
})

test_that("unnamed dots signal reasonable error", {
  expect_snapshot(let(x = 1, y <- 2, x + y), error = TRUE)
})

test_that("can't access variables from internal scope", {
  expect_snapshot(let(nams), error = TRUE)
})
