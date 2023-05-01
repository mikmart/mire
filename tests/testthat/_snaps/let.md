# unnamed dots signal reasonable error

    Code
      let(x = 1, y <- 2, x + y)
    Error <simpleError>
      All arguments in `...` must be named.

# can't access variables from internal scope

    Code
      let(nams)
    Error <simpleError>
      object 'nams' not found

