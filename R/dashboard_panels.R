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
          12, #6,--AB trial
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
                  title = "This section is useful if you want to understand how well different industries retain graduates.",
                  h3("Introduction"),
                  p("There are four key stage 2 to 4 ready reckoners:"),
                  strong("The Progress 8 element breakdown pupil ready reckoner."),
                  ("The aim of this is to help the user to understand how we arrive at a value added score for their pupil. The ready reckoner allows the user to input, for an individual pupil, their key stage 2 prior attainment and key stage 4 outcome in Progress 8 or any of its elements."),
                  br(),
                  br(),
                  strong("The Progress 8 element breakdown school ready reckoner."),
                  ("The aim of this is to help the user understand how we arrive at a value added score for their school. The ready reckoner allows the user to input the value added scores in Progress 8 or any of its elements, for all pupils in their school. These value added scores can be copied and pasted directly from the pupil level file on the "),
                  (a(href="https://www.compare-school-performance.service.gov.uk/", "checking site")),
                  br(),
                  br(),
                  strong("The EBacc subject pupil ready reckoner."),
                  ("The aim of this is to help the user to understand how we arrive at a value added score for their pupil. The ready reckoner allows the user to input, for an individual pupil, their key stage 2 prior attainment and key stage 4 attainment in any of the three subject areas in the English Baccalaureate."),
                  br(),
                  br(),
                  strong("The EBacc subject school ready reckoner."),
                  ("The aim of this is to help the user understand how we arrive at a value added score for their school. The ready reckoner allows the user to input the value added scores in any of the three subject areas in the English Baccalaureate, for all pupils in their school. These value added scores can be copied and pasted directly from the pupil level file on the "),
                  (a(href="https://www.compare-school-performance.service.gov.uk/", "checking site.")),
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
        )#,
        
       # Right panel ------------------------------------------------------
        
      # column(
      #     1,
      #     div(
      #       div(
      #         class = "panel panel-info",
      #         div(
