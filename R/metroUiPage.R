#' Create a Metro 4 page
#'
#' Build a metroUI page
#'
#' @param ... Any element.
#' @param title Page title.
#'
#' @examples
#' if(interactive()){
#'  library(shiny)
#'  library(shinyMetroUi)
#'
#'  shiny::shinyApp(
#'    ui = metroUiPage(),
#'    server = function(input, output) {}
#'  )
#' }
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
metroUiPage <- function(..., title = NULL){

  shiny::tags$html(
    # Head
    shiny::tags$head(
      shiny::tags$meta(charset = "utf-8"),
      shiny::tags$meta(
        name = "viewport",
        content = "width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"
      ),

      shiny::tags$title(title),

      # CSS
      shiny::includeCSS(system.file("css/metro-all.min.css", package = "shinyMetroUi"))
    ),
    # Body
    shiny::tags$body(
      ...,
      shiny::includeScript(system.file("js/metro.min.js", package = "shinyMetroUi"))
    )
  )
}
