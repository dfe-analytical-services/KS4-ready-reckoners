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
  # reactiveRevBal <- reactive({
  #   dfRevBal %>% filter(
  #     area_name == input$selectArea | area_name == "England",
  #     school_phase == input$selectPhase
  #   )
  # })
  

  
#  ---------------------

  reactivemean <- reactive({
    average <- mean(c(choicesPupil$value[choicesPupil$label == input$mathsinput], choicesPupil$value[choicesPupil$label == input$readinginput]))
  })

  reactiveKS2 <- reactive({
    if (reactivemean() <= 82) {
      paste(1)
    } else if (reactivemean() <= 86) {
      paste(2)
    } else if (reactivemean() <= 87.5) {
      paste(3)
    } else if (reactivemean() <= 89) {
      paste(4)
    } else if (reactivemean() <= 90.5) {
      paste(5)
    } else if (reactivemean() <= 92) {
      paste(6)
    } else if (reactivemean() <= 93) {
      paste(7)
    } else if (reactivemean() <= 94) {
      paste(8)
    } else if (reactivemean() <= 95) {
      paste(9)
    } else if (reactivemean() <= 96) {
      paste(10)
    } else if (reactivemean() <= 97) {
      paste(11)
    } else if (reactivemean() <= 98) {
      paste(12)
    } else if (reactivemean() <= 99) {
      paste(13)
    } else if (reactivemean() <= 100) {
      paste(14)
    } else if (reactivemean() <= 101) {
      paste(15)
    } else if (reactivemean() <= 102) {
      paste(16)
    } else if (reactivemean() <= 103) {
      paste(17)
    } else if (reactivemean() <= 104) {
      paste(18)
    } else if (reactivemean() <= 105) {
      paste(19)
    } else if (reactivemean() <= 106) {
      paste(20)
    } else if (reactivemean() <= 107) {
      paste(21)
    } else if (reactivemean() <= 108) {
      paste(22)
    } else if (reactivemean() <= 109) {
      paste(23)
    } else if (reactivemean() <= 110) {
      paste(24)
    } else if (reactivemean() <= 111) {
      paste(25)
    } else if (reactivemean() <= 112) {
      paste(26)
    } else if (reactivemean() <= 113) {
      paste(27)
    } else if (reactivemean() <= 114) {
      paste(28)
    } else if (reactivemean() <= 115) {
      paste(29)
    } else if (reactivemean() <= 116) {
      paste(30)
    } else if (reactivemean() <= 117) {
      paste(31)
    } else if (reactivemean() <= 118) {
      paste(32)
    } else if (reactivemean() <= 119) {
      paste(33)
    } else if (reactivemean() >= 119.5) {
      paste(34)
    }
  })


  reactivemeanebac <- reactive({
    average <- mean(c(choicesPupil$value[choicesPupil$label == input$mathsinputebac], choicesPupil$value[choicesPupil$label == input$readinginputebac]))
  })

  reactiveKS2ebac <- reactive({
    if (reactivemeanebac() <= 82) {
      paste(1)
    } else if (reactivemeanebac() <= 86) {
      paste(2)
    } else if (reactivemeanebac() <= 87.5) {
      paste(3)
    } else if (reactivemeanebac() <= 89) {
      paste(4)
    } else if (reactivemeanebac() <= 90.5) {
      paste(5)
    } else if (reactivemeanebac() <= 92) {
      paste(6)
    } else if (reactivemeanebac() <= 93) {
      paste(7)
    } else if (reactivemeanebac() <= 94) {
      paste(8)
    } else if (reactivemeanebac() <= 95) {
      paste(9)
    } else if (reactivemeanebac() <= 96) {
      paste(10)
    } else if (reactivemeanebac() <= 97) {
      paste(11)
    } else if (reactivemeanebac() <= 98) {
      paste(12)
    } else if (reactivemeanebac() <= 99) {
      paste(13)
    } else if (reactivemeanebac() <= 100) {
      paste(14)
    } else if (reactivemeanebac() <= 101) {
      paste(15)
    } else if (reactivemeanebac() <= 102) {
      paste(16)
    } else if (reactivemeanebac() <= 103) {
      paste(17)
    } else if (reactivemeanebac() <= 104) {
      paste(18)
    } else if (reactivemeanebac() <= 105) {
      paste(19)
    } else if (reactivemeanebac() <= 106) {
      paste(20)
    } else if (reactivemeanebac() <= 107) {
      paste(21)
    } else if (reactivemeanebac() <= 108) {
      paste(22)
    } else if (reactivemeanebac() <= 109) {
      paste(23)
    } else if (reactivemeanebac() <= 110) {
      paste(24)
    } else if (reactivemeanebac() <= 111) {
      paste(25)
    } else if (reactivemeanebac() <= 112) {
      paste(26)
    } else if (reactivemeanebac() <= 113) {
      paste(27)
    } else if (reactivemeanebac() <= 114) {
      paste(28)
    } else if (reactivemeanebac() <= 115) {
      paste(29)
    } else if (reactivemeanebac() <= 116) {
      paste(30)
    } else if (reactivemeanebac() <= 117) {
      paste(31)
    } else if (reactivemeanebac() <= 118) {
      paste(32)
    } else if (reactivemeanebac() <= 119) {
      paste(33)
    } else if (reactivemeanebac() >= 119.5) {
      paste(34)
    }
  })


  reactiveestimated <- reactive({
    pupil_coefficients %>%
      filter(ks2emss == reactiveKS2()) %>%
      select(p8score)
  })

  reactiveestimatedeng <- reactive({
    pupil_coefficients %>%
      filter(ks2emss == reactiveKS2()) %>%
      select(p8score_eng)
  })

  reactiveestimatedmath <- reactive({
    pupil_coefficients %>%
      filter(ks2emss == reactiveKS2()) %>%
      select(p8score_mat)
  })

  reactiveestimatedebac <- reactive({
    pupil_coefficients %>%
      filter(ks2emss == reactiveKS2()) %>%
      select(p8score_ebac)
  })

  reactiveestimatedopen <- reactive({
    pupil_coefficients %>%
      filter(ks2emss == reactiveKS2()) %>%
      select(p8score_open)
  })

  reactiveestimatedebacsci <- reactive({
    as.numeric(pupil_modelvalues %>%
      filter(ks2emss == reactiveKS2ebac()) %>%
      select(science_score))
  })

  reactiveestimatedebachum <- reactive({
    as.numeric(pupil_modelvalues %>%
      filter(ks2emss == reactiveKS2ebac()) %>%
      select(humanities_score))
  })

  reactiveestimatedebaclan <- reactive({
    as.numeric(pupil_modelvalues %>%
      filter(ks2emss == reactiveKS2ebac()) %>%
      select(languages_score))
  })
  
  reactiveconfidenceintervalsp8 <- reactive({
    data <- user_VA_data()
    round(mean(data$p8score)-((1.96*(reactivep8elstdev()))/(sqrt(length(data$p8score)))),2) 
  })  
  
  reactiveconfidenceintervalsebac <- reactive({
    data <- user_VA_data_ebac()
    round(mean(data$p8score)-((1.96*(reactiveebacelstdev()))/(sqrt(length(data$p8score)))),2) 
  })


