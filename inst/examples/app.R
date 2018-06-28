library(shiny)

shiny::shinyApp(
  ui = metroPage(
    title = "metroUI design",

    metroContainer(
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
        ),
        paste0(
          '<div class="tiles-grid tiles-group size-2" data-group-title="General">
           <a href="https://github.com/olton/Metro-UI-CSS"
          data-role="tile" class="bg-indigo">
          <span class="mif-github icon"></span>
          <span class="branding-bar">Github</span>
          <span class="badge-bottom">30</span>
          </a>
          <div data-role="tile" class="bg-cyan">
          <span class="mif-envelop icon"></span>
          <span class="branding-bar">Email</span>
          <span class="badge-bottom">10</span>
          </div>
          <div data-role="tile" class="bg-orange" data-size="wide">
          <span class="mif-chrome icon"></span>
          <span class="branding-bar">Chrome</span>
          </div>
          <div data-role="tile" data-size="small">
          <span class="mif-apple icon"></span>
          </div>
          <div data-role="tile" data-size="small" class="bg-red">
          <span class="mif-bell icon"></span>
          </div>
          <div data-role="tile" data-size="small" class="bg-teal col-1 row-6">
          <span class="mif-windows icon"></span>
          </div>
          <div data-role="tile" data-size="small" class="bg-brown col-2 row-6">
          <span class="mif-wind icon"></span>
          </div>
          <div data-role="tile" class="bg-cyan">
          <span class="mif-table icon"></span>
          <span class="branding-bar">Tables</span>
          </div>
          </div>
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
