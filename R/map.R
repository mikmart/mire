#' @export
map <- function(f, ...) {
  setNames(.mapply(f, list(...), list()), if (...length() > 0) names(..1))
}
