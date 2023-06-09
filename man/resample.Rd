% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/resample.R
\name{resample}
\alias{resample}
\title{Sample a vector with replacement}
\usage{
resample(x, size, prob = NULL)
}
\arguments{
\item{x}{either a vector of one or more elements from which to choose,
    or a positive integer.  See \sQuote{Details.}}

\item{size}{a non-negative integer giving the number of items to choose.}

\item{prob}{a vector of probability weights for obtaining the elements
    of the vector being sampled.}
}
\value{
A vector of length \code{size} with elements drawn from \code{x} or---if \code{x}
is a positive number with length 1---from the integers \code{1:x}.
}
\description{
Sample a vector with replacement
}
\examples{
resample(1:5)
}
\seealso{
\code{\link[=sample]{sample()}} which this (extremely) thinly wraps.
}
