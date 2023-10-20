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

  observeEvent(input$cookies, {
    if (!is.null(input$cookies)) {
      if (!("dfe_analytics" %in% names(input$cookies))) {
        shinyjs::show(id = "cookieMain")
      } else {
        msg <- list(
          name = "dfe_analytics",
          value = input$cookies$dfe_analytics
        )
        session$sendCustomMessage("analytics-consent", msg)
        if ("cookies" %in% names(input)) {
          if ("dfe_analytics" %in% names(input$cookies)) {
            if (input$cookies$dfe_analytics == "denied") {
              ga_msg <- list(name = paste0("_ga_", google_analytics_key))
              session$sendCustomMessage("cookie-remove", ga_msg)
            }
          }
        }
      }
    } else {
      shinyjs::hide(id = "cookieMain")
    }
  })

  # Need these set of observeEvent to create a path through the cookie banner
  observeEvent(input$cookieAccept, {
    msg <- list(
      name = "dfe_analytics",
      value = ifelse(input$cookie_consent, "granted", "denied")
    )
    session$sendCustomMessage("cookie-set", msg)
    session$sendCustomMessage("analytics-consent", msg)
    if ("cookies" %in% names(input)) {
      if ("dfe_analytics" %in% names(input$cookies)) {
        if (input$cookies$dfe_analytics == "denied") {
          ga_msg <- list(name = paste0("_ga_", google_analytics_key))
          session$sendCustomMessage("cookie-remove", ga_msg)
        }
      }
    }
    shinyjs::show(id = "cookieAcceptDiv")
    shinyjs::hide(id = "cookieMain")
  })

  observeEvent(input$cookieReject, {
    shinyjs::show(id = "cookieRejectDiv")
    shinyjs::hide(id = "cookieMain")
  })

  observeEvent(input$hideAccept, {
    shinyjs::toggle(id = "cookieDiv")
  })

  observeEvent(input$hideReject, {
    shinyjs::toggle(id = "cookieDiv")
  })

  observeEvent(input$remove, {
    msg <- list(name = "dfe_analytics", value = "denied")
    session$sendCustomMessage("cookie-remove", msg)
    session$sendCustomMessage("analytics-consent", msg)
  })

  cookies_data <- reactive({
    input$cookies
  })

  output$cookie_status <- renderText({
    cookie_text_stem <- "To better understand the reach of our dashboard tools, this site uses cookies to identify numbers of unique users as part of Google Analytics. You have chosen to"
    cookie_text_tail <- "the use of cookies on this website."
    if ("cookies" %in% names(input)) {
      if ("dfe_analytics" %in% names(input$cookies)) {
        if (input$cookies$dfe_analytics == "granted") {
          paste(cookie_text_stem, "accept", cookie_text_tail)
        } else {
          paste(cookie_text_stem, "reject", cookie_text_tail)
        }
      }
    } else {
      "Cookies consent has not been confirmed."
    }
  })

  observeEvent(input$cookieLink, {
    # Need to link here to where further info is located.  You can
    # updateTabsetPanel to have a cookie page for instance
  })

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
      filter(ks2emss_grp == reactiveKS2()) %>%
      select(p8est)
  })

  reactiveestimatedeng <- reactive({
    pupil_coefficients %>%
      filter(ks2emss_grp == reactiveKS2()) %>%
      select(p8esteng)
  })

  reactiveestimatedmath <- reactive({
    pupil_coefficients %>%
      filter(ks2emss_grp == reactiveKS2()) %>%
      select(p8estmat)
  })

  reactiveestimatedebac <- reactive({
    pupil_coefficients %>%
      filter(ks2emss_grp == reactiveKS2()) %>%
      select(p8estebac)
  })

  reactiveestimatedopen <- reactive({
    pupil_coefficients %>%
      filter(ks2emss_grp == reactiveKS2()) %>%
      select(p8estopen)
  })

  reactiveestimatedebacsci <- reactive({
    as.numeric(pupil_modelvalues %>%
      filter(ks2emss_grp == reactiveKS2ebac()) %>%
      select(sciest))
  })

  reactiveestimatedebachum <- reactive({
    as.numeric(pupil_modelvalues %>%
      filter(ks2emss_grp == reactiveKS2ebac()) %>%
      select(humest))
  })

  reactiveestimatedebaclan <- reactive({
    as.numeric(pupil_modelvalues %>%
      filter(ks2emss_grp == reactiveKS2ebac()) %>%
      select(lanest))
  })

  reactiveconfidenceintervalsp8 <- reactive({
    data <- user_VA_data()
    round(mean(data$p8score) - ((1.96 * (reactivep8elstdev())) / (sqrt(length(data$p8score)))), 2)
  })

  # Numeric input warnings --------------------------------------------------

  iv <- InputValidator$new()
  iv$add_rule("p8scoreeng", sv_between(0, 18))
  iv$add_rule("p8scoremath", sv_between(0, 18))
  iv$add_rule("p8scoreebac", sv_between(0, 27))
  iv$add_rule("p8scoreopen", sv_between(0, 27))
  iv$add_rule("p8score", sv_between(0, 95))
  iv$add_rule("ebacscoresci", sv_between(0, 9))
  iv$add_rule("ebacscorehum", sv_between(0, 9))
  iv$add_rule("ebacscorelan", sv_between(0, 9))
  iv$enable()

  reactiveconfidenceintervalsebac <- reactive({
    data <- user_VA_data_ebac()
    round(mean(data$p8score) - ((1.96 * (reactiveebacelstdev())) / (sqrt(length(data$p8score)))), 2)
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
    valueBox(
      (if (reactivemean() < 100) {
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
    valueBox(ifelse(input$p8score <= 95, input$p8score - reactiveestimated(), NA),
      subtitle = "Pupil value added score",
      color = "green"
    )
  })

  output$VAscoreavbox <- renderValueBox({
    valueBox(ifelse(input$p8score <= 95, round(((input$p8score - reactiveestimated()) / 10), 2), NA),
      subtitle = "Pupil value added average score",
      color = "green"
    )
  })

  output$estvsactual <- renderPlotly({
    estvsactual <- estvsactual_ggplot(reactiveestimated(), input$p8score, lims = c(0, 90))
    ggplotly(estvsactual) %>%
      config(displayModeBar = FALSE)
  })

  output$estimatedscoreboxeng <- renderValueBox({
    valueBox(reactiveestimatedeng(),
      subtitle = "Estimated key stage 4 score - English element",
      color = "green"
    )
  })

  output$VAscoreboxeng <- renderValueBox({
    valueBox(ifelse(input$p8scoreeng <= 18, input$p8scoreeng - reactiveestimatedeng(), NA),
      subtitle = "Pupil value added score - English element",
      color = "green"
    )
  })

  output$VAscoreavboxeng <- renderValueBox({
    valueBox(ifelse(input$p8scoreeng <= 18, round(((input$p8scoreeng - reactiveestimatedeng()) / 2), 2), NA),
      subtitle = "Pupil value added average score - English element",
      color = "green"
    )
  })

  output$estimatedscoreboxmath <- renderValueBox({
    valueBox(reactiveestimatedmath(),
      subtitle = "Estimated key stage 4 score - maths element",
      color = "green"
    )
  })

  output$VAscoreboxmath <- renderValueBox({
    valueBox(ifelse(input$p8scoremath <= 18, input$p8scoremath - reactiveestimatedmath(), NA),
      subtitle = "Pupil value added score - maths element",
      color = "green"
    )
  })

  output$VAscoreavboxmath <- renderValueBox({
    valueBox(ifelse(input$p8scoremath <= 18, round(((input$p8scoremath - reactiveestimatedmath()) / 2), 2), NA),
      subtitle = "Pupil value added average score - maths element",
      color = "green"
    )
  })

  output$estimatedscoreboxebac <- renderValueBox({
    valueBox(reactiveestimatedebac(),
      subtitle = "Estimated key stage 4 score - EBacc element",
      color = "green"
    )
  })

  output$VAscoreboxebac <- renderValueBox({
    valueBox(ifelse(input$p8scoreebac <= 27, input$p8scoreebac - reactiveestimatedebac(), NA),
      subtitle = "Pupil value added score - EBacc element",
      color = "green"
    )
  })

  output$VAscoreavboxebac <- renderValueBox({
    valueBox(ifelse(input$p8scoreebac <= 27, round(((input$p8scoreebac - reactiveestimatedebac()) / 3), 2), NA),
      subtitle = "Pupil value added average score - EBacc element",
      color = "green"
    )
  })

  output$estimatedscoreboxopen <- renderValueBox({
    valueBox(reactiveestimatedopen(),
      subtitle = "Estimated key stage 4 score - open element",
      color = "green"
    )
  })

  output$VAscoreboxopen <- renderValueBox({
    valueBox(ifelse(input$p8scoreopen <= 27, input$p8scoreopen - reactiveestimatedopen(), NA),
      subtitle = "Pupil value added score - open element",
      color = "green"
    )
  })

  output$VAscoreavboxopen <- renderValueBox({
    valueBox(ifelse(input$p8scoreopen <= 27, round(((input$p8scoreopen - reactiveestimatedopen()) / 3), 2), NA),
      subtitle = "Pupil value added average score - open element",
      color = "green"
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
    valueBox(
      (if (reactivemeanebac() < 100) {
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
    valueBox(ifelse(input$ebacscoresci <= 9, input$ebacscoresci - reactiveestimatedebacsci(), NA),
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
    estvsactuale_bacsci <- estvsactual_ggplot(reactiveestimatedebacsci(), input$ebacscoresci, lims = c(0, 9), point_colour = "#00703c")
    ggplotly(estvsactuale_bacsci) %>%
      config(displayModeBar = F)
  })

  output$estimatedscoreboxebachum <- renderValueBox({
    valueBox(reactiveestimatedebachum(),
      subtitle = "Estimated Ebacc score - humanities subject area",
      color = "orange"
    )
  })

  output$VAscoreboxebachum <- renderValueBox({
    valueBox(ifelse(input$ebacscorehum <= 9, input$ebacscorehum - reactiveestimatedebachum(), NA),
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
    estvsactual_ebachum <- estvsactual_ggplot(
      reactiveestimatedebachum(), input$ebacscorehum,
      lims = c(0, 9), point_colour = "#F46A25"
    )
    ggplotly(estvsactual_ebachum) %>%
      config(displayModeBar = F)
  })

  output$estimatedscoreboxebaclan <- renderValueBox({
    valueBox(reactiveestimatedebaclan(),
      subtitle = "Estimated Ebacc score - languages subject area",
      color = "blue"
    )
  })

  output$VAscoreboxebaclan <- renderValueBox({
    valueBox(ifelse(input$ebacscorelan <= 9, input$ebacscorelan - reactiveestimatedebaclan(), NA),
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
    estvsactual_ebaclan <- estvsactual_ggplot(
      reactiveestimatedebaclan(), input$ebacscorelan,
      lims = c(0, 9), point_colour = "#1d70b8"
    )

    ggplotly(estvsactual_ebaclan) %>%
      config(displayModeBar = F)
  })

  ##############################
  # Schools tab

  reactivep8elstdev <- reactive({
    if (input$p8elementinput == "Progress 8") {
      p8stdev$p8stdev
    } else if (input$p8elementinput == "Progress 8 - English element") {
      p8stdev$p8engstdev
    } else if (input$p8elementinput == "Progress 8 - maths element") {
      p8stdev$p8matstdev
    } else if (input$p8elementinput == "Progress 8 - EBacc element") {
      p8stdev$p8ebacstdev
    } else if (input$p8elementinput == "Progress 8 - open element") {
      p8stdev$p8openstdev
    }
  })

  reactiveebacelstdev <- reactive({
    if (input$ebacelementinput == "KS2-4 English Baccalaureate - science subject area") {
      ebacstdev$scivastdev
    } else if (input$ebacelementinput == "KS2-4 English Baccalaureate - humanities subject area") {
      ebacstdev$humvastdev
    } else if (input$ebacelementinput == "KS2-4 English Baccalaureate - languages subject area") {
      ebacstdev$lanvastdev
    }
  })

  output$boxavgschoolp8score <- renderValueBox({
    data <- user_VA_data()
    valueBox(round(mean(data$p8score), 2),
      "Final school  score (average of pupils' scores)",
      color = "blue"
    )
  })

  output$boxavgschoolebacscore <- renderValueBox({
    data <- user_VA_data_ebac()
    valueBox(round(mean(data$p8score), 2), # AB is this correct?
      "Final school  score (average of pupils' scores)",
      color = "green"
    )
  })

  output$boxpupilnumberp8score <- renderValueBox({
    data <- user_VA_data()
    valueBox(length(data$p8score),
      "Number of pupils included in P8 calculation",
      color = "blue"
    )
  })

  output$boxpupilnumberebacscore <- renderValueBox({
    data <- user_VA_data_ebac()
    valueBox(length(data$p8score),
      "Number of pupils included in P8 calculation",
      color = "green"
    )
  })

  output$boxconfintp8score <- renderValueBox({
    data <- user_VA_data()
    valueBox(round((1.96 * (reactivep8elstdev())) / (sqrt(length(data$p8score))), 2),
      subtitle = "Confidence interval",
      color = "blue"
    )
  })

  output$boxconfintebacscore <- renderValueBox({
    data <- user_VA_data_ebac()
    valueBox(round((1.96 * (reactiveebacelstdev())) / (sqrt(length(data$p8score))), 2),
      subtitle = "Confidence interval",
      color = "green"
    )
  })

  output$boxuppconflimp8score <- renderValueBox({
    data <- user_VA_data()
    valueBox(round(mean(data$p8score) + ((1.96 * (reactivep8elstdev())) / (sqrt(length(data$p8score)))), 2),
      subtitle = "Upper confidence limit",
      color = "blue"
    )
  })

  output$boxuppconflimebacscore <- renderValueBox({
    data <- user_VA_data_ebac()
    valueBox(round(mean(data$p8score) + ((1.96 * (reactiveebacelstdev())) / (sqrt(length(data$p8score)))), 2),
      subtitle = "Upper confidence limit",
      color = "green"
    )
  })

  output$boxlowconflimp8score <- renderValueBox({
    data <- user_VA_data()
    valueBox(round(mean(data$p8score) - ((1.96 * (reactivep8elstdev())) / (sqrt(length(data$p8score)))), 2),
      subtitle = "Lower confidence limit",
      color = "blue"
    )
  })

  output$boxlowconflimebacscore <- renderValueBox({
    data <- user_VA_data_ebac()
    valueBox(round(mean(data$p8score) - ((1.96 * (reactiveebacelstdev())) / (sqrt(length(data$p8score)))), 2),
      subtitle = "Lower confidence limit",
      color = "green"
    )
  })

  output$boxp8scorenatcomp <- renderValueBox({
    data <- user_VA_data()
    upperlim <- mean(data$p8score) + ((1.96 * (reactivep8elstdev())) / (sqrt(length(data$p8score))))
    lowlim <- mean(data$p8score) - ((1.96 * (reactivep8elstdev())) / (sqrt(length(data$p8score))))
    valueBox(
      if (is.null(data) == FALSE) {
        (if (lowlim > 0) {
          paste("Significantly above")
        } else if (upperlim < 0) {
          paste("Significantly below")
        } else if (upperlim > 0 & lowlim < 0) {
          paste("Not significantly different")
        })
      } else {
        paste("NA")
      },
      subtitle = "Your school's Progress 8 score compared to the national average",
      color = "blue"
    )
  })

  output$boxebacscorenatcomp <- renderValueBox({
    data <- user_VA_data_ebac()
    upperlim <- mean(data$p8score) + ((1.96 * (reactiveebacelstdev())) / (sqrt(length(data$p8score))))
    lowlim <- mean(data$p8score) - ((1.96 * (reactiveebacelstdev())) / (sqrt(length(data$p8score))))
    valueBox(
      if (is.null(data) == FALSE) {
        (if (lowlim > 0) {
          paste("Significantly above")
        } else if (upperlim < 0) {
          paste("Significantly below")
        } else if (upperlim > 0 & lowlim < 0) {
          paste("Not significantly different")
        })
      } else {
        paste("NA")
      },
      subtitle = "Your school's VA score compared to the national average",
      color = "green"
    )
  })

  user_VA_data <- reactive({
    csv_filename <- input$user_input_VA
    if (is.null(csv_filename)) {
      return(NULL)
    }
    data <- read.csv(csv_filename$datapath, header = TRUE)
    print(colnames(data))
    data <- data %>%
      filter(`Pupil.included.in.progress.8.calculations` == 1) %>%
      select(p8score = Pupil.s.adjusted.progress.8.score)
    return(data)
  })



  output$user_view <- renderReactable({
    if (is.null(user_VA_data())) {
      tabledata <- data.frame(`Adjusted progress 8 score` = c("Please upload data"))
    } else {
      tabledata <- user_VA_data() %>%
        select(`Adjusted progress 8 score` = p8score)
    }
    names(tabledata) <- names(tabledata) %>% gsub("\\.", " ", .)
    reactable(tabledata)
  })

  user_VA_data_ebac <- reactive({
    csv_filename <- input$user_input_VA_ebac
    if (is.null(csv_filename)) {
      return(NULL)
    }
    data <- read.csv(csv_filename$datapath, header = TRUE)
    data <- data %>%
      filter(`Pupil.included.in.progress.8.calculations` == 1) %>%
      select(p8score = Pupil.s.adjusted.progress.8.score)
    return(data)
  })

  output$user_view_ebac <- renderReactable({
    if (is.null(user_VA_data_ebac())) {
      tabledata <- data.frame(`Adjusted progress 8 score` = c("Please upload data"))
    } else {
      tabledata <- user_VA_data_ebac() %>%
        select(`Adjusted progress 8 score` = p8score)
    }
    names(tabledata) <- names(tabledata) %>% gsub("\\.", " ", .)
    reactable(tabledata)
  })

  output$errorbarchart <- renderPlotly({
    data <- user_VA_data()
    point <- round(mean(data$`Pupil's adjusted progress 8 score`), 2)
    df <- data.frame(x = c(-4:4), y = c(-4:4))
    upperlimit <- mean(data$p8score) + ((1.96 * (p8stdev$p8stdev)) / (sqrt(length(data$p8score))))
    lowerlimit <- mean(data$p8score) - ((1.96 * (p8stdev$p8stdev)) / (sqrt(length(data$p8score))))


    # ggplot(data, aes(xlab = "Comparison to national average", ylab = "Value added score")) +
    errorbar <- ggplot(df, aes(x = x, y = 0)) +
      geom_line() +
      geom_text(aes(label = "National average", x = -0.5, y = 0.5)) +
      # geom_point(x = 0, y = point, aes(colour = 'blue', size = 5))
      geom_point(aes(x = 0, y = point), colour = "#1d70b8", size = 2) +
      ylim(c(-7.5, 7.5)) +
      xlim(c(-0.5, 0.5)) +
      xlab("Comparison to national average") +
      ylab("Value added score") +
      geom_errorbar(
        aes(
          ymin = lowerlimit,
          ymax = upperlimit,
          x = 0
        ),
        width = 0.05
      ) +
      theme(
        axis.text.x = element_blank(),
        axis.ticks.x = element_blank()
      )

    validate(
      need(data, "Upload school data in order to create plot"),
    )
    ggplotly(errorbar) %>%
      config(displayModeBar = F) %>%
      style(textposition = "right")
  })

  output$ebacerrorbarchart <- renderPlotly({
    data <- user_VA_data_ebac()
    point <- round(mean(data$p8score), 2)
    df <- data.frame(x = c(-7.5:7.5), y = c(-7.5:7.5))
    upperlim <- mean(data$p8score) + ((1.96 * (reactiveebacelstdev())) / (sqrt(length(data$p8score))))
    lowlim <- mean(data$p8score) - ((1.96 * (reactiveebacelstdev())) / (sqrt(length(data$p8score))))

    # ggplot(data, aes(xlab = "Comparison to national average", ylab = "Value added score")) +
    errorbar <- ggplot(df, aes(x = x, y = 0)) +
      geom_line() +
      geom_text(aes(label = "National average", x = -0.5, y = 0.5)) +
      # geom_point(x = 0, y = point, aes(colour = 'blue', size = 5))
      geom_point(aes(x = 0, y = point), colour = "#00703c", size = 2) +
      ylim(c(-7.5, 7.5)) +
      xlim(c(-0.5, 0.5)) +
      xlab("Comparison to national average") +
      ylab("Value added score") +
      geom_errorbar(
        aes(
          ymin = lowlim,
          ymax = upperlim,
          x = 0
        ),
        width = 0.05
      ) +
      theme(
        axis.text.x = element_blank(),
        axis.ticks.x = element_blank()
      )

    validate(
      need(data, "Upload data in order to create plot"),
    )
    ggplotly(errorbar) %>%
      config(displayModeBar = F) %>%
      style(textposition = "right")
  })

  output$ebacerrorbarchart_title <- renderText({
    paste("<h4> Comparison of value added score to the national average score - ", input$ebacelementinput, "</h4>")
  })

  observeEvent(input$link_to_app_content_tab, {
    updateTabsetPanel(session, "navlistPanel", selected = "dashboard")
  })

  # Stop app ---------------------------------------------------------------------------------

  session$onSessionEnded(function() {
    stopApp()
  })
}
