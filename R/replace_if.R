#' Replace values satisfying a predicate in a vector
#'
#' @param x A vector.
#' @param f A function, called with `x`. The return value selects elements in
#'   `x` to replace with `values`.
#' @param values A vector of replacement values. Standard recycling rules apply.
#'
#' @returns The vector `x` with elements given by `f(x)` replaced with `values`.
#' @seealso [replace()] which this thinly wraps.
#'
#' @examples
#' replace_if(c(1, NA, 3), is.na, 42)
#' @export
replace_if <- function(x, f, values) {
  f <- match.fun(f)
  replace(x, f(x), values)
}
