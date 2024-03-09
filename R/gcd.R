#' Find the greatest common divisor
#'
#' Find the greatest common divisor of all values in an integer vector by
#' repeated application of the Euclidean algorithm over all elements.
#'
#' `x` is coerced to an integer vector if possible.
#'
#' @param x An integer vector.
#' @returns An integer vector of length 1.
#'
#' @examples
#' gcd(c(48, 18, 39))
#' @export
gcd <- function(x) .Call(ffi_gcd, as.integer(x))
