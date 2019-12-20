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




#' Splitter
#'
#' Create a layout with panels that can be resized with splitter component
#'
#' @param panel1 Left panel. Wrap in \link[shiny]{tagList}. This can be a nested \link{metroSplitter}.
#' @param panel2 Right panel. Wrap in \link[shiny]{tagList}. This can be a nested \link{metroSplitter}.
#' @param vertical Vertical split. FALSE by default.
#' @param minSize Minimum panel size. 100px by default.
#' @param gutterSize Minimum gutter size (separator). 4 px by default.
#'
#' @export
#'
#' @examples
#' if (interactive()) {
#'  library(shiny)
#'  library(shinyMetroUI)
#' }
metroSplitter <- function(panel1, panel2, vertical = FALSE, minSize = 100, gutterSize = 4) {

  if (is.null(gutterSize)) gutterSize <- 4

  shiny::tags$div(
    `data-role` = "splitter",
    `data-split-mode` = if (vertical) "vertical" else NULL,
    `data-min-sizes` = if (!is.null(minSize)) minSize else NULL,
    `data-gutter-size`= gutterSize,
    class = "h-100",
    shiny::tags$div(
      class = "d-flex flex-justify-center flex-align-center",
      panel1
    ),
    shiny::tags$div(
      class = "d-flex flex-justify-center flex-align-center",
      panel2)
  )
}