#               class = "panel-heading",
#                style = "color: white;font-size: 18px;font-style: bold; background-color: #1d70b8;",
#               h2("How to use")
#              ),
#              div(
#                class = "panel-body",
#                strong("1) Select the 'School' or 'Pupil ready reckoner' tab from the left side bar."),
#                br(),
#                br(),
#                strong("2) Follow the instructions steps within.")
#             )
#            )
#          )
#        )
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
          width=12,
        h1("School level ready reckoner")
        ),
        
        column(
          width=12,
               tabsetPanel(id = "tabsetpanels",
                 tabPanel(
                   "Progress 8",
                   fluidRow(
                     column(
                       width=12,
          fileInput("user_input_VA",
                    "Please download a csv file your school's pupil scores from https://tableschecking.education.gov.uk/ and upload the file here:",
                    multiple = FALSE,
                    accept = c('text/csv','text/comma-separated-values','.csv')),
          br(),
          DT::dataTableOutput("user_view"),
          valueBoxOutput("boxavgschoolp8score", width = 6),
          valueBoxOutput("boxpupilnumberp8score", width = 6),
          valueBoxOutput("boxconfintp8score", width = 6),
#          h2("Select KS2 scaled score for READING"),
#          valueBoxOutput("boxavgRevBal", width = 6),
#          valueBoxOutput("boxpcRevBal", width = 6),
          box(
            width=12,
          plotlyOutput("lineRevBal")))
        )
        ),
        tabPanel(
          "EBacc subject area",
          fluidRow(
            column(
              width=12,
              fileInput("user_input_VA_ebac",
                        "Please download a csv file your school's pupil scores from https://tableschecking.education.gov.uk/ and upload the file here:",
                        multiple = FALSE,
                        accept = c('text/csv','text/comma-separated-values','.csv')),
              br(),
              DT::dataTableOutput("user_view_ebac"),
          h2("Outputs 2 (h2)"),
          p("This is the standard paragraph style for adding guiding info around data content."),
          column(
            width=6,
            box(
              width=12,
              plotlyOutput("colBenchmark")
            )
          ),
          column(
            width=6,
            div(
              class = "well",
              style = "min-height: 100%; height: 100%; overflow-y: visible",
              fluidRow(
                # column(
                #   width=12,
                #   selectizeInput("selectBenchLAs",
                #                  "Select benchamrk LAs",
                #                  choices = choicesLAs$area_name,
                #                  multiple=TRUE,
                #                  options = list(maxItems = 3)
                #   )
                # )
                  )
              ),
                dataTableOutput("tabBenchmark")
          ))
        ))
              )
        )
        # add box to show user input
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
          width=12,
          h1("Pupil level ready reckoner")
        ),
        
        column(
          width=12,
          tabsetPanel(id = "tabsetpanels",
                      tabPanel(
                        "Progress 8",
                        fluidRow(
                          column(
                            width=12,
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
                            valueBoxOutput("PAGbox", width = 6)),
                            column(width = 6, 
                                    numericInput("p8scoreeng", p("Enter the pupil's key stage 4 attainment score for their P8 English element:"), 0, min = 0, max = 18, step = 0.01),
                                   numericInput("p8scoremath", p("Enter the pupil's key stage 4 attainment score for their P8 maths element:"), 0, min = 0, max = 18, step = 0.01)),
                            column(width = 6, 
                            numericInput("p8scoreebac", p("Enter the pupil's key stage 4 attainment score for their P8 EBacc element:"), 0, min = 0, max = 27, step = 0.01),
                            numericInput("p8scoreopen", p("Enter the pupil's key stage 4 attainment score for their P8 open element:"), 0, min = 0, max = 27, step = 0.01)),
                            
                            #numericInput("p8score", p("Enter the pupil's key stage 4 attainment score:"), sum("input.p8scoreeng"), min = 0, max = 95, step = 0.01),
                            column(width = 12, 
                                   uiOutput('p8scoreinputbox')),
                            gov_row(
                            h3("Progress 8 element"),
                            valueBoxOutput("estimatedscorebox", width = 6),
                            valueBoxOutput("VAscorebox", width = 6),
                            valueBoxOutput("VAscoreavbox", width = 6)),
                            gov_row(
                            h3("Progress 8 - English element"),
                            valueBoxOutput("estimatedscoreboxeng", width = 6),
                            valueBoxOutput("VAscoreboxeng", width = 6),
                            valueBoxOutput("VAscoreavboxeng", width = 6)),
                            gov_row(
                            h3("Progress 8 - maths element"),
                            valueBoxOutput("estimatedscoreboxmath", width = 6),
                            valueBoxOutput("VAscoreboxmath", width = 6),
                            valueBoxOutput("VAscoreavboxmath", width = 6)),
                        gov_row(
                        h3("Progress 8 - EBacc element"),
                        valueBoxOutput("estimatedscoreboxebac", width = 6),
                        valueBoxOutput("VAscoreboxebac", width = 6),
                        valueBoxOutput("VAscoreavboxebac", width = 6)),
                        gov_row(
                        h3("Progress 8 - open element"),
                        valueBoxOutput("estimatedscoreboxopen", width = 6),
                        valueBoxOutput("VAscoreboxopen", width = 6),
                        valueBoxOutput("VAscoreavboxopen", width = 6)),
                        column(
                          width = 12,
                          plotlyOutput("estvsactual")))))
#                            )
                        
                      ,
                      tabPanel(
                        "EBacc subject area",
                        fluidRow(
                          column(
                            width=12,
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
                            ),gov_row(
                            valueBoxOutput("boxavgreadmathsebac", width = 6),
                            valueBoxOutput("PAGcatboxebac", width = 6),
                            valueBoxOutput("PAGboxebac", width = 6)),
                         #   h3("English Baccalaureate - science subject area"),
                            br(),gov_row(
                         column(width = 4,
                            numericInput("ebacscoresci", p("Enter the pupil's score in the science EBacc element:"), 0, min = 0, max = 9, step = 0.01)),
                         column(width = 4,
                            numericInput("ebacscorehum", p("Enter the pupil's score in the humanities EBacc element:"), 0, min = 0, max = 9, step = 0.01)),
                         column(width = 4,
                            numericInput("ebacscorelan", p("Enter the pupil's score in the languages EBacc element:"), 0, min = 0, max = 9, step = 0.01))),
                            valueBoxOutput("estimatedscoreboxebacsci", width = 6),
                            valueBoxOutput("VAscoreboxebacsci", width = 6),
                            #valueBoxOutput("VAscoreavbox", width = 6)),
                        #  h3("English Baccalaureate - humanities subject area"),
                          valueBoxOutput("estimatedscoreboxebachum", width = 6),
                          valueBoxOutput("VAscoreboxebachum", width = 6),
                          #valueBoxOutput("VAscoreavboxeng", width = 6),
                       #   h3("English Baccalaureate - languages subject area"),
                          valueBoxOutput("estimatedscoreboxebaclan", width = 6),
                          valueBoxOutput("VAscoreboxebaclan", width = 6),
                     #     valueBoxOutput("VAscoreavboxebaclan", width = 6)),
                     radioGroupButtons('chartbutton', 
                                       label = "Choose which metric you would like to view:",
                                       choices = c('Science', 'Humanities', 'Languages')),
                     conditionalPanel("input.chartbutton == 'Science'",
                       plotlyOutput("estvsactualebacsci")),
                     conditionalPanel("input.chartbutton == 'Humanities'",
                       plotlyOutput("estvsactualebachum")),
                     conditionalPanel("input.chartbutton == 'Languages'",
                          plotlyOutput("estvsactualebaclan"))
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
                        ))
          ))
        )))
        # add box to show user input
  
}