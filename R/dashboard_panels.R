homepage_panel <- function() {
  tabPanel(
    "Homepage",
    gov_main_layout(
      gov_row(
        column(
          12,
          h1("KS4 Ready Reckoner dashboard"),
          br(),
          br()
        ),

        ## Left panel -------------------------------------------------------

        column(
          12, # 6,--AB trial
          div(
            div(
              class = "panel panel-info",
              div(
                class = "panel-heading",
                style = "color: white;font-size: 18px;font-style: bold; background-color: #1d70b8;",
                h2("Guidance")
              ),
              div(
                class = "panel-body",
                tags$div(
                  br(),
                  strong("UPDATE: 2nd February 2023 - The KS4 Ready Reckoners have been updated with revised data, in line with the revised key stage 4 performance release"),
                  br(),
                  br(),
                  h3("Introduction"),
                  p("There are four key stage 2 to 4 ready reckoners:"),
                  strong("The Progress 8 element breakdown pupil ready reckoner."),
                  ("The aim of this is to help the user to understand how we arrive at a value added score for their pupil. The ready reckoner allows the user to input, for an individual pupil, their key stage 2 prior attainment and key stage 4 outcome in Progress 8 or any of its elements."),
                  br(),
                  br(),
                  strong("The Progress 8 element breakdown school ready reckoner."),
                  ("The aim of this is to help the user understand how we arrive at a value added score for their school. The ready reckoner allows the user to input the value added scores in Progress 8 or any of its elements, for all pupils in their school. These value added scores can be copied and pasted directly from the pupil level file on the "),
                  (a(href = "https://tableschecking.education.gov.uk/", "checking site.")),
                  br(),
                  br(),
                  strong("The EBacc subject pupil ready reckoner."),
                  ("The aim of this is to help the user to understand how we arrive at a value added score for their pupil. The ready reckoner allows the user to input, for an individual pupil, their key stage 2 prior attainment and key stage 4 attainment in any of the three subject areas in the English Baccalaureate."),
                  br(),
                  br(),
                  strong("The EBacc subject school ready reckoner."),
                  ("The aim of this is to help the user understand how we arrive at a value added score for their school. The ready reckoner allows the user to input the value added scores in any of the three subject areas in the English Baccalaureate, for all pupils in their school. These value added scores can be copied and pasted directly from the pupil level file on the "),
                  (a(href = "https://tableschecking.education.gov.uk/", "checking site.")),
                  br(),
                  br(),
                  br(),
                  h3("How to use this app"),
                  p("1) Select the 'School ready reckoner' or 'Pupil ready reckoner' tab from the left side bar."),
                  p("2) Follow the instructions steps within.")
                ),
                br()
              )
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
      gov_row(
        column(
          width = 12,
          h1("School level ready reckoner")
        ),
        column(
          width = 12,
          tabsetPanel(
            id = "tabsetpanels",
            tabPanel(
              "Progress 8",
              fluidRow(
                column(
                  width = 12,
                  br(),
                  strong("Please download a csv file your school's pupil scores from "),
                  a(href = "https://tableschecking.education.gov.uk/", "https://tableschecking.education.gov.uk/", .noWS = c("after")),
                  strong(" and upload the file here:"),
                  fileInput("user_input_VA",
                    label = NULL,
                    # (a(href="https://tableschecking.education.gov.uk/",  "https://tableschecking.education.gov.uk/ and upload the file here:")),
                    multiple = FALSE,
                    accept = c("text/csv", "text/comma-separated-values", ".csv")
                  ),
                  br(),
                  DT::dataTableOutput("user_view"),
                  selectInput("p8elementinput",
                    label = "Please select the progress measure for which you would like to calculate a school VA score.",
                    choices = c("Progress 8", "Progress 8 - English element", "Progress 8 - maths element", "Progress 8 - EBacc element", "Progress 8 - open element"),
                    selected = "Progress 8"
                  ),
                  valueBoxOutput("boxavgschoolp8score", width = 6),
                  valueBoxOutput("boxpupilnumberp8score", width = 6),
                  p("The width of the confidence interval is determined by both the national standard deviation in the progress measure in question and the number of pupils in the school in the VA calculation. Smaller schools have wider confidence intervals because their VA score is based on a smaller number of pupils, so there is less evidence on which to judge the school’s effectiveness."),
                  gov_row(
                    # valueBoxOutput("boxconfintp8score", width = 6),
                    valueBoxOutput("boxuppconflimp8score", width = 6),
                    valueBoxOutput("boxlowconflimp8score", width = 6),
                    valueBoxOutput("boxp8scorenatcomp", width = 6)
                  ),
                  p("If the whole range of the confidence interval is above the National Average line, we can say the school score is significantly above the national average, and we can be confident the school is helping its pupils make better than average progress."),
                  p("Similarly, when the entire range of the confidence interval is below the National Average line, we can say the school score is significantly below the national average."),
                  p("Finally, if the confidence interval straddles the National Average line, then we can say that the school is not significantly different from the national average, in other words, we cannot confidently say that the school's Progress 8 score is definitely above or definitely below the national average."),
                  h4("Comparison of value added score to the national average score"),
                  plotlyOutput("errorbarchart")
                )
                #          h2("Select KS2 scaled score for READING"),
                #          valueBoxOutput("boxavgRevBal", width = 6),
                #          valueBoxOutput("boxpcRevBal", width = 6),
              )
            ),
            tabPanel(
              "EBacc subject area",
              fluidRow(
                column(
                  width = 12,
                  br(),
                  strong("Please download a csv file your school's pupil scores from "),
                  a(href = "https://tableschecking.education.gov.uk/", "https://tableschecking.education.gov.uk/", .noWS = c("after")),
                  strong(" and upload the file here:"),
                  fileInput("user_input_VA_ebac",
                    label = NULL,
                    multiple = FALSE,
                    accept = c("text/csv", "text/comma-separated-values", ".csv")
                  ),
                  br(),
                  br(),
                  DT::dataTableOutput("user_view_ebac"),
                  selectInput("ebacelementinput",
                    label = "Please select the EBacc subject area measure for which you would like to calculate a school VA score.",
                    choices = c("KS2-4 English Baccalaureate - science subject area", "KS2-4 English Baccalaureate - humanities subject area", "KS2-4 English Baccalaureate - languages subject area"),
                    selected = "KS2-4 English Baccalaureate - science subject area"
                  ),
                  valueBoxOutput("boxavgschoolebacscore", width = 6),
                  valueBoxOutput("boxpupilnumberebacscore", width = 6),
                  p("The width of the confidence interval is determined by both the national standard deviation in the progress measure in question and the number of pupils in the school in the VA calculation. Smaller schools have wider confidence intervals because their VA score is based on a smaller number of pupils, so there is less evidence on which to judge the school’s effectiveness."),
                  gov_row(
                    # valueBoxOutput("boxconfintebacscore", width = 6),
                    valueBoxOutput("boxuppconflimebacscore", width = 6),
                    valueBoxOutput("boxlowconflimebacscore", width = 6),
                    valueBoxOutput("boxebacscorenatcomp", width = 6)
                  ),
                  p("If the whole range of the confidence interval is above the National Average line, we can say the school score is significantly above the national average, and we can be confident the school is helping its pupils make better than average progress."),
                  p("Similarly, when the entire range of the confidence interval is below the National Average line, we can say the school score is significantly below the national average."),
                  p("Finally, if the confidence interval straddles the National Average line, then we can say that the school is not significantly different from the national average, in other words, we cannot confidently say that the school's Progress 8 score is definitely above or definitely below the national average."),
                  column(
                    width = 12,
                    htmlOutput("ebacerrorbarchart_title"),
                    plotlyOutput("ebacerrorbarchart")
                  )
                )
              )
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

    # Define UI for application that draws a histogram

    # Sidebar with a slider input for number of bins
    gov_main_layout(
      gov_row(
        column(
          width = 12,
          h1("Pupil level ready reckoner")
        ),
        column(
          width = 12,
          tabsetPanel(
            id = "tabsetpanels2",
            tabPanel(
              "Progress 8",
              fluidRow(
                column(
                  width = 12,
                  h3("Select the pupil's key stage 2 scaled score for READING"),
                  selectInput("readinginput",
                    label = "If the pupil does not have a scaled score but has a grade 'N' or a teacher assessed grade, select 'N' or select their TAOUTCOME code and year.",
                    choices = choicesPupil$label,
                    selected = "Grade = N"
                  ),
                  h3("Select the pupil's key stage 2 scaled score for MATHEMATICS"),
                  selectInput("mathsinput",
                    label = "If the pupil does not have a scaled score but has a grade 'N' or a teacher assessed grade, select 'N' or select their TAOUTCOME code and year.",
                    choices = choicesPupil$label,
                    selected = "Grade = N"
                  ),
                  gov_row(
                    valueBoxOutput("boxavgreadmaths", width = 6),
                    valueBoxOutput("PAGcatbox", width = 6),
                    valueBoxOutput("PAGbox", width = 6)
                  ),
                  gov_row(
                    column(
                      width = 6,
                      numericInput("p8scoreeng", p("Enter the pupil's key stage 4 attainment score for their P8 English element:"), 0, min = 0, max = 18, step = 0.01),
                      numericInput("p8scoremath", p("Enter the pupil's key stage 4 attainment score for their P8 maths element:"), 0, min = 0, max = 18, step = 0.01)
                    ),
                    column(
                      width = 6,
                      numericInput("p8scoreebac", p("Enter the pupil's key stage 4 attainment score for their P8 EBacc element:"), 0, min = 0, max = 27, step = 0.01),
                      numericInput("p8scoreopen", p("Enter the pupil's key stage 4 attainment score for their P8 open element:"), 0, min = 0, max = 27, step = 0.01)
                    ),

                    # numericInput("p8score", p("Enter the pupil's key stage 4 attainment score:"), sum("input.p8scoreeng"), min = 0, max = 95, step = 0.01),
                    column(
                      width = 12,
                      uiOutput("p8scoreinputbox")
                    )
                  ),
                  gov_row(
                    h3("Progress 8 element"),
                    valueBoxOutput("estimatedscorebox", width = 6),
                    valueBoxOutput("VAscorebox", width = 6),
                    valueBoxOutput("VAscoreavbox", width = 6)
                  ),
                  gov_row(
                    h3("Progress 8 - English element"),
                    valueBoxOutput("estimatedscoreboxeng", width = 6),
                    valueBoxOutput("VAscoreboxeng", width = 6),
                    valueBoxOutput("VAscoreavboxeng", width = 6)
                  ),
                  gov_row(
                    h3("Progress 8 - maths element"),
                    valueBoxOutput("estimatedscoreboxmath", width = 6),
                    valueBoxOutput("VAscoreboxmath", width = 6),
                    valueBoxOutput("VAscoreavboxmath", width = 6)
                  ),
                  gov_row(
                    h3("Progress 8 - EBacc element"),
                    valueBoxOutput("estimatedscoreboxebac", width = 6),
                    valueBoxOutput("VAscoreboxebac", width = 6),
                    valueBoxOutput("VAscoreavboxebac", width = 6)
                  ),
                  gov_row(
                    h3("Progress 8 - open element"),
                    valueBoxOutput("estimatedscoreboxopen", width = 6),
                    valueBoxOutput("VAscoreboxopen", width = 6),
                    valueBoxOutput("VAscoreavboxopen", width = 6)
                  ),
                  column(
                    width = 12,
                    h4("Estimated against actual KS4 outcome"),
                    plotlyOutput("estvsactual")
                  )
                )
              )
            )
            #                            )

            ,
            tabPanel(
              "EBacc subject area",
              fluidRow(
                column(
                  width = 12,
                  h3("Select the pupil's key stage 2 scaled score for READING"),
                  selectInput("readinginputebac",
                    label = "If the pupil does not have a scaled score but has a grade 'N' or a teacher assessed grade, select 'N' or select their TAOUTCOME code and year.",
                    choices = choicesPupil$label,
                    selected = "Grade = N"
                  ),
                  h3("Select the pupil's key stage 2 scaled score for MATHEMATICS"),
                  selectInput("mathsinputebac",
                    label = "If the pupil does not have a scaled score but has a grade 'N' or a teacher assessed grade, select 'N' or select their TAOUTCOME code and year.",
                    choices = choicesPupil$label,
                    selected = "Grade = N"
                  ), gov_row(
                    valueBoxOutput("boxavgreadmathsebac", width = 6),
                    valueBoxOutput("PAGcatboxebac", width = 6),
                    valueBoxOutput("PAGboxebac", width = 6)
                  ),
                  #   h3("English Baccalaureate - science subject area"),
                  br(), gov_row(
                    column(
                      width = 4,
                      numericInput("ebacscoresci", p("Enter the pupil's score in the science EBacc element:"), 0, min = 0, max = 9, step = 0.01)
                    ),
                    column(
                      width = 4,
                      numericInput("ebacscorehum", p("Enter the pupil's score in the humanities EBacc element:"), 0, min = 0, max = 9, step = 0.01)
                    ),
                    column(
                      width = 4,
                      numericInput("ebacscorelan", p("Enter the pupil's score in the languages EBacc element:"), 0, min = 0, max = 9, step = 0.01)
                    )
                  ),
                  valueBoxOutput("estimatedscoreboxebacsci", width = 6),
                  valueBoxOutput("VAscoreboxebacsci", width = 6),
                  # valueBoxOutput("VAscoreavbox", width = 6)),
                  #  h3("English Baccalaureate - humanities subject area"),
                  valueBoxOutput("estimatedscoreboxebachum", width = 6),
                  valueBoxOutput("VAscoreboxebachum", width = 6),
                  # valueBoxOutput("VAscoreavboxeng", width = 6),
                  #   h3("English Baccalaureate - languages subject area"),
                  valueBoxOutput("estimatedscoreboxebaclan", width = 6),
                  valueBoxOutput("VAscoreboxebaclan", width = 6),
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
          br(),
          br()
        ),
        column(
          12, # 6,--AB trial
          div(
            div(
              class = "panel panel-info",
              div(
                class = "panel-heading",
                style = "color: white;font-size: 18px;font-style: bold; background-color: #1d70b8;",
                h2("PAGs, Attainment 8 splits and standard deviations")
              ),
              div(
                class = "panel-body",
                tags$div(
                  ("You can download an Excel file containing all of the "),
                  (a(href = "https://content.explore-education-statistics.service.gov.uk/api/releases/f27addae-752f-478c-b142-663f12aea8e1/files/1726d8ac-3e93-4a89-3692-08dabce881f8", "model values tables here.")),
                  br(),
                  br(),
                  p("Each Attainment 8 average is the average Attainment 8 score of all pupils nationally in
                  state-funded mainstream schools within the same prior attainment group at KS2. The
                  following table shows the provisional Attainment 8 averages for each KS2 prior
                  attainment group, based on the 2022 cohort averages."),
                  p("Changes to national subject entry patterns and performance, as well as changes to the
                  methodology and grading as a result of COVID-19 this year will cause these averages to
                  change in future years."),
                  p("Schools may change their curriculum offer in response to the
                  Progress 8 measure and to the Government’s EBacc ambition, so any modelling based
                  on current national results could be misleading."),
                  h3("Progress 8 PAGs and Attainment 8 splits"),
                  reactable(p8att8splits),
                  h3("EBacc subject area PAGs and Attainment 8 splits"),
                  reactable(ebacatt8splits),
                  br(),
                  br(),
                  br(),
                  br(),
                  p("The below standard deviations are based on the Progress 8 scores of all eligible pupils at
                  mainstream schools and are the national figures used in confidence interval calculations."),
                  h3("Progress 8 standard deviations"),
                  reactable(p8stdevnamed),
                  h3("EBacc subject area standard deviations"),
                  reactable(ebacstdevnamed),
                  br(),
                  br(),
                  ("For more information on these tables, please click here for the "),
                  (a(href = "https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/1112046/Secondary_accountability_measures_2022_guide.pdf", "Secondary Accountability measures document."))
                )
              )
            )
          )
        )
      )
    )
  )
}
