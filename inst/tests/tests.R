# tabs
shiny::shinyApp(
  ui = metroPage(
    metroTabs(
      mode = "pills",
      position = "horizontal",
      metroTab(tabName = "Tab 1",
               sliderInput("obs", "Number of observations:",
                           min = 0, max = 1000, value = 500
               ), plotOutput("distPlot")),
      metroTab(tabName = "Tab 2", sliderInput("obs2", "Number of observations:",
                                              min = 0, max = 1000, value = 500
      ), plotOutput("distPlot2")),
      metroTab(tabName = "Tab 3", "test 3")
    )
  ),
  server = function(input, output) {
    output$distPlot <- renderPlot({
      hist(rnorm(input$obs))
    })
    output$distPlot2 <- renderPlot({
      hist(rnorm(input$obs2))
    })
  }
)


# splitter (nest and vertical do not work)
shiny::shinyApp(
  ui = metroPage(
    panel1 = tagList(
      sliderInput(
        "obs",
        "Number of observations:",
        min = 0,
        max = 1000,
        value = 500
      ),
      plotOutput("distPlot")
    ),
    panel2 = metroSplitter(
      vertical = TRUE,
      gutterSize = 10,
      panel1 = tagList(
        sliderInput(
          "obs2",
          "Number of observations:",
          min = 0,
          max = 1000,
          value = 500
        ),
        plotOutput("distPlot2")
      ),
      panel2 = tagList(
        sliderInput(
          "obs3",
          "Number of observations:",
          min = 0,
          max = 1000,
          value = 500
        ),
        plotOutput("distPlot3")
      )
    )
  ),
  server = function(input, output) {
    output$distPlot <- renderPlot({
      hist(rnorm(input$obs))
    })
    output$distPlot2 <- renderPlot({
      hist(rnorm(input$obs2))
    })
    output$distPlot3 <- renderPlot({
      hist(rnorm(input$obs3))
    })
  }
)





# checkbox
shiny::shinyApp(
  ui = metroPage(
    actionButton("go", "Update checkbox"),
    metroCheck(inputId = "checkbox1", label = "Checkbox", labelSide = "right")
  ),
  server = function(input, output, session) {
    observeEvent(input$go, {
      updateMetroCheck(session, inputId = "checkbox1", value = TRUE)
    })
  }
)
