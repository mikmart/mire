#' @export
expand_grid <- function(...) {
  x <- list(...)
  lens <- lengths(x)
  nrow <- prod(lens)

  b <- shift_right(cumprod(lens), 1, 1)
  a <- nrow / (b * lens)

  res <- map(rep, map(rep, x, b), each = a)
  new_data_frame(res, nrow)
}
