#' Read the DESCRIPTION file from a package archive
#'
#' @param archive_path Path to the package archive.
#' @param package_name Name of the package in the archive.
#' @param tar The tar program to use. See [untar()].
#'
#' @return A character matrix with a column for each field as given by [read.dcf()].
#'
#' @examples
#' \dontrun{
#' read_DESCRIPTION_from_tar("../mire_0.1.0.tar.gz", "mire")
#' }
#' @name read_DESCRIPTION
NULL

#' @rdname read_DESCRIPTION
#' @export
read_DESCRIPTION_from_tar <- function(archive_path, package_name, tar = Sys.getenv("tar")) {
  exdir <- tempfile()
  if (!dir.create(exdir))
    stop("Could not create temporary directory: ", exdir)
  on.exit(unlink(exdir))
  DESCRIPTION <- file.path(package_name, "DESCRIPTION")
  untar(archive_path, DESCRIPTION, exdir = exdir, tar = tar)
  read.dcf(file.path(exdir, DESCRIPTION))
}

#' @rdname read_DESCRIPTION
#' @export
read_DESCRIPTION_from_zip <- function(archive_path, package_name) {
  DESCRIPTION <- file.path(package_name, "DESCRIPTION")
  read.dcf(unz(archive_path, DESCRIPTION))
}
