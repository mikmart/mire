#' @export
replace_if <- function(x, f, values) {
  stopifnot(is.function(f))
  replace(x, f(x), values)
}
