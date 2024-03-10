#' Find the greatest common divisor
#'
#' Find the greatest common divisor of all values in an integer vector by
#' repeated application of the Euclidean algorithm.
#'
#' `x` is coerced to an integer vector if possible.
#'
#' Zeroes are ignored. Evaluation short-circuits if the greatest common divisor
#' of non-missing elements reaches 1.
#'
#' @section Why?:
#'
#'   Whenever I need GCD, I always seem to need `Reduce(pracma::gcd, x)`,
#'   so I wanted an efficient version of that. Additionally, being limited to
#'   integers avoids issues with floating point arithmetic, and allows
#'   short-circuiting and special handling of missing values when it comes to
#'   GCD of 1.
#'
#' @param x An integer vector.
#' @returns A positive-valued integer vector of length 1. The value is `1` if
#'   the GCD of non-missing elements is 1. The value is `NA` if there are any
#'   missing values _and_ the GCD of non-missing elements is greater than 1,
#'   if `x` has length 0, or if there are no non-zero values.
#'
#' @examples
#' gcd(c(48, 18, 33))
#' gcd(c(48, NA, 33))
#' gcd(c(48, NA, 31))
#' @export
gcd <- function(x) .Call(ffi_gcd, as.integer(x))
