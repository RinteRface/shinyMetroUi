#' Change the value of a checkbox input on the client
#'
#' @param session The session object passed to function given to the server.
#' @param inputId The id of the input object.
#' @param label	The label to set for the input object.
#' @param value The value to set for the input object.
#'
#' @examples
#' if (interactive()) {
#'  library(shiny)
#'  library(shinyMetroUI)
#'
#'  shiny::shinyApp(
#'   ui = metroPage(
#'     actionButton("go", "Update checkbox"),
#'     metroCheck(inputId = "checkbox1", label = "Checkbox", labelSide = "right")
#'   ),
#'   server = function(input, output, session) {
#'     observeEvent(input$go, {
#'       updateMetroCheck(session, inputId = "checkbox1", value = TRUE)
#'     })
#'   }
#'  )
#' }
#' @export
updateMetroCheck <- function(session, inputId, label = NULL, value = NULL) {
  message <- dropNulls(list(label = label, value = value))
  session$sendInputMessage(inputId, message)
}
