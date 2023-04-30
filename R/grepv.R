#' @export
grepv <- function(pattern, x, ignore.case = FALSE, perl = FALSE, fixed = FALSE, useBytes = FALSE, invert = FALSE) {
  grep(pattern, x, ignore.case, perl, value = TRUE, fixed, useBytes, invert)
}
