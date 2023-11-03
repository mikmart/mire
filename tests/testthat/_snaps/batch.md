# signals appropriate errors for invalid input combinations

    Code
      batch(LETTERS)
    Condition
      Error in `batch()`:
      ! Either `n` or `size` must be specified.

---

    Code
      batch(LETTERS, n = 2, size = 2)
    Condition
      Error in `batch()`:
      ! Either `n` or `size` must be specified, not both.

