homepage_panel <- function() {
  tabPanel(
    "Homepage",
    gov_main_layout(
      gov_row(
        column(
          12,
          h1("KS4 Ready Reckoner dashboard"),
        ),
        card(
          card_header(
            class = "bg-primary",
            h2("Guidance")
          ),
          card_body(
            h3("Introduction"),
            p("There are four key stage 2 to 4 ready reckoners as outlined below."),
            h4("The Progress 8 element breakdown pupil ready reckoner."),
            p("The aim of this is to help the user to understand how we arrive at a value added score for their pupil. The ready reckoner allows the user to input, for an individual pupil, their key stage 2 prior attainment and key stage 4 outcome in Progress 8 or any of its elements."),
            h4("The Progress 8 element breakdown school ready reckoner."),
            p("The aim of this is to help the user understand how we arrive at a value added score for their school.
              The ready reckoner allows the user to input the value added scores in Progress 8 or any of its
              elements, for all pupils in their school. These value added scores can be copied and pasted directly
              from the pupil level file on the ", a(href = "https://tableschecking.education.gov.uk/", "checking site.")),
            h4("The EBacc subject pupil ready reckoner."),
            p("The aim of this is to help the user to understand how we arrive at a value added score for their pupil.
              The ready reckoner allows the user to input, for an individual pupil, their key stage 2 prior attainment
              and key stage 4 attainment in any of the three subject areas in the English Baccalaureate."),
            h4("The EBacc subject school ready reckoner."),
            p("The aim of this is to help the user understand how we arrive at a value added score for their school.
              The ready reckoner allows the user to input the value added scores in any of the three subject areas
              in the English Baccalaureate, for all pupils in their school. These value added scores can be copied
              and pasted directly from the pupil level file on the ", a(href = "https://tableschecking.education.gov.uk/", "checking site.")),
            h3("How to use this app"),
            tags$ol(
              tags$li("Select the 'School ready reckoner' or 'Pupil ready reckoner' tab from the left side bar."),
              tags$li("Follow the instructions steps within.")
            )
          )
        )
      )
    )
  )
}


dashboard_panel <- function() {
  tabPanel(
    value = "dashboard",
    "School ready reckoner",

    # Define UI for application that draws a histogram



    # Sidebar with a slider input for number of bins
    gov_main_layout(
      h1("School level ready reckoner"),
      navset_tab(
        id = "tabsetpanels",
        nav_panel(
          "Progress 8",
          card(
            class = "border-0",
            p(
              strong("Please download a csv file your school's pupil scores from "),
              a(href = "https://tableschecking.education.gov.uk/", "https://tableschecking.education.gov.uk/", .noWS = c("after")),
              strong(" and upload the file here:")
            ),
            fileInput("user_input_VA",
              label = NULL,
              # (a(href="https://tableschecking.education.gov.uk/",  "https://tableschecking.education.gov.uk/ and upload the file here:")),
              multiple = FALSE,
              accept = c("text/csv", "text/comma-separated-values", ".csv")
            ),
            card(
              class = "border-0",
              reactableOutput("user_view")
            ),
            selectInput("p8elementinput",
              label = "Please select the progress measure for which you would like to calculate a school VA score.",
              choices = c("Progress 8", "Progress 8 - English element", "Progress 8 - maths element", "Progress 8 - EBacc element", "Progress 8 - open element"),
              selected = "Progress 8",
              width = "72%",
              selectize = FALSE
            ),
            layout_columns(
              valueBoxOutput("boxavgschoolp8score", width = 12),
              valueBoxOutput("boxpupilnumberp8score", width = 12),
              col_widths = c(6, 6)
            ),
            p("The width of the confidence interval is determined by both the national standard deviation in the progress measure in question and the number of pupils in the school in the VA calculation. Smaller schools have wider confidence intervals because their VA score is based on a smaller number of pupils, so there is less evidence on which to judge the school’s effectiveness."),
            layout_columns(
              # valueBoxOutput("boxconfintp8score", width = 6),
              valueBoxOutput("boxuppconflimp8score", width = 12),
              valueBoxOutput("boxlowconflimp8score", width = 12),
              valueBoxOutput("boxp8scorenatcomp", width = 12),
              col_widths = c(4, 4, 4)
            ),
            p("If the whole range of the confidence interval is above the National Average line, we can say the school score is significantly above the national average, and we can be confident the school is helping its pupils make better than average progress."),
            p("Similarly, when the entire range of the confidence interval is below the National Average line, we can say the school score is significantly below the national average."),
            p("Finally, if the confidence interval straddles the National Average line, then we can say that the school is not significantly different from the national average, in other words, we cannot confidently say that the school's Progress 8 score is definitely above or definitely below the national average."),
            card(
              class = "border-0",
              card_header(h4("Comparison of value added score to the national average score")),
              card_body(plotlyOutput("errorbarchart"))
            )
          )
          #          h2("Select KS2 scaled score for READING"),
          #          valueBoxOutput("boxavgRevBal", width = 6),
          #          valueBoxOutput("boxpcRevBal", width = 6),
        ),
        nav_panel(
          "EBacc subject area",
          card(
            class = "border-0",
            p(
              strong("Please download a csv file your school's pupil scores from "),
              a(href = "https://tableschecking.education.gov.uk/", "https://tableschecking.education.gov.uk/", .noWS = c("after")),
              strong(" and upload the file here:")
            ),
            fileInput("user_input_VA_ebac",
              label = NULL,
              multiple = FALSE,
              accept = c("text/csv", "text/comma-separated-values", ".csv")
            ),
            card(
              class = "border-0",
              reactableOutput("user_view_ebac")
            ),
            selectInput("ebacelementinput",
              label = "Please select the EBacc subject area measure for which you would like to calculate a school VA score.",
              choices = c("KS2-4 English Baccalaureate - science subject area", "KS2-4 English Baccalaureate - humanities subject area", "KS2-4 English Baccalaureate - languages subject area"),
              selected = "KS2-4 English Baccalaureate - science subject area",
              width = "72%",
              selectize = FALSE
            ),
            layout_columns(
              valueBoxOutput("boxavgschoolebacscore", width = 12),
              valueBoxOutput("boxpupilnumberebacscore", width = 12),
              col_widths = c(6, 6)
            ),
            p("The width of the confidence interval is determined by both the national standard deviation in the progress measure in question and the number of pupils in the school in the VA calculation. Smaller schools have wider confidence intervals because their VA score is based on a smaller number of pupils, so there is less evidence on which to judge the school’s effectiveness."),
            layout_columns(
              # valueBoxOutput("boxconfintebacscore", width = 6),
              valueBoxOutput("boxuppconflimebacscore", width = 12),
              valueBoxOutput("boxlowconflimebacscore", width = 12),
              valueBoxOutput("boxebacscorenatcomp", width = 12),
              col_widths = c(4, 4, 4)
            ),
            p("If the whole range of the confidence interval is above the National Average line, we can say the school score is significantly above the national average, and we can be confident the school is helping its pupils make better than average progress."),
            p("Similarly, when the entire range of the confidence interval is below the National Average line, we can say the school score is significantly below the national average."),
            p("Finally, if the confidence interval straddles the National Average line, then we can say that the school is not significantly different from the national average, in other words, we cannot confidently say that the school's Progress 8 score is definitely above or definitely below the national average."),
            card(
              class = "border-0",
              card_header(htmlOutput("ebacerrorbarchart_title")),
              card_body(plotlyOutput("ebacerrorbarchart"))
            )
          )
        )
      )
    )
  )
}

dashboard2_panel <- function() {
  tabPanel(
    value = "dashboard2",
    "Pupil ready reckoner",
    gov_main_layout(
      h1("Pupil level ready reckoner"),
      navset_tab(
        id = "tabsetpanels2",
        nav_panel(
          "Progress 8",
          card(
            class = "border-0",
            tags$b("Select the pupil's key stage 2 scaled scores:"),
            layout_columns(
              selectInput("readinginput",
                label = tags$b("Reading"),
                choices = choicesPupil$label,
                selected = "Grade = N",
                selectize = FALSE
              ),
              selectInput("mathsinput",
                label = tags$b("Mathematics"),
                choices = choicesPupil$label,
                selected = "Grade = N",
                selectize = FALSE
              ),
              col_widths = c(6, 6)
            ),
            tags$em("If the pupil does not have a scaled score but has a grade 'N' or a teacher assessed grade, select 'N' or select their TAOUTCOME code and year."),
            layout_columns(
              valueBoxOutput("boxavgreadmaths", width = 12),
              valueBoxOutput("PAGcatbox", width = 12),
              valueBoxOutput("PAGbox", width = 12),
              col_widths = c(4, 4, 4)
            ),
            layout_columns(
              numericInput("p8scoreeng", p("Enter the pupil's key stage 4 attainment score for their P8 English element:"), 0, min = 0, max = 18, step = 0.01),
              numericInput("p8scoremath", p("Enter the pupil's key stage 4 attainment score for their P8 maths element:"), 0, min = 0, max = 18, step = 0.01),
              col_widths = c(6, 6)
            ),
            layout_columns(
              numericInput("p8scoreebac", p("Enter the pupil's key stage 4 attainment score for their P8 EBacc element:"), 0, min = 0, max = 27, step = 0.01),
              numericInput("p8scoreopen", p("Enter the pupil's key stage 4 attainment score for their P8 open element:"), 0, min = 0, max = 27, step = 0.01),
              col_widths = c(6, 6)
            ),

            # numericInput("p8score", p("Enter the pupil's key stage 4 attainment score:"), sum("input.p8scoreeng"), min = 0, max = 95, step = 0.01),
            uiOutput("p8scoreinputbox"),
            accordion(
              accordion_panel(
                "Progress 8 element",
                layout_columns(
                  valueBoxOutput("estimatedscorebox", width = 12),
                  valueBoxOutput("VAscorebox", width = 12),
                  valueBoxOutput("VAscoreavbox", width = 12),
                  col_widths = c(4, 4, 4)
                )
              ),
              accordion_panel(
                "Progress 8 - English element",
                layout_columns(
                  valueBoxOutput("estimatedscoreboxeng", width = 12),
                  valueBoxOutput("VAscoreboxeng", width = 12),
                  valueBoxOutput("VAscoreavboxeng", width = 12),
                  col_widths = c(4, 4, 4)
                )
              ),
              accordion_panel(
                "Progress 8 - maths element",
                layout_columns(
                  valueBoxOutput("estimatedscoreboxmath", width = 12),
                  valueBoxOutput("VAscoreboxmath", width = 12),
                  valueBoxOutput("VAscoreavboxmath", width = 12),
                  col_widths = c(4, 4, 4)
                )
              ),
              accordion_panel(
                "Progress 8 - EBacc element",
                layout_columns(
                  valueBoxOutput("estimatedscoreboxebac", width = 12),
                  valueBoxOutput("VAscoreboxebac", width = 12),
                  valueBoxOutput("VAscoreavboxebac", width = 12),
                  col_widths = c(4, 4, 4)
                )
              ),
              accordion_panel(
                "Progress 8 - open element",
                layout_columns(
                  valueBoxOutput("estimatedscoreboxopen", width = 12),
                  valueBoxOutput("VAscoreboxopen", width = 12),
                  valueBoxOutput("VAscoreavboxopen", width = 12),
                  col_widths = c(4, 4, 4)
                )
              )
            ),
            h4("Estimated against actual KS4 outcome"),
            plotlyOutput("estvsactual")
          )
        ),
        nav_panel(
          "EBacc subject area",
          card(
            class = "border-0",
            tags$b("Select the pupil's key stage 2 scaled scores:"),
            layout_columns(
              selectInput("readinginputebac",
                label = tags$b("Reading"),
                choices = choicesPupil$label,
                selected = "Grade = N",
                selectize = FALSE
              ),
              selectInput("mathsinputebac",
                label = tags$b("Mathematics"),
                choices = choicesPupil$label,
                selected = "Grade = N",
                selectize = FALSE
              ),
              col_widths = c(6, 6)
            ),
            tags$em("If the pupil does not have a scaled score but has a grade 'N' or a teacher assessed grade, select 'N' or select their TAOUTCOME code and year."),
            layout_columns(
              valueBoxOutput("boxavgreadmathsebac", width = 12),
              valueBoxOutput("PAGcatboxebac", width = 12),
              valueBoxOutput("PAGboxebac", width = 12),
              col_widths = c(4, 4, 4)
            ),
            #   h3("English Baccalaureate - science subject area"),
            layout_columns(
              numericInput(
                "ebacscoresci",
                p("Enter the pupil's score in the science EBacc element:"),
                0,
                min = 0, max = 9, step = 0.01
              ),
              numericInput(
                "ebacscorehum",
                p("Enter the pupil's score in the humanities EBacc element:"),
                0,
                min = 0, max = 9, step = 0.01
              ),
              numericInput(
                "ebacscorelan",
                p("Enter the pupil's score in the languages EBacc element:"),
                0,
                min = 0, max = 9, step = 0.01
              ),
              col_widths = c(4, 4, 4)
            ),
            layout_columns(
              valueBoxOutput("estimatedscoreboxebacsci", width = 12),
              valueBoxOutput("VAscoreboxebacsci", width = 12),
              col_widths = c(6, 6)
            ),
            # valueBoxOutput("VAscoreavbox", width = 6)),
            #  h3("English Baccalaureate - humanities subject area"),
            layout_columns(
              valueBoxOutput("estimatedscoreboxebachum", width = 12),
              valueBoxOutput("VAscoreboxebachum", width = 12),
              col_widths = c(6, 6)
            ),
            # valueBoxOutput("VAscoreavboxeng", width = 6),
            #   h3("English Baccalaureate - languages subject area"),
            layout_columns(
              valueBoxOutput("estimatedscoreboxebaclan", width = 12),
              valueBoxOutput("VAscoreboxebaclan", width = 12),
              col_widths = c(6, 6)
            ),
            #     valueBoxOutput("VAscoreavboxebaclan", width = 6)),
            radioGroupButtons("chartbutton",
              label = "Choose which metric you would like to view:",
              choices = c("Science", "Humanities", "Languages")
            ),
            h4("Estimated against actual KS4 outcome"),
            conditionalPanel(
              "input.chartbutton == 'Science'",
              plotlyOutput("estvsactualebacsci")
            ),
            conditionalPanel(
              "input.chartbutton == 'Humanities'",
              plotlyOutput("estvsactualebachum")
            ),
            conditionalPanel(
              "input.chartbutton == 'Languages'",
              plotlyOutput("estvsactualebaclan")
            )
            # ,
            #    br(),
            #    br(),
            #    br(),
            #    h3("Progress 8 - EBacc element"),
            #    br(),
            #    numericInput("p8scoreebac", p("Enter the pupil's key stage 4 attainment score for their P8 EBacc element:"), 0, min = 0, max = 27, step = 0.01),
            #    valueBoxOutput("estimatedscoreboxebac", width = 6),
            #    valueBoxOutput("VAscoreboxebac", width = 6),
            #    valueBoxOutput("VAscoreavboxebac", width = 6),
            #    br(),
            #    br(),
            #    br(),
            #    h3("Progress 8 - open element"),
            #    br(),
            #    numericInput("p8scoreopen", p("Enter the pupil's key stage 4 attainment score for their P8 open element:"), 0, min = 0, max = 27, step = 0.01),
            #    valueBoxOutput("estimatedscoreboxopen", width = 6),
            #    valueBoxOutput("VAscoreboxopen", width = 6),
            #    valueBoxOutput("VAscoreavboxopen", width = 6)
          )
        )
      )
    )
  )
}
## work from here

dashboard3_panel <- function() {
  tabPanel(
    "Model values",
    gov_main_layout(
      gov_row(
        column(
          12,
          h1("Model values"),
        ),
        card(
          card_header(
            class = "bg-primary",
            h2("PAGs, Attainment 8 splits and standard deviations")
          ),
          card_body(
            p(
              "You can download an Excel file containing all of the ",
              a(href = "https://content.explore-education-statistics.service.gov.uk/api/releases/82449810-99ca-4307-adc2-08d9ebca404d/files/95833e9f-b99e-432c-9f09-fec0f8906625", "model values tables here.")
            ),
            p("Each Attainment 8 average is the average Attainment 8 score of all pupils nationally in
                  state-funded mainstream schools within the same prior attainment group at KS2. The
                  following table shows the revised Attainment 8 averages for each KS2 prior
                  attainment group, based on the 2023 cohort averages."),
            ##           p("Changes to national subject entry patterns and performance, as well as changes to the
            ##                             methodology and grading as a result of COVID-19 this year will cause these averages to
            ##                            change in future years."),
            p("Schools may change their curriculum offer in response to the
                  Progress 8 measure and to the Government’s EBacc ambition, so any modelling based
                  on current national results could be misleading."),
            h3("Progress 8 PAGs and Attainment 8 splits"),
            reactable(
              p8att8splits,
              defaultColDef = colDef(format = colFormat(digits = 2)),
              columns = list(
                "KS2 prior attainment group" = colDef(format = colFormat(digits = 0))
              )
            ),
            h3("EBacc subject area PAGs and Attainment 8 splits"),
            reactable(
              ebacatt8splits,
              defaultColDef = colDef(format = colFormat(digits = 2)),
              columns = list(
                "KS2 prior attainment group" = colDef(format = colFormat(digits = 0))
              )
            ),
            p("The below standard deviations are based on the Progress 8 scores of all eligible pupils at
                  mainstream schools and are the national figures used in confidence interval calculations."),
            h3("Progress 8 standard deviations"),
            reactable(
              p8stdevnamed,
              defaultColDef = colDef(format = colFormat(digits = 2))
            ),
            h3("EBacc subject area standard deviations"),
            reactable(
              ebacstdevnamed,
              defaultColDef = colDef(format = colFormat(digits = 2))
            ),
            ("For more information on these tables, please click here for the"),
            (a(href = "https://assets.publishing.service.gov.uk/media/652fad41d0666200131b7c47/Secondary_accountability_measures_-_2023_guidance_for_maintained_secondary_schools__academies_and_free_schools.pdf", "Secondary Accountability measures document."))
          )
        )
      )
    )
  )
}
