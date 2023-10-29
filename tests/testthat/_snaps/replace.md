# passing a non-function predicate gives a reasonable error

    Code
      replace_if(c(1, NA, 3), 2, 42)
    Condition
      Error in `match.fun()`:
      ! '2' is not a function, character or symbol

