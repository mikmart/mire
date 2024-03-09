# unnamed dots signal reasonable error

    Code
      let(x = 1, y <- 2, x + y)
    Condition
      Error in `let()`:
      ! All arguments in `...` must be named.

# can't access variables from internal scope

    Code
      let(nams)
    Condition
      Error in `let()`:
      ! object 'nams' not found

