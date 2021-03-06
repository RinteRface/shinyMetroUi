#' Create a Metro 4 badge
#'
#' Build a Metro badge
#'
#' @param ... Badge text.
#' @param position Badge position: inside, inline or NULL
#' @param text_color Badge text color. Black by default.
#' @param color Badge background color. No background by default.
#'
#' @examples
#' if(interactive()){
#'  library(shiny)
#'  library(shinyMetroUi)
#'
#'  shiny::shinyApp(
#'    ui = metroPage(
#'      metroGrid(
#'       metroRow(
#'        xAlign = "center",
#'        yAlign = "center",
#'        metroCell(metroBadge(4, color = "red")),
#'        metroCell(metroBadge(4, color = "yellow")),
#'        metroCell(metroBadge(4, color = "green"))
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
metroBadge <- function(..., position = NULL, text_color = NULL, color = NULL){

  # make sure that the text is always visible
  if (!is.null(color) && color %in% c("black", "dark")) text_color <- "white"
  if (!is.null(color) && color %in% c("white", "light", "grayWhite")) text_color <- "black"

  badgeClass <- "badge"
  if (!is.null(position)) badgeClass <- paste(badgeClass, position)
  if (!is.null(color)) badgeClass <- paste0(badgeClass, " bg-", color)
  if (!is.null(text_color)) badgeClass <- paste0(badgeClass, " fg-", text_color)

 shiny::tags$span(
   class = badgeClass,
   ...
 )
}
