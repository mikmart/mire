#' @export
unfill <- function(x) {
  replace(x, c(FALSE, head(x, -1) == tail(x, -1)), NA)
}
