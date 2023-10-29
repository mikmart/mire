#' Create a batch indicator for splitting an object
#'
#' A generic function to create an indicator for splitting an object into `n`
#' batches, or batches of a given `size`. The `data.frame` method batches rows.
#'
#' @param x A vector or data frame.
#' @param n An integer. The number of batches to create.
#' @param size An integer. The size of batches to create.
#' @param ... Arguments passed on to further methods.
#' @param balance Logical. Should batch sizes be (approximately) balanced?
#'
#' @returns An integer vector suitable to use as an index to [split()] the
#'   object by.
#'
#' @examples
#' batch(LETTERS, 8)
#' batch(LETTERS, size = 8)
#' batch(LETTERS, size = 8, balance = TRUE)
#'
#' # The data.frame method batches rows
#' split(iris, batch(iris, 2)) |> str()
#' @export
batch <- function(x, n = NULL, size = NULL, ..., balance = !is.null(n)) {
  if (is.null(n) && is.null(size)) {
    stop("Either `n` or `size` must be specified.")
  } else if (!is.null(n) && !is.null(size)) {
    stop("Either `n` or `size` must be specified, not both.")
  }
  UseMethod("batch")
}

#' @export
batch.default <- function(x, n = NULL, size = NULL, ..., balance = !is.null(n)) {
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

#' @rdname batch
#' @export
batch.data.frame <- function(x, n = NULL, size = NULL, ..., balance = !is.null(n)) {
  batch.default(seq_len(nrow(x)), n = n, size = size, ..., balance = balance)
}
