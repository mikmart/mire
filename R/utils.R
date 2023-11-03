# Experimental/for internal use/defined in another package.
`%||%` <- function(x, y) if (is.null(x)) y else x
`%&&%` <- function(x, y) if (is.null(x)) x else y
