#' @export
replace_if <- function(x, f, values) {
  f <- match.fun(f)
  replace(x, f(x), values)
}
