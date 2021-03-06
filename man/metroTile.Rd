% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/metro-tiles.R
\name{metroTile}
\alias{metroTile}
\title{Create a Metro 4 Tile}
\usage{
metroTile(
  ...,
  title = NULL,
  icon = NULL,
  url = NULL,
  size = c("small", "medium", "wide", "large"),
  color = NULL,
  selected = FALSE,
  cover = NULL,
  col_position = NULL,
  row_position = NULL
)
}
\arguments{
\item{...}{Any UI element.}

\item{title}{Tile title.}

\item{icon}{Tile icon.}

\item{url}{Tile external link.}

\item{size}{Tile size. Choose among small, medium, wide or large.}

\item{color}{Tile color.}

\item{selected}{Whether the tile starts selected or not. FALSE by default.}

\item{cover}{Image path or url that will cover the tile.}

\item{col_position}{When tiles are in a grid and group, give the column position
of the current tile.}

\item{row_position}{When tiles are in a grid and group, give the row position
of the current tile.}
}
\description{
Build a Metro tile
}
\examples{
if(interactive()){
 library(shiny)
 library(shinyMetroUi)

 shiny::shinyApp(
   ui = metroPage(
    metroTile(
     size = "small",
     color = "red",
     title = "My tile",
     icon = "apps"
    ),
    metroTile(
     size = "small",
     color = "green",
     metroBadge(1, color = "yellow", position = "inline")
    ),
    metroTile(size = "small", color = "blue"),
    metroTile(size = "small", color = "orange")
   ),
   server = function(input, output) {}
 )
}

}
\author{
David Granjon, \email{dgranjon@ymail.com}
}
