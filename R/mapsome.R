#' Apply a function over a potentially null value
#'
#' Transform or process a potentially null value with a function that does not
#' handle `NULL` inputs gracefully. Can be used to propagate `NULL` values
#' through a pipeline of calls, or in combination with `%||%` when optional
#' function arguments with a `NULL` default need processing if provided.
#'
#' @param x An object.
#' @param f A function.
#' @param ... Additional arguments passed to `f`.
#'
#' @returns `NULL` if `x` is null. Otherwise the result of `f(x, ...)`.
#'
#' @examples
#' try(strsplit(NULL, ""))
#' NULL %>>% \(x) strsplit(x, "")
#' "42" %>>% \(x) strsplit(x, "")
#'
#' # The pipe-friendly function form.
#' NULL |> mapsome(strsplit, "")
#' @name mapsome
#' @export
`%>>%` <- function(x, f) mapsome(x, f)

#' @rdname mapsome
#' @export
mapsome <- function(x, f, ...) {
  if (is.null(x)) x else f(x, ...)
}
