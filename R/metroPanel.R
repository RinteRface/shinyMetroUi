#' Create a Metro 4 Panel
#'
#' Build a Metro panel
#'
#' @param ... Panel content.
#' @param title Panel title.
#' @param width Panel width.
#' @param height Panel height.
#' @param collapsible Whether the panel is collapsible or not. FALSE by default.
#' @param collapsed Whether the panel is collapsed at start. FALSE by default.
#' @param draggable Whether the panel is draggable or not. FALSE by default.
#' @param shadow Panel z-index. Numeric value expected.
#' @param title_color Title background color.
#' @param icon_color Icon background color.
#' @param collapse_color Collapse icon background color.
#' @param content_color Content background color.
#'
#' @examples
#' if(interactive()){
#'  library(shiny)
#'  library(shinyMetroUi)
#'
#'  shiny::shinyApp(
#'    ui = metroPage(
#'     metroCol(
#'      metroPanel(
#'       title = "Panel title",
#'       width = "250",
#'       collapsible = TRUE,
#'       draggable = TRUE,
#'       "Raptus capios ducunt ad genetrix.
#'       Joy doesn’t beautifully respect any believer —
#'       but the power is what flies",
#'       shadow = 3,
#'       title_color = "red",
#'       icon_color = "green",
#'       collapse_color = "dark",
#'       content_color = "cyan"
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
metroPanel <- function(..., title = NULL, width = NULL, height = NULL,
                       collapsible = FALSE, collapsed = FALSE,
                       draggable = FALSE, shadow = NULL, title_color = NULL,
                       icon_color = NULL, collapse_color = NULL, content_color = NULL){

  # make sure that a non collapsible panel does
  # not start in a collapsed state by mistake
  if (collapsible == FALSE) collapsed <- FALSE

  # a list of all panel non standard attributes
  panelProps <- dropNulls(
    list(
      `data-role` = "panel",
      `data-width` = width,
      `data-height` = height,
      `data-title-caption` = title,
      `data-title-icon` = shiny::tags$span(class = "mif-apps"),
      `data-collapsible` = collapsible,
      `data-collapsed` = collapsed,
      `data-draggable` = draggable,
      `data-cls-panel` = paste0("shadow-",shadow),
      `data-cls-title` = paste0("bg-", title_color, " fg-white"),
      `data-cls-title-icon` = paste0("bg-", icon_color, " fg-white"),
      `data-cls-content` = paste0("bg-", content_color, " fg-white"),
      `data-cls-collapse-toggle` = paste0("bg-", collapse_color, " fg-white marker-light")
    )
  )

  # replace TRUE and FALSE by true and false for javascript
  panelProps <- lapply(panelProps, function(x) {
    if (identical(x, TRUE))
      "true"
    else if (identical(x, FALSE))
      "false"
    else x
  })

  div <- shiny::tags$div
  propsTag <- do.call(div, panelProps)
  propsTag <- shiny::tagAppendChild(propsTag, ...)
  propsTag
}