output$p8scoreinputbox <- renderUI({
  numericInput("p8score", p("Enter the pupil's key stage 4 attainment score:"), sum(input$p8scoreeng, input$p8scoremath, input$p8scoreebac, input$p8scoreopen), min = 0, max = 95, step = 0.01)
})



  output$boxavgreadmaths <- renderValueBox({
    valueBox(reactivemean(),
      "Pupil's KS2 average point score",
      color = "blue"
    )
  })

  # feel free to change the name to be more descriptive!!!
  output$PAGcatbox <- renderValueBox({
    valueBox((if (reactivemean() < 100) {
      paste("Below standard")
    } else if (reactivemean() <= 110) {
      paste("Achieving standard")
    } else if (reactivemean() > 110) {
      paste("Above standard")
    }),
    subtitle = "Prior attainment group categorisation",
    color = "blue"
    )
  })

  output$PAGbox <- renderValueBox({
    valueBox(reactiveKS2(),
      subtitle = "Prior attainment group categorisation",
      color = "blue"
    )
  })

  output$estimatedscorebox <- renderValueBox({

    # make it use PAG score to look up p8score from coefficient table as estimated score

    valueBox(reactiveestimated(),
      subtitle = "Estimated key stage 4 score",
      color = "green"
    )
  })

  output$VAscorebox <- renderValueBox({
    valueBox(input$p8score - reactiveestimated(),
      subtitle = "Pupil value added score",
      color = "green"
    )
  })

  output$VAscoreavbox <- renderValueBox({
    valueBox(round(((input$p8score - reactiveestimated()) / 10), 2),
      subtitle = "Pupil value added average score",
      color = "green"
    )
  })

  output$estvsactual <- renderPlotly({
    ggplot(df, aes(x = x, y = y)) +
      geom_line() +
      geom_point(x = as.numeric(reactiveestimated()), y = input$p8score, size = 2, colour = "#FF007F") +
      ggtitle("Estimated against actual KS4 outcome") +
      xlab("Estimated KS4 outcome") +
      ylab("Actual KS4 outcome") +
      theme(
        plot.title = element_text(color = "black", size = 14, face = "bold"),
        axis.title.x = element_text(color = "black", size = 10, face = "plain"),
        axis.title.y = element_text(color = "black", size = 10, face = "plain")
      )
  })

  output$estimatedscoreboxeng <- renderValueBox({
    valueBox(reactiveestimatedeng(),
      subtitle = "Estimated key stage 4 score - English element",
      color = "purple"
    )
  })

  output$VAscoreboxeng <- renderValueBox({
    valueBox(input$p8scoreeng - reactiveestimatedeng(),
      subtitle = "Pupil value added score - English element",
      color = "purple"
    )
  })

  output$VAscoreavboxeng <- renderValueBox({
    valueBox(round(((input$p8scoreeng - reactiveestimatedeng()) / 2), 2),
      subtitle = "Pupil value added average score - English element",
      color = "purple"
    )
  })

  output$estimatedscoreboxmath <- renderValueBox({
    valueBox(reactiveestimatedmath(),
      subtitle = "Estimated key stage 4 score - maths element",
      color = "orange"
    )
  })

  output$VAscoreboxmath <- renderValueBox({
    valueBox(input$p8scoremath - reactiveestimatedmath(),
      subtitle = "Pupil value added score - maths element",
      color = "orange"
    )
  })

  output$VAscoreavboxmath <- renderValueBox({
    valueBox(round(((input$p8scoremath - reactiveestimatedmath()) / 2), 2),
      subtitle = "Pupil value added average score - maths element",
      color = "orange"
    )
  })

  output$estimatedscoreboxebac <- renderValueBox({
    valueBox(reactiveestimatedebac(),
      subtitle = "Estimated key stage 4 score - EBacc element",
      color = "aqua"
    )
  })

  output$VAscoreboxebac <- renderValueBox({
    valueBox(input$p8scoreebac - reactiveestimatedebac(),
      subtitle = "Pupil value added score - EBacc element",
      color = "aqua"
    )
  })

  output$VAscoreavboxebac <- renderValueBox({
    valueBox(round(((input$p8scoreebac - reactiveestimatedebac()) / 3), 2),
      subtitle = "Pupil value added average score - EBacc element",
      color = "aqua"
    )
  })

  output$estimatedscoreboxopen <- renderValueBox({
    valueBox(reactiveestimatedopen(),
      subtitle = "Estimated key stage 4 score - open element",
      color = "fuchsia"
    )
  })

  output$VAscoreboxopen <- renderValueBox({
    valueBox(input$p8scoreopen - reactiveestimatedopen(),
      subtitle = "Pupil value added score - open element",
      color = "fuchsia"
    )
  })

  output$VAscoreavboxopen <- renderValueBox({
    valueBox(round(((input$p8scoreopen - reactiveestimatedopen()) / 3), 2),
      subtitle = "Pupil value added average score - open element",
      color = "fuchsia"
    )
  })

  # --------------------------------------------------------------------end of P8 tab

  output$boxavgreadmathsebac <- renderValueBox({
    valueBox(reactivemeanebac(),
      "Pupil's KS2 average point score",
      color = "blue"
    )
  })


  output$PAGcatboxebac <- renderValueBox({
    valueBox((if (reactivemeanebac() < 100) {
      paste("Below standard")
    } else if (reactivemeanebac() <= 110) {
      paste("Achieving standard")
    } else if (reactivemeanebac() > 110) {
      paste("Above standard")
    }),
    subtitle = "Prior attainment group categorisation",
    color = "blue"
    )
  })

  output$PAGboxebac <- renderValueBox({
    valueBox(reactiveKS2ebac(),
      subtitle = "Prior attainment group categorisation",
      color = "blue"
    )
  })

  output$estimatedscoreboxebacsci <- renderValueBox({
    valueBox(reactiveestimatedebacsci(),
      subtitle = "Estimated Ebacc score - science subject area",
      color = "green"
    )
  })

  output$VAscoreboxebacsci <- renderValueBox({
    valueBox(input$ebacscoresci - reactiveestimatedebacsci(),
      subtitle = "Pupil value added score",
      color = "green"
    )
  })

  # output$VAscoreavbox <- renderValueBox({
  #   valueBox(round(((input$p8score - reactiveestimated()) / 10), 2),
  #            subtitle = "Pupil value added score",
  #            color = "green"
  #   )
  # })

  output$estvsactualebacsci <- renderPlotly({
    ggplot(df2, aes(x = x, y = y)) +
      geom_line() +
      geom_point(x = as.numeric(reactiveestimatedebacsci()), y = input$ebacscoresci, size = 2, colour = "green") +
      ggtitle("Estimated against actual KS4 outcome") +
      xlab("Estimated KS4 outcome") +
      ylab("Actual KS4 outcome") +
      theme(
        plot.title = element_text(color = "black", size = 14, face = "bold"),
        axis.title.x = element_text(color = "black", size = 10, face = "plain"),
        axis.title.y = element_text(color = "black", size = 10, face = "plain")
      )
  })

  output$estimatedscoreboxebachum <- renderValueBox({
    valueBox(reactiveestimatedebachum(),
      subtitle = "Estimated Ebacc score - humanities subject area",
      color = "orange"
    )
  })

  output$VAscoreboxebachum <- renderValueBox({
    valueBox(input$ebacscorehum - reactiveestimatedebachum(),
      subtitle = "Pupil value added score",
      color = "orange"
    )
  })

  # output$VAscoreavbox <- renderValueBox({
  #   valueBox(round(((input$p8score - reactiveestimated()) / 10), 2),
  #            subtitle = "Pupil value added score",
  #            color = "green"
  #   )
  # })

  output$estvsactualebachum <- renderPlotly({
    ggplot(df2, aes(x = x, y = y)) +
      geom_line() +
      geom_point(x = as.numeric(reactiveestimatedebachum()), y = input$ebacscorehum, size = 2, colour = "orange") +
      ggtitle("Estimated against actual KS4 outcome") +
      xlab("Estimated KS4 outcome") +
      ylab("Actual KS4 outcome") +
      theme(
        plot.title = element_text(color = "black", size = 14, face = "bold"),
        axis.title.x = element_text(color = "black", size = 10, face = "plain"),
        axis.title.y = element_text(color = "black", size = 10, face = "plain")
      )
  })

  output$estimatedscoreboxebaclan <- renderValueBox({
    valueBox(reactiveestimatedebaclan(),
      subtitle = "Estimated Ebacc score - languages subject area",
      color = "blue"
    )
  })

  output$VAscoreboxebaclan <- renderValueBox({
    valueBox(input$ebacscorelan - reactiveestimatedebaclan(),
      subtitle = "Pupil value added score",
      color = "blue"
    )
  })

  # output$VAscoreavbox <- renderValueBox({
  #   valueBox(round(((input$p8score - reactiveestimated()) / 10), 2),
  #            subtitle = "Pupil value added score",
  #            color = "green"
  #   )
  # })

  output$estvsactualebaclan <- renderPlotly({
    ggplot(df2, aes(x = x, y = y)) +
      geom_line() +
      geom_point(x = as.numeric(reactiveestimatedebaclan()), y = input$ebacscorelan, size = 2, colour = "blue") +
      ggtitle("Estimated against actual KS4 outcome") +
      xlab("Estimated KS4 outcome") +
      ylab("Actual KS4 outcome") +
      theme(
        plot.title = element_text(color = "black", size = 14, face = "bold"),
        axis.title.x = element_text(color = "black", size = 10, face = "plain"),
        axis.title.y = element_text(color = "black", size = 10, face = "plain")
      )
  })
  
