#' @export
resample <- function(x, size, prob = NULL) {
  sample(x, size, replace = TRUE, prob)
}

#' @export
shuffle <- function(x) {
  x[sample(length(x))]
}
