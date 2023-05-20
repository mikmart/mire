test_that("zero length inputs give zero length outputs", {
  expect_equal(uniq(numeric()), logical())
})
