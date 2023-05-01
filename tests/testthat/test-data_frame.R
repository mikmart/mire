test_that("data frame creation works", {
  expect_identical(
    new_data_frame(list(a = 1:2, b = 3:4), 2L),
    data.frame(a = 1:2, b = 3:4)
  )
})
