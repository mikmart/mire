#' Equip an object with the attributes to make it a data frame
#'
#' No type checking or conversions are performed on the inputs, in order to
#' save precious microseconds when it matters.
#'
#' @param x An object, should be a list with elements of equal length.
#' @param n An integer number of rows; the shared length of elements in `x`.
#'
#' @returns `x` with the necessary attributes set to make it a data frame.
#' @seealso [vctrs::new_data_frame()] for a further optimized constructor.
#' @seealso [data.frame()] for a more convenient constructor.
#'
#' @examples
#' new_data_frame(list(a = 1:2, b = 3:4), 2L)
#' @export
new_data_frame <- function(x, n) {
  structure(x, row.names = c(NA, n), class = "data.frame")
}
