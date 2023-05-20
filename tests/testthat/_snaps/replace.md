# passing a non-function predicate gives a reasonable error

    Code
      replace_if(c(1, NA, 3), 2, 42)
    Error <simpleError>
      '2' is not a function, character or symbol

