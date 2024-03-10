#' Replace adjacent repeated elements in a vector
#'
#' Replace adjacent repeated elements in a vector. This can be useful for
#' creating clearly visually separated grouped displays.
#'
#' @param x A vector.
#' @param values A vector of replacement values. Standard recycling rules apply.
#'
#' @returns The vector `x` with adjacent repeated elements replaced with `values`.
#' @seealso [uniql()] to identify non-repeated elements.
#' @seealso [tidyr::fill()] and [vctrs::vec_fill_missing()] for the reverse operation.
#'
#' @examples
#' unfill(rep(1:3, 2:4))
#' unfill(rep(c("A", "B"), 3:4), "")
#' @export
unfill <- function(x, values = NA) {
  replace(x, !uniql(x), values)
}
