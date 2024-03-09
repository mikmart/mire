#' Find the greatest common divisor
#'
#' Find the greatest common divisor of all values in a numeric vector by
#' repeated application of the Euclidean algorithm over all elements.
#'
#' `x` is coerced to a numeric vector if possible.
#'
#' @param x A numeric vector.
#' @returns A numeric vector of length 1.
#'
#' @examples
#' gcd(c(48, 18, 39))
#' @export
gcd <- function(x) {
  .Call(ffi_gcd, as.double(x))
}
