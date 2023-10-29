#' Replace adjacent repeated elements in a vector
#'
#' @param x A vector.
#' @param values Values assigned to repeated adjacent elements.
#'
#' @returns The vector `x` with adjacent repeated elements replaced with `value`.
#' @seealso [tidyr::fill()] and [vctrs::vec_fill_missing()] for the reverse operation.
#' @seealso [uniql()] to identify non-repeated elements.
#'
#' @examples
#' unfill(rep(1:3, 2:4))
#' unfill(rep(c("A", "B"), 3:4), "")
#' @export
unfill <- function(x, values = NA) {
  replace(x, !uniql(x), values)
}
