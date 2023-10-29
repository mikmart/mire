#' Permute the order of elements in an object
#'
#' A generic function to generate a random permutation of an object. The default
#' method is equivalent to `sample(x)` without surprises for numeric vectors of
#' length 1. The `data.frame` method permutes the order of rows.
#'
#' @param x A vector or data frame.
#' @param ... Additional arguments passed on to methods.
#'
#' @returns The object `x` with elements permuted in a random order.
#' @seealso [sample()] for general purpose random sampling.
#' @family sampling helpers
#'
#' @examples
#' permute(1:5)
#' permute(5) # Compare to sample(5)
#'
#' # The data.frame method permutes rows
#' permute(iris) |> head()
#' @export
permute <- function(x, ...) {
  UseMethod("permute")
}

#' @export
permute.default <- function(x, ...) {
  x[sample.int(length(x))]
}

#' @rdname permute
#' @export
permute.data.frame <- function(x, ...) {
  x[sample.int(nrow(x)), , drop = FALSE]
}
