#' Create a Metro 4 Tile
#'
#' Build a Metro tile
#'
#' @param ... Any UI element.
#' @param title Tile title.
#' @param icon Tile icon.
#' @param url Tile external link.
#' @param size Tile size. Choose among small, medium, wide or large.
#' @param color Tile color.
#' @param selected Whether the tile starts selected or not. FALSE by default.
#' @param cover Image path or url that will cover the tile.
#' @param col_position When tiles are in a grid and group, give the column position
#' of the current tile.
#' @param row_position When tiles are in a grid and group, give the row position
#' of the current tile.
#'
#' @examples
#' if(interactive()){
#'  library(shiny)
#'  library(shinyMetroUi)
#'
#'  shiny::shinyApp(
#'    ui = metroPage(
#'     metroTile(size = "small", color = "red", title = "My tile", icon = "apps"),
#'     metroTile(size = "small", color = "green"),
#'     metroTile(size = "small", color = "blue"),
#'     metroTile(size = "small", color = "orange")
#'    ),
#'    server = function(input, output) {}
#'  )
#' }
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
metroTile <- function(..., title = NULL, icon  = NULL, url = NULL,
                      size = c("small", "medium", "wide", "large"),
                      color = NULL, selected = FALSE, cover = NULL,
                      col_position = NULL, row_position = NULL){

  size <- match.arg(size)
  tileClass <- "tile"
  if (selected) tileClass <- paste0(tileClass, " selected")
  if (!is.null(col_position)) tileClass <- paste0(tileClass, " col-", col_position)
  if (!is.null(row_position)) tileClass <- paste0(tileClass, " row-", row_position)
  if (!is.null(color)) tileClass <- paste0(tileClass, " bg-", color)

  tileProps <- list(
    class = tileClass,
    `data-role` = "tile",
    `data-size` = size,
    if (!is.null(cover)) `data-cover` = cover,
    ...,
    if (!is.null(icon)) shiny::tags$span(class = paste0("icon mif-", icon)),
    if (!is.null(title)) shiny::tags$span(class = "branding-bar", title)
  )

  outerTag <- if (!is.null(url)) {
    shiny::tags$a
  } else {
    shiny::tags$div
  }

  tileTag <- do.call(outerTag, tileProps)
  if (!is.null(url)) tileTag <- shiny::tagAppendAttributes(tileTag, href = url)
  tileTag

}



#' Create a Metro 4 Tiles Grid
#'
#' Build a Metro grid for tiles
#'
#' @param ... Insert metroTile inside.
#' @param group Whether tiles are displayed by group. FALSE by default.
#' @param title If group is TRUE, the group title.
#' @param size Tile group size: between 1 and 10.
#'
#' @examples
#' if(interactive()){
#'  library(shiny)
#'  library(shinyMetroUi)
#'
#'  shiny::shinyApp(
#'    ui = metroPage(
#'     metroTilesGrid(
#'      metroTile(size = "small", color = "red"),
#'      metroTile(size = "small", color = "green"),
#'      metroTile(size = "small", color = "blue", col_position = 1, row_position = 2),
#'      metroTile(size = "small", color = "orange", col_position = 2, row_position = 2),
#'      metroTile(size = "wide", color = "brown"),
#'      metroTile(size = "medium", color = "green", selected = TRUE)
#'     ),
#'     br(), br(), br(),
#'     metroTilesGrid(
#'      group = TRUE,
#'      size = 2,
#'      metroTile(
#'       size = "small",
#'       color = "indigo",
#'       icon = "github",
#'       url = "https://github.com/olton/Metro-UI-CSS"),
#'      metroTile(size = "small", color = "green", icon = "envelop"),
#'      metroTile(size = "small", color = "blue", col_position = 1, row_position = 2),
#'      metroTile(size = "small", color = "orange", col_position = 2, row_position = 2),
#'      metroTile(
#'       size = "wide",
#'       color = "pink",
#'       sliderInput("obs", "Number of observations:",
#'        min = 0, max = 1000, value = 500
#'       )
#'      ),
#'      metroTile(
#'       size = "large",
#'       color = "green",
#'       selected = TRUE,
#'       plotOutput("distPlot")
#'      )
#'     )
#'    ),
#'    server = function(input, output) {
#'     output$distPlot <- renderPlot({
#'      hist(rnorm(input$obs))
#'     })
#'    }
#'  )
#' }
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
metroTilesGrid <- function(..., group = FALSE, title = NULL, size = 2) {

  tilesGridClass <- "tiles-grid"
  if (group) {
    if (!is.null(size)) tilesGridClass <- paste0(tilesGridClass, " size-", size)
  }

 shiny::tags$div(
   class = if (group) paste0(tilesGridClass, " tiles-group") else tilesGridClass,
   if (group) `data-group-title` = title,
   ...
  )
}
