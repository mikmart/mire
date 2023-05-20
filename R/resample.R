#' Sample a vector with replacement
#'
#' @inheritParams base::sample
#'
#' @returns A vector of length `size` with elements drawn from `x` or---if `x`
#'   is a positive number with length 1---from the integers `1:x`.
#' @seealso [sample()] which this (extremely) thinly wraps.
#'
#' @examples
#' resample(1:5)
#' @export
resample <- function(x, size, prob = NULL) {
  sample(x, size, replace = TRUE, prob = prob)
}
