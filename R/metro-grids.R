#' Create a Metro 4 container
#'
#' Build a Metro container
#'
#' @param ... Any element.
#' @param fullWidth Whether the container should take the whole width. FALSE by default.
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
metroContainer <- function(..., fullWidth = FALSE){
 shiny::tags$div(class = if (fullWidth) "container-fluid" else "container", ...)
}



#' Create a Metro 4 grid
#'
#' Build a Metro grid
#'
#' @param ... Any element.
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
metroGrid <- function(...) {
  shiny::tags$div(class = "grid", ...)
}



#' Create a Metro 4 cell
#'
#' Build a Metro cell
#'
#' @param ... Any element.
#' @param width Cell width. Between 1 and 12.
#' @param offset Numeric: cell offset. Between 1 and 12
#' @param gap Whether to display gaps between cells. TRUE by default.
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
metroCell <- function(..., width = NULL, offset = NULL, gap = TRUE) {

  cellCl <- if (!is.null(width)) paste0("cell-", width) else "cell"
  if (!is.null(offset)) cellCl <- paste0(cellCl, " offset-", offset)
  if (gap) cellCl <- paste0(cellCl, " no-gap")

 shiny::tags$div(
   class = cellCl,
   ...
 )
}




#' Create a Metro 4 row
#'
#' Build a Metro row
#'
#' @param ... Any element.
#' @param xAlign How to horizontally align elements in the row: "start", "center" or "end".
#' @param yAlign How to vertically align elements in the row: "start", "center" or "end".
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
metroRow <- function(..., xAlign = c("start", "center", "end"),
                     yAlign = c("start", "center", "end")) {

  yAlign <- match.arg(yAlign)
  xAlign <- match.arg(xAlign)

  rowCl <- paste0("row", " flex-align-", yAlign, " flex-justify-", xAlign)

  shiny::tags$div(
    class = rowCl,
    ...
  )
}
