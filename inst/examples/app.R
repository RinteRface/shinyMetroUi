library(shiny)

shiny::shinyApp(
  ui = metroUiPage(
    title = "metroUI design",

    metroUiContainer(
      HTML(
        paste0(
          '<h1 class="text-center">Metro 4</h1>
          <h3 class="text-center">The Components Library</h3>
          <div data-role="cube"></div>
          '
        )
      ),
      sliderInput("obs", "Number of observations:",
                  min = 0, max = 1000, value = 500
      ),
      plotOutput("distPlot"),
      HTML(
        paste0(
          '<ul class="sidenav-m3">
          <li class="title">Title 1</li>
          <li class="active"><a href="#"><span class="mif-home icon"></span>Dashboard</a></li>
          <li class="stick-right bg-red"><a href="#"><span class="mif-cog icon"></span>Layouts</a></li>
          <li class="stick-left bg-green">
          <a class="dropdown-toggle" href="#"><span class="mif-tree icon"></span>Sub menu</a>
          <ul class="d-menu" data-role="dropdown" style="display: none;">
          <li><a href=""><span class="mif-vpn-lock icon"></span> Subitem 1</a></li>
          <li><a href="">Subitem 2</a></li>
          <li><a href="">Subitem 3</a></li>
          <li><a href="">Subitem 4</a></li>
          <li class="disabled"><a href="">Subitem 5</a></li>
          </ul>
          </li>
          <li class=""><a href="#">Thread item</a></li>
          <li class="disabled"><a href="#">Disabled item</a></li>

          <li class="title">Title 2</li>
          <li><a href="#">Other Item 1</a></li>
          <li><a href="#">Other item 2</a></li>
          <li><a href="#">Other item 3</a></li>
          </ul>
          '
        )
      )
    )
  ),
  server = function(input, output) {
    output$distPlot <- renderPlot({
      hist(rnorm(input$obs))
    })
  }
)
