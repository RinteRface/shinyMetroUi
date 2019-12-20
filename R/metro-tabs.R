#' Create a Metro 4 tab container
#'
#' Build a Metro tab container
#'
#' @param ... Slot for \link{metroTab}.
#' @param mode Tab mode: NULL or "pills", "text" and "group".
#' @param position Tab position: "horizontal" by default or "vertical".
#' @param align Tab align: "start", "center" or "end".
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @examples
#' if(interactive()){
#'  library(shiny)
#'  library(shinyMetroUi)
#'
#'  shiny::shinyApp(
#'    ui = metroPage(
#'      metroTabs(
#'       mode = "pills",
#'       position = "horizontal",
#'       metroTab(tabName = "Tab 1", "test 1"),
#'       metroTab(tabName = "Tab 2", "test 2"),
#'       metroTab(tabName = "Tab 3", "test 3")
#'      )
#'    ),
#'    server = function(input, output) {}
#'  )
#' }
#'
#' @export
metroTabs <- function(..., mode = NULL, position = c("horizontal", "vertical"),
                      align = c("start", "center", "end")) {

  if (!mode %in% c("text", "pills", "group")) mode <- NULL

  position <- match.arg(position)
  align <- match.arg(align)

  items <- list(...)
  len <- length(items)

  # menu
  tabsMenu <- shiny::tags$ul(
    `data-role` = "tabs",
    `data-tabs-type` = if (!is.null(mode)) mode else NULL,
    `data-expand` = "true",
    `data-cls-tabs` = paste0("flex-justify-", position),
    `data-tabs-position` = if (position == "vertical") "vertical" else NULL,
    lapply(1:len, FUN = function(i) {
      tab <- items[[i]][[2]]
      tabName <- items[[i]][[1]]
      tabId <- tab$attribs$id
      tabCl <- tab$attribs$class

      shiny::tags$li(
        shiny::tags$a(
          href = paste0("#", tabId),
          tabName
        )
      )
    })
  )

  # tabContent
  tabsContent <- shiny::tags$div(
    class = "border bd-default no-border-top p-2",
    lapply(X = 1:len, FUN = function(i) items[[i]][[2]])
  )

  shiny::tagList(tabsMenu, tabsContent)
}



#' Create a Metro 4 tab
#'
#' Build a Metro tab
#'
#' @param ... Tab content.
#' @param tabName Unique tab name.
#' @param disable Whether the tab is disabled. FALSE by default
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
metroTab <- function(..., tabName, disable = FALSE) {
  id <- tabName
  # handle punctuation
  id <- gsub(x = id, pattern = "[[:punct:]]", replacement = "")
  # handle tab names with space
  id <- gsub(x = id, pattern = " ", replacement = "")

  tabTag <- shiny::tags$div(
    class = if (disable) "disabled" else NULL,
    id = id,
    ...
  )

  return(list(tabName, tabTag))
}
