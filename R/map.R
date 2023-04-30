#' @export
map <- function(f, ...) {
  res <- .mapply(f, list(...), list())
  nm <- if (...length() > 0) names(..1)
  setNames(res, nm)
}
