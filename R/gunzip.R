#' @export
gunzip <- function(file, dest = sub("\\.gz$", "", file), force = FALSE) {
  stopifnot(!missing(dest) || is.character(file) && file.exists(file))

  if (is.character(file) && is.character(dest)) {
    stopifnot(dest != file || force)
  }

  # Establish source connection
  if (is.character(file)) {
    src <- gzfile(file, "rb")
    on.exit(close(src), add = TRUE)
  } else {
    src <- gzcon(file)
  }

  # Establish destination connection
  if (is.character(dest)) {
    message("Decompressing `file` into ", dest)
    dst <- file(dest, "wb")
    on.exit(close(dst), add = TRUE)
  } else {
    dst <- dest
  }

  # Copy raw data in batches from source to destination
  BATCH_SIZE <- getOption("mire.gunzip.batch_size", 50 * 1024^2) # 50 MiB
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
