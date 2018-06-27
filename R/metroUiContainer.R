#' Create a Metro 4 container
#'
#' Build a metroUI container
#'
#' @param ... Any element.
#'
#' @examples
#' if(interactive()){
#'  library(shiny)
#'  library(shinyMetroUi)
#'
#'  shiny::shinyApp(
#'    ui = metroUiPage(
#'     metroUiContainer()
#'    ),
#'    server = function(input, output) {}
#'  )
#' }
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
metroUiContainer <- function(...){
 shiny::tags$div(class = "container-fluid", ...)
}

