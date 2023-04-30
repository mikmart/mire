#' @export
shift_right <- function(x, n = 1L, fill = NA) {
  stopifnot(is.numeric(n) && length(n) == 1, n >= 0)
  if (n > 0) c(rep_len(fill, n), head(x, -n)) else x
}

#' @export
shift_left <- function(x, n = 1L, fill = NA) {
  stopifnot(is.numeric(n) && length(n) == 1, n >= 0)
  if (n > 0) c(tail(x, -n), rep_len(fill, n)) else x
}
