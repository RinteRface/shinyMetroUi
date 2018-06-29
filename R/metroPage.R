#' Create a Metro 4 page
#'
#' Build a metroUI page
#'
#' @param ... Any element. They are inserted in a grid. Use the shiny fluidRow function
#' to create a row and insert metroUiCol inside. The maximum with is 12
#' (3 columns or lenght 4, 4 columns of lenght 3, ...).
#' @param title Page title.
#'
#' @examples
#' if(interactive()){
#'  library(shiny)
#'  library(shinyMetroUi)
#'
#'  shiny::shinyApp(
#'    ui = metroPage(),
#'    server = function(input, output) {}
#'  )
#' }
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
metroPage <- function(..., title = NULL){

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
      shiny::includeCSS(system.file("css/metro-all.min.css", package = "shinyMetroUi")),
      shiny::tags$link(rel = "stylesheet", href = "https://cdn.metroui.org.ua/v4/css/metro-icons.min.css")
    ),
    # Body
    shiny::tags$body(
      metroContainer(shiny::tags$div(class = "grid", ...)),
      shiny::includeScript(system.file("js/metro.min.js", package = "shinyMetroUi"))
    )
  )
}
