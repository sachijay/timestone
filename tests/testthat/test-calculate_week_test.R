# This file conducts formal tests for the functions
# in the package.In general, correct and incorrect
# inputs are given to observe the function behaviour.
test_that("calculate_week testing", {
  x <- c("2020-01-10", "2020-02-10")

  # Test for a correct input
  expect_equal(calculate_week(x,
                              start_date = "2020-01-15"),
               c(-1,3))

  # Test for error handling for incorrect inputs
  expect_error(calculate_week(x,
                              start_date = 10))
  expect_error(calculate_week(letters,
                              start_date = "2020-01-15"))

})
