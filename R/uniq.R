#' Drop adjacent repeated elements from a vector
#'
#' Similarly to the Unix command `uniq`, filter out elements in a vector that
#' are the same as the preceding value. `uniql` returns a logical vector that
#' can be used to identify them.
#'
#' @param x A vector.
#'
#' @returns For `uniq()`, the vector `x` with adjacent repeated elements
#'   removed. For `uniql()`, a logical vector of `length(x)`.
#' @seealso [unfill()] to replace adjacent repeated elements.
#' @seealso [unique()] and [duplicated()] to find repeated elements regardless
#'   of adjacency.
#' @seealso [rle()] to find lengths of adjacent repeated runs.
#'
#' @examples
#' uniq(c(1, 1, 2, 1))
#' uniql(c(1, 1, 2, 1))
#' @export
uniq <- function(x) {
  x[uniql(x)]
}

#' @rdname uniq
#' @importFrom utils head tail
#' @export
uniql <- function(x) {
  if (length(x) == 0) return(logical())
  c(TRUE, head(x, -1L) != tail(x, -1L))
}
