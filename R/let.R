#' Evaluate an expression in a modified context
#'
#' Similar to [with()], but with an interface optimized for specifying single
#' values, sequential evaluation, and an argument order suitable for piping. Can
#' be used to avoid cluttering the environment with intermediate values, like a
#' compact local scope. Inspired by the `let` expression in Haskell.
#'
#' @param expr Expression to evaluate. The input is captured before evaluation
#'   in a context modified by assignments in `...`.
#' @param ... Name-value pairs to assign in the evaluation context for `expr`.
#'   Evaluated sequentially (before `expr`); you can refer to assignments from
#'   previous arguments in subsequent ones.
#'
#' @return The value of evaluating `expr` in the modified context.
#'
#' @examples
#' let(x = 1, x + x)
#'
#' # Use earlier assignments
#' let(x = 2, y = x + 3, y * y)
#'
#' # The equivalent local scope
#' local({
#'   x <- 2
#'   y <- x + 3
#'   y * y
#' })
#' @export
let <- function(expr, ...) {
  args <- eval(substitute(alist(...)))
  nams <- names(args)

  if (length(nams) != length(args) || any(nams == "")) {
    stop("All arguments in `...` must be named.")
  }

  vals <- new.env(parent = parent.frame())
  for (i in seq_along(args)) {
    assign(nams[i], eval(args[[i]], vals), vals)
  }

  eval(substitute(expr), vals)
}

# TODO: Probably a nice candidate to convert to C to save some microseconds?
