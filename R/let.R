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
#' @returns The value of evaluating `expr` in the modified context.
#' @seealso [with()] and [local()] that perform similar context changes.
#'
#' @examples
#' let(x = 1, x + x)
#'
#' # Use with the forward pipe
#' (x + x) |> let(x = 2)
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
let <- function(expr, ...) .External2(ffi_let)
