#' Replace adjacent repeated elements in a vector
#'
#' @param x A vector.
#' @param value A replacement value of length 1.
#'
#' @returns The vector `x` with adjacent repeated elements replaced with `value`.
#' @seealso [tidyr::fill()] and [vctrs::vec_fill_missing()] for the reverse operation.
#' @seealso [uniql()] to identify non-repeated elements.
#'
#' @examples
#' unfill(rep(1:3, 2:4))
#' unfill(rep(c("A", "B"), 3:4), "")
#' @export
unfill <- function(x, value = NA) {
  stopifnot(length(value) == 1L)
  replace(x, !uniql(x), value)
}
