#' Create a Metro 4 page
#'
#' Build a metroUI page
#'
#' @param ... Any element. They are inserted in a grid. Use the shiny fluidRow function
#' to create a row and insert metroUiCol inside. The maximum with is 12
#' (3 columns or lenght 4, 4 columns of lenght 3, ...).
#' @param title Page title.
#' @param allow_loading Whether to allow loading before display the app content. FALSE by default.
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
metroPage <- function(..., title = NULL, allow_loading = FALSE){

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
      shiny::tags$link(rel = "stylesheet", href = "https://cdn.metroui.org.ua/v4/css/metro-icons.min.css"),

      if (allow_loading) {
        shiny::tags$script(
          ' function hideLoader() {
              $("#loader").hide();
            }
            setTimeout(hideLoader, 2000)
          '
        )
      }
    ),
    # Body
    shiny::tags$body(
      # loading element if allowed
      onLoad = if (allow_loading) {
         "var activity = Metro.activity.open({
              type: 'square',
              overlayColor: '#fff',
              overlayAlpha: 1,
              text: 'Please, wait...'
          });
          setTimeout(function(){
            Metro.activity.close(activity);
          }, 2000)
        "
      },
      if (allow_loading) {
        shiny::tags$div(
          id = "loader",
          `data-role` = "activity",
          `data-type` = "square",
          `data-style` = "color"
        )
      },
      metroContainer(shiny::tags$div(class = "grid", ...)),
      shiny::includeScript(system.file("js/metro.min.js", package = "shinyMetroUi"))
    )
  )
}
