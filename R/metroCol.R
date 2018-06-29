#' Create a Metro 4 column cell
#'
#' Build a Metro column
#'
#' @param ... Any UI element.
#' @param width Column width. Between 1 and 12.
#' @param offset Column offset (shift). NULL by default.
#'
#' @examples
#' if(interactive()){
#'  library(shiny)
#'  library(shinyMetroUi)
#'
#'  shiny::shinyApp(
#'    ui = metroPage(
#'     fluidRow(
#'      metroCol(width = 4, 1),
#'      metroCol(width = 4, 2),
#'      metroCol(width = 4, 3)
#'     )
#'    ),
#'    server = function(input, output) {}
#'  )
#' }
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
metroCol <- function(..., width = NULL, offset = NULL){
  colClass <- if (!is.null(width)) paste0("cell-", width) else "cell"
  if (!is.null(offset)) colClass <- paste0(colClass, " offset-", offset)

  shiny::tags$div(class = colClass, ...)
}
