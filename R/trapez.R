#' Trapezoidal integration
#'
#' Find the area under a curve of sample points with the trapezoidal rule.
#'
#' @param x,y Numeric vectors giving the coordinates of the sample points.
#'
#' @returns The scalar numeric integral value.
#' @seealso [integrate()] for general-purpose numeric integration.
#'
#' @examples
#' trapez(c(0, 1, 2), c(1, 5, 3))
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
