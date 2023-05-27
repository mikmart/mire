#' Create a batch indicator for splitting a vector
#'
#' Create an indicator for splitting a vector into `n` batches, or batches of a
#' given `size`.
#'
#' @param x A vector.
#' @param n An integer. The number of batches to create.
#' @param size An integer. The size of batches to create.
#' @param balance Logical. Should batch sizes be (approximately) balanced?
#'
#' @returns An integer vector of `length(x)` identifying which batch each
#'   element of `x` belongs to.
#' @seealso [split()] to split a vector into a list of batches.
#'
#' @examples
#' batch(LETTERS, 8)
#' batch(LETTERS, size = 8)
#' batch(LETTERS, size = 8, balance = TRUE)
#' @export
batch <- function(x, n = NULL, size = NULL, balance = !is.null(n)) {
  if (is.null(n) && is.null(size)) {
    stop("Either `n` or `size` must be specified.")
  } else if (!is.null(n) && !is.null(size)) {
    stop("Either `n` or `size` must be specified, not both.")
  }

  if (balance) {
    if (is.null(n)) {
      n <- ceiling(length(x) / size)
    }
    sort(as.integer(1 + (seq_along(x) - 1) %% n))
  } else {
    if (is.null(size)) {
      size <- ceiling(length(x) / n)
    }
    as.integer(1 + (seq_along(x) - 1) %/% size)
  }
}
