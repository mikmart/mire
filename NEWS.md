# mire (development version)

* Changed `unfill()` to accept a vector of `values` instead of a scalar `value`.
* Added new function `matpow()` and infix operator `%^%` for powers of a matrix.
* Added new function `mapsome()` and infix operator `%>>%` to apply a function
  over a potentially null value.

# mire 0.1.0 (2023-10-29)

* Changed `resample()` to a generic function for sampling with replacement.
* Added new `resample.data.frame()` method for resampling rows of data frames.
* Added new generic function `permute()` for generating permutations of objects.
* Added new `permute.data.frame()` method for permuting rows of data frames.
* Added new function `trapez()` for trapezoidal integration over sample points.
* Added a `NEWS.md` file to track changes to the package.
