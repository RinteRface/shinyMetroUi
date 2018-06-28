#' Create a Metro 4 container
#'
#' Build a Metro container
#'
#' @param ... Any element.
#'
#' @examples
#' if(interactive()){
#'  library(shiny)
#'  library(shinyMetroUi)
#'
#'  shiny::shinyApp(
#'    ui = metroPage(
#'     metroContainer()
#'    ),
#'    server = function(input, output) {}
#'  )
#' }
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
metroContainer <- function(...){
 shiny::tags$div(class = "container-fluid", ...)
}

