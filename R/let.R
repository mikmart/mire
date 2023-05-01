#' Evaluate an expression in a modified context
#'
#' Similar to [with()], but with an interface optimized for modifying single
#' symbols, sequential evaluation, and an argument order suitable for piping.
#'
#' @param expr Expression to evaluate after modifications.
#' @param ... Name-value pairs giving values for symbols in `expr`. Evaluated
#'   sequentially, so you can refer to previous names in subsequent pairs.
#'
#' @return The value of evaluating `expr` in the modified context.
#'
#' @examples
#' let(f(1:5), f = mean)
#' let(mean(x), x = 1:5)
#'
#' # Use previous assignments
#' let(x = 2, y = x + 3, y * y)
#' @export
let <- function(expr, ...) {
  args <- eval(substitute(alist(...)))

  nams <- names(args)
  if ((is.null(nams) || any(nams == "")) && length(args) > 0) {
    stop("All arguments in `...` must be named.")
  }

  vals <- new.env(parent = parent.frame())
  for (i in seq_along(args)) {
    assign(nams[i], eval(args[[i]], vals), vals)
  }

  eval(substitute(expr), vals)
}
