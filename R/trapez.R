#' Trapezoidal integration
#'
#' Find the area under a curve of sample points with the trapezoidal rule.
#'
#' `x` and `y` are sorted by `x` if needed.
#'
#' @param x,y Numeric vectors giving the coordinates of the sample points.
#'
#' @returns A numeric vector of length 1.
#' @seealso [integrate()] for general-purpose numeric integration.
#'
#' @examplesIf getRversion() >= 4.3
#' trapez(c(0, 1, 2), c(1, 2, 0))
#'
#' # Calculate AUC for each subject in the Indometh dataset.
#' Indometh |> by(~ Subject, with, trapez(time, conc))
#' @export
trapez <- function(x, y) {
  stopifnot(length(x) == length(y))
  if (is.unsorted(x)) {
    i <- order(x)
    x <- x[i]
    y <- y[i]
  }
  n <- length(x)
  a <- x[-n]
  b <- x[-1]
  dx <- b - a
  fa <- y[-n]
  fb <- y[-1]
  sum((fa + fb) / 2 * dx)
}