##############################  
  #Schools tab
  
  reactivep8elstdev <- reactive({
    if(input$p8elementinput == 'Progress 8'){
      p8stdev$p8stdev}
    else if(input$p8elementinput == 'Progress 8 - English element'){
      p8stdev$p8engstdev}
    else if(input$p8elementinput == 'Progress 8 - maths element'){
      p8stdev$p8matstdev}
    else if(input$p8elementinput == 'Progress 8 - EBacc element'){
      p8stdev$p8ebacstdev}
    else if(input$p8elementinput == 'Progress 8 - open element'){
      p8stdev$p8openstdev}
    })
  
  reactiveebacelstdev <- reactive({
    if(input$ebacelementinput == 'KS2-4 English Baccalaureate - science subject area'){
      ebacstdev$scivastdev}
    else if(input$p8elementinput == 'KS2-4 English Baccalaureate - humanities subject area'){
      ebacstdev$humvastdev}
    else if(input$p8elementinput == 'KS2-4 English Baccalaureate - languages subject area'){
      ebacstdev$lanvastdev}
  })
  
  output$boxavgschoolp8score <- renderValueBox({
    data <- user_VA_data()
    valueBox(round(mean(data$p8score),2),
             "Final school  score (average of pupils' scores)",
             color = "blue")
  })
  
  output$boxavgschoolebacscore <- renderValueBox({
    data <- user_VA_data_ebac()
    valueBox(round(mean(data$p8score),2),   #AB is this correct?
             "Final school  score (average of pupils' scores)",
             color = "green")
  })
  
  output$boxpupilnumberp8score <- renderValueBox({
    data <- user_VA_data()
    valueBox(length(data$p8score),
             "Number of pupils included in P8 calculation",
             color = "blue")
  })
  
  output$boxpupilnumberebacscore <- renderValueBox({
    data <- user_VA_data_ebac()
    valueBox(length(data$p8score),
             "Number of pupils included in P8 calculation",
             color = "green")
  })
  
  output$boxconfintp8score <- renderValueBox({
    data <- user_VA_data()
  valueBox(round((1.96*(reactivep8elstdev()))/(sqrt(length(data$p8score))),2), 
           subtitle = "Confidence interval",
           color = "blue")
  })
  
  output$boxconfintebacscore <- renderValueBox({
    data <- user_VA_data_ebac()
    valueBox(round((1.96*(reactiveebacelstdev()))/(sqrt(length(data$p8score))),2), 
             subtitle = "Confidence interval",
             color = "green")
  })
  
  output$boxuppconflimp8score <- renderValueBox({
    data <- user_VA_data()
    valueBox(round(mean(data$p8score)+((1.96*(reactivep8elstdev()))/(sqrt(length(data$p8score)))),2), 
             subtitle = "Upper confidence limit",
             color = "blue")
  })
  
  output$boxuppconflimebacscore <- renderValueBox({
    data <- user_VA_data_ebac()
    valueBox(round(mean(data$p8score)+((1.96*(reactiveebacelstdev()))/(sqrt(length(data$p8score)))),2), 
             subtitle = "Upper confidence limit",
             color = "green")
  })
  
  output$boxlowconflimp8score <- renderValueBox({
    data <- user_VA_data()
    valueBox(round(mean(data$p8score)-((1.96*(reactivep8elstdev()))/(sqrt(length(data$p8score)))),2),
             subtitle = "Lower confidence limit",
             color = "blue")
  })
  
  output$boxlowconflimebacscore <- renderValueBox({
    data <- user_VA_data_ebac()
    valueBox(round(mean(data$p8score)-((1.96*(reactiveebacelstdev()))/(sqrt(length(data$p8score)))),2),
             subtitle = "Lower confidence limit",
             color = "green")
  })
  
 output$boxp8scorenatcomp <- renderValueBox({
    valueBox((if (reactiveconfidenceintervalsp8() > 0) {
      paste("Significantly above")
    } else if (reactiveconfidenceintervalsp8() < 0) {
      paste("Significantly below")
    } else {
      paste("Not significantly different")
    }),
    subtitle = "Your school's Progress 8 score compared to the national average",
    color = "blue"
    )
  })
 
 output$boxebacscorenatcomp <- renderValueBox({
   valueBox((if (reactiveconfidenceintervalsebac() > 0) {
     paste("Significantly above")
   } else if (reactiveconfidenceintervalsebac() < 0) {
     paste("Significantly below")
   } else {
     paste("Not significantly different")
   }),
   subtitle = "Your school's VA score compared to the national average",
   color = "green"
   )
 })
  
  user_VA_data <- reactive({
    csv_filename <- input$user_input_VA
    if(is.null(csv_filename))return(NULL)
    data <- read.csv(csv_filename$datapath, header = TRUE)
    return(data)
  })

  output$user_view <- DT::renderDataTable({
    DT::datatable(user_VA_data())
  })
  
  user_VA_data_ebac <- reactive({
    csv_filename <- input$user_input_VA_ebac
    if(is.null(csv_filename))return(NULL)
    data <- read.csv(csv_filename$datapath, header = TRUE)
    return(data)
  })
  
  output$user_view_ebac <- DT::renderDataTable({
    DT::datatable(user_VA_data_ebac())
  })
  
  output$errorbarchart <- renderPlotly({
    data <- user_VA_data()
    upperlimit <- mean(data$p8score)+((1.96*(reactivep8elstdev()))/(sqrt(length(data$p8score)))) 
    lowerlimit<- mean(data$p8score)-((1.96*(reactivep8elstdev()))/(sqrt(length(data$p8score)))) 
    
    ggplot(data, aes(xlab = "Comparison to national average", ylab = "Value added score",
                     )) +
#      errorbarchart.update_yaxes(range=[-10,10]) +
 #   geom_bar(stat = "identity")+
    geom_errorbar(aes(ymin=lowerlimit,
                      ymax=upperlimit, 
                      x = 1),
                  width=.2)
  })
  
  output$ebacerrorbarchart <- renderPlotly({
    data <- user_VA_data_ebac()
    upperlimit <- mean(data$p8score)+((1.96*(reactiveebacelstdev()))/(sqrt(length(data$p8score)))) 
    lowerlimit<- mean(data$p8score)-((1.96*(reactiveebacelstdev()))/(sqrt(length(data$p8score)))) 
    
    ggplot(data, aes(xlab = "Comparison to national average", ylab = "Value added score",
    )) +
      #      errorbarchart.update_yaxes(range=[-10,10]) +
      #   geom_bar(stat = "identity")+
      geom_errorbar(aes(ymin=lowerlimit,
                        ymax=upperlimit, 
                        x = 1),
                    width=.2)
  })
  
  observeEvent(input$link_to_app_content_tab, {
    updateTabsetPanel(session, "navlistPanel", selected = "dashboard")
  })

  # Stop app ---------------------------------------------------------------------------------

  session$onSessionEnded(function() {
    stopApp()
  })
}
