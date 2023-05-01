#' Replace repeated elements in a vector
#'
#' @param x A vector.
#' @param value A replacement value of length 1.
#'
#' @returns The vector `x` with adjacent repeated elements replaced with `value`.
#' @seealso [tidyr::fill()] and [vctrs::vec_fill_missing()] for the reverse operation.
#' @seealso [rle()] to find runs of repeated elements.
#'
#' @examples
#' unfill(rep(1:3, 2:4))
#' unfill(rep(c("A", "B"), 3:4), "")
#'
#' # Unfilling can clarify row grouping in a quick display
#' x <- expand_grid(
#'   foo = c("A", "B"),
#'   bar = c("a", "b", "c"),
#'   baz = c(1, 2)
#' )
#' x[] <- map(unfill, x, "")
#' x
#' @export
unfill <- function(x, value = NA) {
  stopifnot(length(value) == 1L)
  replace(x, c(FALSE, head(x, -1L) == tail(x, -1L)), value)
}
