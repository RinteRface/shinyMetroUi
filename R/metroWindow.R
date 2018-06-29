#' Create a Metro 4 window
#'
#' Build a Metro window
#'
#' @param ... Any UI element.
#' @param title Window title.
#' @param icon Window icon.
#' @param shadow Whether to display a shadow around the window. TRUE by default.
#' @param header_color Header background color.
#' @param content_color Content background color.
#' @param content_text_color Content text color.
#' @param minimize Whether the window can be minimized. TRUE by default.
#' @param closable Whether the window can be closed. TRUE by default.
#' @param draggable Whether the window can be dragged. FALSE by default.
#' @param resizable Whether the window can be resized. FALSE by default.
#' @param width Window width.
#' @param height Window height.
#'
#' @note It is better to use only 1 window per page
#'
#' @examples
#' if(interactive()){
#'  library(shiny)
#'  library(shinyMetroUi)
#'
#'  shiny::shinyApp(
#'   ui = metroPage(
#'     allow_loading = TRUE,
#'     fluidRow(
#'       metroCol(
#'         metroWindow(
#'           title = "Window",
#'           resizable = TRUE,
#'           width = "100%",
#'           header_color = "red",
#'           content_color = "black",
#'           content_text_color = "yellow",
#'           # content
#'           metroTilesGrid(
#'             metroTile(
#'               size = "small",
#'               color = "indigo",
#'               icon = "github",
#'               url = "https://github.com/olton/Metro-UI-CSS"),
#'             metroTile(size = "small", color = "green", icon = "envelop"),
#'             metroTile(size = "small", color = "blue", col_position = 1, row_position = 2),
#'             metroTile(size = "small", color = "orange", col_position = 2, row_position = 2),
#'             metroTile(
#'               size = "wide",
#'               color = "pink",
#'               sliderInput("obs", "Number of observations:",
#'                           min = 0, max = 1000, value = 500
#'               )
#'             ),
#'             metroTile(
#'               size = "large",
#'               color = "green",
#'               selected = TRUE,
#'               plotOutput("distPlot")
#'             )
#'           )
#'         )
#'       ),
#'       metroCol(
#'         metroWindow(
#'           title = "Window",
#'           resizable = TRUE,
#'           width = "100%",
#'           header_color = "red",
#'           content_color = "black",
#'           content_text_color = "yellow",
#'           # content
#'           metroTilesGrid(
#'             metroTile(size = "large",color = "brown", icon = "windows"),
#'             metroTile(size = "wide", color = "crimson", icon = "envelop"),
#'             metroTile(size = "small", color = "cobalt", col_position = 1, row_position = 2),
#'             metroTile(size = "small", color = "olive", col_position = 2, row_position = 2)
#'           )
#'         )
#'       )
#'     )
#'   ),
#'   server = function(input, output) {
#'     output$distPlot <- renderPlot({
#'       hist(rnorm(input$obs))
#'     })
#'   }
#'  )
#' }
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
metroWindow <- function(..., title = NULL, icon = NULL, shadow = TRUE,
                        header_color = NULL, content_color = NULL, content_text_color = NULL,
                        minimize = TRUE, closable = TRUE,
                        draggable = FALSE, resizable = FALSE, width = NULL,
                        height = NULL){

  windowClass <- "p-2"

  whites <- c("light", "white", "grayWhite")
  blacks <- c("black", "dark")

  if (!is.null(content_color) && content_color %in% whites && content_text_color %in% whites) content_text_color <- "black"
  if (!is.null(content_color) && content_color %in% blacks && content_text_color %in% blacks) content_text_color <- "white"

  windowProps <- dropNulls(
    list(
      `data-role` = "window",
      `data-title` = title,
      `data-icon` = paste0("<span class='mif-", icon, "'></span>"),
      `data-btn-close` = closable,
      `data-btn-min` = minimize,
      `data-btn-max` = FALSE,
      `data-draggable` = draggable,
      `data-resizable` = resizable,
      `data-shadow` = shadow,
      `data-cls-caption` = if (!is.null(header_color)) paste0("bg-", header_color) else NULL,
      `data-cls-content` = if (!is.null(content_color) && !is.null(content_text_color)) {
        paste0("bg-", content_color, " fg-", content_text_color)
      } else {
        NULL
      },
      `data-width` = width,
      `data-height` = height
    )
  )

  windowProps <- lapply(windowProps, function(x) {
    if (identical(x, TRUE))
      "true"
    else if (identical(x, FALSE))
      "false"
    else x
  })

  div <- shiny::tags$div
  windowTag <- do.call(div, windowProps)
  windowTag <- shiny::tagAppendChild(windowTag, ...)
  windowTag <- shiny::tagAppendAttributes(windowTag,  class = windowClass)
  windowTag
}
