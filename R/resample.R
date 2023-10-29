#' Sample elements from an object with replacement
#'
#' A generic function to draw elements from an object with replacement. The
#' default method is equivalent to `sample(x, replace = TRUE)` without surprises
#' for numeric vectors of length 1. The `data.frame` method resamples rows.
#'
#' @param x A vector or data frame.
#' @param size A positive integer. The number of elements to sample.
#' @param prob A numeric vector of sampling probability weights for each element
#'   in `x`.
#' @param ... Additional arguments passed on to methods.
#'
#' @returns An object with `size` elements drawn from `x` with replacement.
#' @seealso [sample()] for general purpose random sampling.
#' @family sampling helpers
#'
#' @examples
#' resample(1:5)
#' resample(5) # Compare to sample(5, replace = TRUE)
#'
#' # The data.frame method samples rows
#' head(iris) |> resample()
#' @export
resample <- function(x, size = length(x), prob = NULL, ...) {
  UseMethod("resample")
}

#' @export
resample.default <- function(x, size = length(x), prob = NULL, ...) {
  x[sample.int(length(x), size, replace = TRUE, prob = prob)]
}

#' @rdname resample
#' @export
resample.data.frame <- function(x, size = nrow(x), prob = NULL, ...) {
  x[sample.int(nrow(x), size, replace = TRUE, prob = prob), , drop = FALSE]
}
