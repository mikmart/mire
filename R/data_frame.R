#' @export
new_data_frame <- function(x, n) {
  structure(x, row.names = c(NA, n), class = "data.frame")
}
