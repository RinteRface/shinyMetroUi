#' Checkbox
#'
#' Create a customizable checkbox with support for highly used options
#'
#' @param inputId Unique input id.
#' @param label Checkbox label.
#' @param value Whether the checkbox is checked at start. Default to FALSE.
#' @param disabled Whether the checkbox is disabled at start. Default to FALSE.
#' @param style Checkbox style: either "1" (fill) or "3" (outline).
#' @param labelSide Label side: "left" or "right".
#'
#' @export
#'
#' @examples
#' if (interactive()) {
#'  library(shiny)
#'  library(shinyMetroUI)
#'
#'  shiny::shinyApp(
#'   ui = metroPage(
#'     metroCheck(
#'      inputId = "checkbox1",
#'      label = "Checkbox",
#'      labelSide = "right"
#'    ),
#'     metroCheck(
#'      inputId = "checkbox2",
#'      label = "Checkbox checked",
#'      value = TRUE,
#'      labelSide = "right"
#'     ),
#'     metroCheck(
#'      inputId = "checkbox3",
#'      label = "Checkbox disabled",
#'      disabled = TRUE,
#'      labelSide = "right"
#'     ),
#'     metroCheck(
#'      inputId = "checkbox4",
#'      label = "Checkbox style 2",
#'      style = "2",
#'      labelSide = "left"
#'     ),
#'   ),
#'   server = function(input, output) {}
#'  )
#' }
metroCheck <- function(inputId, label, value = FALSE, disabled = FALSE,
                       style = c("1", "2"), labelSide = c("left", "right")) {

  style <- match.arg(style)
  labelSide <- match.arg(labelSide)

  shiny::tags$input(
    metroInputsDeps(),
    id = inputId,
    class = "checkbox",
    type = "checkbox",
    `data-role` = "checkbox",
    `data-caption` = label,
    checked = if (value) NA else NULL,
    disabled = if (disabled) NA else NULL,
    `data-style` = style,
    `data-caption-position` = labelSide
  )
}
