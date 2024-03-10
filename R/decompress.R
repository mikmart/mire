#' Decompress a file or connection
#'
#' Decompress the full contents of a file (or connection) into another file (or
#' connection). This can be useful if you need to access a compressed file in
#' some external software that doesn't support decompression, or for
#' compatibility with a function that doesn't accept connections and doesn't
#' handle decompression.
#'
#' If `file` is a connection, it will be wrapped with [gzcon()], automatically
#' opened if necessary, and is always closed (and destroyed) afterwards.
#'
#' See the underlying [gzfile()] for an authoritative list of supported
#' compression types. At time of writing at least `gzip`, `bzip2`, `xz` and
#' `lzma` are supported.
#'
#' The batch size used for I/O operations can be configured by setting the
#' `mire.decompress.batch_size` option (in bytes). The default batch size is 50 MiB.
#'
#' The emitted messages can be suppressed by setting the `mire.decompress.verbose`
#' option to `FALSE`.
#'
#' @param file Path to a compressed file, or a connection. See Details.
#' @param dest Path to the destination file, or a connection. Must be given
#'   explicitly if `file` is not a path that exists.
#' @param force Set to `TRUE` to overwrite `file` with `dest`, if applicable.
#'
#' @returns The destination `dest`, invisibly.
#' @seealso [gzfile()] and [gzcon()] to read compressed files directly.
#'
#' @examples
#' decompress(url("https://www.stats.ox.ac.uk/pub/datasets/csb/ch12.dat.gz"), "ch12.dat")
#' head(read.table("ch12.dat"))
#' unlink("ch12.dat") # Tidy up
#' @export
decompress <- function(file, dest = sub("\\.(gz|bz2|xz)$", "", file), force = FALSE) {
  stopifnot(!missing(dest) || is.character(file) && file.exists(file))

  if (is.character(file) && is.character(dest)) {
    stopifnot(dest != file || force)
  }

  verbose <- getOption("mire.decompress.verbose", TRUE)

  # Establish source connection
  if (is.character(file)) {
    src <- gzfile(file, "rb")
    on.exit(close(src), add = TRUE)
  } else {
    src <- gzcon(file)
    if (!isOpen(src)) {
      open(src, "rb")
    }
    on.exit(close(src), add = TRUE)
    if (verbose)
      message("The source `file` connection will be closed and destroyed.")
  }

  # Establish destination connection
  if (is.character(dest)) {
    dst <- file(dest, "wb")
    on.exit(close(dst), add = TRUE)
    if (verbose)
      message(sprintf("Decompressing `file` into \"%s\".", dest))
  } else {
    dst <- dest
  }

  # Copy raw data in batches from source to destination
  BATCH_SIZE <- getOption("mire.decompress.batch_size", 50 * 1024^2) # 50 MiB
  repeat {
    bytes <- readBin(src, raw(), BATCH_SIZE)
    if (length(bytes) > 0) {
      writeBin(bytes, dst)
    } else {
      break
    }
  }

  invisible(dest)
}
