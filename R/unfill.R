#' Replace repeated elements in a vector
#'
#' @param x A vector.
#' @param value A replacement value of length 1.
#'
#' @returns The vector `x` with adjacent repeated elements replaced with `value`.
#' @seealso [rle()] to find runs of repeated elements.
#' @seealso [tidyr::fill()] and [vctrs::vec_fill_missing()] for the reverse operation.
#'
#' @examples
#' unfill(rep(1:3, 2:4))
#' unfill(rep(c("A", "B"), 3:4), "")
#'
#' # Unfilling data frames can clarify grouping in a quick display
#' x <- expand_grid(
#'   foo = c("A", "B"),
#'   bar = c("a", "b", "c"),
#'   baz = c(1, 2)
#' )
#' x[] <- map(unfill, x, "")
#' x
#' @export
unfill <- function(x, value = NA) {
  stopifnot(length(value) == 1)
  replace(x, c(FALSE, head(x, -1) == tail(x, -1)), value)
}
