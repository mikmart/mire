
<!-- README.md is generated from README.Rmd. Please edit that file -->

# mire

<!-- badges: start -->

[![R-CMD-check](https://github.com/mikmart/mire/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/mikmart/mire/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

mire collects **mi**scellaneous **R e**xtensions that make the author’s
experience using R a little bit more pleasant.

## Installation

You can install the development version of mire from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("mikmart/mire")
```

## Example

The `let()` function (inspired by Haskell’s `let` expression) can be
used to sequentially declare local variables for evaluating an
expression:

``` r
library(mire)

let(x = 2, y = x + 3, y * y)
#> [1] 25
```
