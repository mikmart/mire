#' Integer powers of a square matrix
#'
#' Raise a square matrix to an integer power using exponentiation by squaring.
#' A power of zero results in the identity matrix of matching dimensions.
#' Negative powers operate on the inverse.
#'
#' @param x A numeric matrix.
#' @param n An integer power.
#'
#' @returns A square matrix.
#' @seealso [solve()] to invert a matrix.
#'
#' @examples
#' matrix(1:4, 2, 2) %^% 2
#' matrix(1:4, 2, 2) %^% 1
#' matrix(1:4, 2, 2) %^% 0
#'
#' # Negative powers invert
#' matrix(1:4, 2, 2) %^% -1
#' @name matpow
#' @export
`%^%` <- function(x, n) {
  x <- as.matrix(x)
  n <- as.integer(n)
  if (n < 0) {
    solve(x) %^% -n
  } else if (n == 0) {
    diag(1, nrow(x))
  } else if (n == 1) {
    x
  } else {
    odd <- n %% 2
    res <- x
    while (n > 1) {
      n <- n %/% 2
      res <- res %*% res
    }
    if (odd) res %*% x else res
  }
}

#' @rdname matpow
#' @export
matpow <- function(x, n) x %^% n
