#' Create a Metro 4 charms
#'
#' Build a Metro charms
#'
#' @param ... Any UI element.
#' @param id Charms unique id. Needed by the charmsToggle.
#' @param position Charms position: right, left, top or bottom.
#' @param opacity Charms opacity. NULL by default. Between 0 and 1.
#' @param background Charms background color. "black" by default.
#'
#' @examples
#' if(interactive()){
#'  library(shiny)
#'  library(shinyMetroUi)
#'
#'  shiny::shinyApp(
#'    ui = metroPage(
#'     br(), br(), br(), br(),
#'     charmsToggle(id = "mycharm", "Toggle charms"),
#'     metroCharms(
#'      id = "mycharm",
#'      background = "dark",
#'      position = "top",
#'      opacity = "0.5",
#'      sliderInput(
#'       "obs",
#'       "Number of observations:",
#'       min = 0,
#'       max = 1000,
#'       value = 500
#'      )
#'     )
#'    ),
#'    server = function(input, output) {}
#'  )
#' }
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
metroCharms <- function(..., id, position = c("right", "left", "top", "bottom"),
                        opacity = NULL, background = "back"){
  position <- match.arg(position)

  charmsTag <- shiny::tags$div(
    id = id,
    style = paste0("background-color: ", background, ";"),
    `data-role` = "charms",
    `data-position` = position,
    `data-opacity` = opacity,
    ...
  )

  shiny::tagList(
    shiny::singleton(
      shiny::tags$head(
        shiny::tags$script(
          #system.file(file.path("js", "charms.js"), package = "shinyMetroUi")
          paste0(
            "$(document).click(function(event) {
              var mycharms = $('#", id, "');
              if(!$(event.target).closest(mycharms).length) {
               if (mycharms.hasClass('open')) {
                //Metro.charms.close(mycharms);
               }
              }
            });
            "
          )
        )
      )
    ),
    charmsTag
  )

}



#' Create a Metro 4 charms toggle
#'
#' Build a Metro charms toggle button
#'
#' @param ... Button text or icon.
#' @param id Charms unique id. Needed by the charmsToggle.
#'
#' @examples
#' if(interactive()){
#'  library(shiny)
#'  library(shinyMetroUi)
#'
#'  shiny::shinyApp(
#'    ui = metroPage(
#'     fluidRow(
#'      charmsToggle(id = "mycharm", "Toggle charms")
#'     )
#'    ),
#'    server = function(input, output) {}
#'  )
#' }
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
charmsToggle <- function(..., id) {
  shiny::tags$button(
    class = "button",
    onClick = paste0("$('#", id, "').data('charms').toggle()"),
    ...
  )
}
