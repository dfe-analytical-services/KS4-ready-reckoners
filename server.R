# ---------------------------------------------------------
# This is the server file.
# Use it to create interactive elements like tables, charts and text for your app.
#
# Anything you create in the server file won't appear in your app until you call it in the UI file.
# This server script gives an example of a plot and value box that updates on slider input.
# There are many other elements you can add in too, and you can play around with their reactivity.
# The "outputs" section of the shiny cheatsheet has a few examples of render calls you can use:
# https://shiny.rstudio.com/images/shiny-cheatsheet.pdf
#
#
# This is the server logic of a Shiny web application. You can run th
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
# ---------------------------------------------------------


server <- function(input, output, session) {

  # Loading screen ---------------------------------------------------------------------------
  # Call initial loading screen

  hide(id = "loading-content", anim = TRUE, animType = "fade")
  show("app-content")

  # Simple server stuff goes here ------------------------------------------------------------
  reactiveRevBal <- reactive({
    dfRevBal %>% filter(
      area_name == input$selectArea | area_name == "England",
      school_phase == input$selectPhase
    )
  })

  # Define server logic required to draw a histogram
  output$lineRevBal <- renderPlotly({
    ggplotly(createAvgRevTimeSeries(reactiveRevBal(), input$selectArea)) %>%
      config(displayModeBar = F) %>%
      layout(legend = list(orientation = "h", x = 0, y = -0.2))
  })

  reactiveBenchmark <- reactive({
    dfRevBal %>%
      filter(
        area_name %in% c(input$selectArea, input$selectBenchLAs),
        school_phase == input$selectPhase,
        year == max(year)
      )
  })

  output$colBenchmark <- renderPlotly({
    ggplotly(plotAvgRevBenchmark(reactiveBenchmark()) %>%
      config(displayModeBar = F),
    height = 420
    )
  })

  output$tabBenchmark <- renderDataTable({
    datatable(reactiveBenchmark() %>%
      select(
        Area = area_name,
        `Average Revenue Balance (£)` = average_revenue_balance,
        `Total Revenue Balance (£m)` = total_revenue_balance_million
      ),
    options = list(
      scrollX = TRUE,
      paging = FALSE
    )
    )
  })

  # Define server logic to create a box

  output$boxavgRevBal <- renderValueBox({

    # Put value into box to plug into app
    valueBox(
      # take input number
      paste0("£", format((reactiveRevBal() %>% filter(
        year == max(year),
        area_name == input$selectArea,
        school_phase == input$selectPhase
      ))$average_revenue_balance,
      big.mark = ","
      )),
      # add subtitle to explain what it's hsowing
      paste0("This is the latest value for the selected inputs"),
      color = "blue"
    )
  })

  output$boxavgreadmaths <- renderValueBox({
    valueBox(paste(mean(c(choicesPupil$value[choicesPupil$label == input$mathsinput], choicesPupil$value[choicesPupil$label == input$readinginput]))),
      "Pupil's KS2 average point score",
      color = "blue"
    )
  })

  # feel free to change the name to be more descriptive!!!
  output$PAGcatbox <- renderValueBox({
    average <- mean(c(choicesPupil$value[choicesPupil$label == input$mathsinput], choicesPupil$value[choicesPupil$label == input$readinginput]))

    valueBox((if (average < 100) {
      paste("Below standard")
    } else if (average <= 110) {
      paste("Achieving standard")} 
      else if (average > 110) {
      paste("Above standard")
      }),
    subtitle = "Prior attainment group categorisation",
    color = "blue"
    )
  })
    
output$PAGbox <- renderValueBox({
  average <- mean(c(choicesPupil$value[choicesPupil$label == input$mathsinput], choicesPupil$value[choicesPupil$label == input$readinginput]))
  
    valueBox((if (average <= 79.5) {
      paste(1)
    } else if (average <= 86) {
      paste(2)} 
    else if (average <= 87.5) {
      paste(3)}
    else if (average <= 89) {
      paste(4)} 
    else if (average <= 90.5) {
      paste(5)}
    else if (average <= 92) {
      paste(6)} 
    else if (average <= 93) {
      paste(7)}
    else if (average <= 94) {
      paste(8)} 
    else if (average <= 95) {
      paste(9)}
    else if (average <= 96) {
      paste(10)} 
    else if (average <= 97) {
      paste(11)}
    else if (average <= 98) {
      paste(12)} 
    else if (average <= 99) {
      paste(13)}
    else if (average <= 100) {
      paste(14)} 
    else if (average <= 101) {
      paste(15)}
    else if (average <= 102) {
      paste(16)} 
    else if (average <= 103) {
      paste(17)}
    else if (average <= 104) {
      paste(18)} 
    else if (average <= 105) {
      paste(19)}
    else if (average <= 106) {
      paste(20)} 
    else if (average <= 107) {
      paste(21)}
    else if (average <= 108) {
      paste(22)} 
    else if (average <= 109) {
      paste(23)}
    else if (average <= 110) {
      paste(24)} 
    else if (average <= 111) {
      paste(25)}
    else if (average <= 112) {
      paste(26)} 
    else if (average <= 113) {
      paste(27)}
    else if (average <= 114) {
      paste(28)} 
    else if (average <= 115) {
      paste(29)}
    else if (average <= 116) {
      paste(30)} 
    else if (average <= 117) {
      paste(31)}
    else if (average <= 118) {
      paste(32)} 
    else if (average <= 119) {
      paste(33)}
    else if (average >= 119.5) {
      paste(34)}
    ),
    subtitle = "Prior attainment group categorisation",
    color = "blue"
    )
  })

output$estimatedscorebox <- renderValueBox({
  average <- mean(c(choicesPupil$value[choicesPupil$label == input$mathsinput], choicesPupil$value[choicesPupil$label == input$readinginput]))

  #make it use PAG score to look up p8score from coefficient table as estimated score  
  
  valueBox((if (average < 100) {
    paste("Below standard")
  } else if (average <= 110) {
    paste("Achieving standard")} 
  else if (average > 110) {
    paste("Above standard")
  }),
  subtitle = "Estimated key stage 4 score",
  color = "green"
  )
})

  output$boxpcRevBal <- renderValueBox({
    latest <- (reactiveRevBal() %>% filter(
      year == max(year),
      area_name == input$selectArea,
      school_phase == input$selectPhase
    ))$average_revenue_balance
    penult <- (reactiveRevBal() %>% filter(
      year == max(year) - 1,
      area_name == input$selectArea,
      school_phase == input$selectPhase
    ))$average_revenue_balance

    # Put value into box to plug into app
    valueBox(
      # take input number
      paste0("£", format(latest - penult,
        big.mark = ","
      )),
      # add subtitle to explain what it's hsowing
      paste0("Change on previous year"),
      color = "blue"
    )
  })

  observeEvent(input$link_to_app_content_tab, {
    updateTabsetPanel(session, "navlistPanel", selected = "dashboard")
  })

  # Stop app ---------------------------------------------------------------------------------

  session$onSessionEnded(function() {
    stopApp()
  })
}
