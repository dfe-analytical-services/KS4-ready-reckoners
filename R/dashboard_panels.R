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
          h2("Select KS2 scaled score for READING"),
          valueBoxOutput("boxavgRevBal", width = 6),
          valueBoxOutput("boxpcRevBal", width = 6),
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
                                        choices = list(
                                          "Exam year 2016, TAOUTCOME = 'BLW'" = 70,
                                          "Exam year 2016, TAOUTCOME = 'PKF'" = 73,
                                          "Exam year 2016, TAOUTCOME = 'PKE'" = 76,
                                          "Exam year 2016, TAOUTCOME = 'PKG'" = 79,
                                          "Exam year 2017, TAOUTCOME = 'BLW'" = 71,
                                          "Exam year 2017, TAOUTCOME = 'PKF'" = 73,
                                          "Exam year 2017, TAOUTCOME = 'PKE'" = 76,
                                          "Exam year 2017, TAOUTCOME = 'PKG'" = 79,
                                          "Grade = N" = 79,"80" = 80,"81" = 81, "82" = 82,"83" = 83,"84" = 84,"85" = 85,"86" = 86,"87" = 87,"88" = 88,"89" = 89,
                                          "90" = 90,"91" = 91,"92" = 92,"93" = 93,"94" = 94,"95" = 95,"96" = 96,"97" = 97,"98" = 98,"99" = 99,
                                          "100" = 100,"101" = 101,"102" = 102,
                                          "103" = 103,
                                          "104" = 104,
                                          "105" = 105,
                                          "106" = 106,
                                          "107" = 107,
                                          "108" = 108,
                                          "109" = 109,
                                          "110" = 110,
                                          "111" = 111,
                                          "112" = 112,
                                          "113" = 113,
                                          "114" = 114,
                                          "115" = 115,
                                          "116" = 116,
                                          "117" = 117,
                                          "118" = 118,
                                          "119" = 119,
                                          "120" = 120
                                      
                                        ),
                                        selected = "Grade = N"
                            ),
                            h3("Select the pupil's key stage 2 scaled score for MATHEMATICS"),
                            selectInput("mathsinput",
                                        label = "If the pupil does not have a scaled score but has a grade 'N' or a teacher assessed grade, select 'N' or select their TAOUTCOME code and year.",
                                        choices = list(
                                          "Exam year 2016, TAOUTCOME = 'BLW'" = 70,
                                          "Exam year 2016, TAOUTCOME = 'PKF'" = 73,
                                          "Exam year 2016, TAOUTCOME = 'PKE'" = 76,
                                          "Exam year 2016, TAOUTCOME = 'PKG'" = 79,
                                          "Exam year 2017, TAOUTCOME = 'BLW'" = 71,
                                          "Exam year 2017, TAOUTCOME = 'PKF'" = 73,
                                          "Exam year 2017, TAOUTCOME = 'PKE'" = 76,
                                          "Exam year 2017, TAOUTCOME = 'PKG'" = 79,
                                          "Grade = N" = 79,
                                          "80" = 80,
                                          "81" = 81,
                                          "82" = 82,
                                          "83" = 83,
                                          "84" = 84,
                                          "85" = 85,
                                          "86" = 86,
                                          "87" = 87,
                                          "88" = 88,
                                          "89" = 89,
                                          "90" = 90,
                                          "91" = 91,
                                          "92" = 92,
                                          "93" = 93,
                                          "94" = 94,
                                          "95" = 95,
                                          "96" = 96,
                                          "97" = 97,
                                          "98" = 98,
                                          "99" = 99,
                                          "100" = 100,
                                          "101" = 101,
                                          "102" = 102,
                                          "103" = 103,
                                          "104" = 104,
                                          "105" = 105,
                                          "106" = 106,
                                          "107" = 107,
                                          "108" = 108,
                                          "109" = 109,
                                          "110" = 110,
                                          "111" = 111,
                                          "112" = 112,
                                          "113" = 113,
                                          "114" = 114,
                                          "115" = 115,
                                          "116" = 116,
                                          "117" = 117,
                                          "118" = 118,
                                          "119" = 119,
                                          "120" = 120
                                          
                                        ),
                                        selected = "Grade = N"
                            ),
                            h3("Pupil's KS2 average point score"),
                            valueBoxOutput("boxavgreadmaths", width = 12),
                            textOutput('test')
                            #,
                            # valueBoxOutput("boxpcRevBal", width = 12),
                          #  box(
                           #     width=12,
                          #     plotlyOutput("avgreadmaths"))
                            )
                        )
                      ),
                      tabPanel(
                        "EBacc subject area",
                        fluidRow(
                          column(
                            width=12,
                            h2("Outputs 2 (h2)"),
                            p("This is the standard paragraph style for adding guiding info around data content.")
                            ),
                              )#,
                              #dataTableOutput("tabBenchmark")
                            ))
                        ))
          )
        )
        # add box to show user input
  
}