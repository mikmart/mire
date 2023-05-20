#' Find adjacent repeated elements in a vector
#'
#' Similarly to the Unix command `uniq`, find elements in a vector that are
#' not the same as the preceding value.
#'
#' @param x A vector.
#'
#' @returns A logical vector of `length(x)`.
#' @seealso [unfill()] to replace adjacent repeated elements.
#' @seealso [duplicated()] to find repeated elements regardless of adjacency.
#'
#' @examples
#' uniq(c(1, 1, 2, 1))
#' @export
uniq <- function(x) {
  if (length(x) == 0) return(logical())
  c(TRUE, head(x, -1L) != tail(x, -1L))
}
