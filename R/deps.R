#' @importFrom utils packageVersion
#' @importFrom htmltools htmlDependency
metroInputsDeps <- function() {
  htmltools::htmlDependency(
    name = "metroUi-bindings",
    version = as.character(packageVersion("shinyMetroUi")),
    src = c(
      file = system.file("metroUi-4.3.4/input-bindings", package = "shinyMetroUi"),
      href = "metroUi-4.3.4/input-bindings"
    ),
    package = "shinyMetroUi",
    script = c(
      "metroCheckInputBinding.js"
    )
  )
}
