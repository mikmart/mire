# mire (development version)

* Changed `unfill()` to accept a vector of `values` instead of a single `value`.
* Added new infix operator `%>>%` to apply a function over a potentially null value.
* Added new function `gcd()` to find the greatest common divisor of a vector.
* Added new option `mire.decompress.verbose` to control `decompress()` messages.
* New `read_DESCRIPTION_from_tar()` reads the DESCRIPTION file from a package tar archive.
* New `read_DESCRIPTION_from_zip()` reads the DESCRIPTION file from a package zip archive.

# mire 0.1.0 (2023-10-29)

* Changed `resample()` into an S3 generic for sampling with replacement.
* Added new S3 method `resample.data.frame()` for resampling rows of data frames.
* Added new S3 generic `permute()` for generating permutations of objects.
* Added new S3 method `permute.data.frame()` for permuting rows of data frames.
* Added new function `trapez()` for trapezoidal integration over sample points.
* Added a `NEWS.md` file to track changes to the package.
