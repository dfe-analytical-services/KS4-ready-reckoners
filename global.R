# ---------------------------------------------------------
# This is the global file.
# Use it to store functions, library calls, source files etc.
# Moving these out of the server file and into here improves performance
# The global file is run only once when the app launches and stays consistent across users
# whereas the server and UI files are constantly interacting and responsive to user input.
#
# ---------------------------------------------------------


# Library calls ---------------------------------------------------------------------------------
shhh <- suppressPackageStartupMessages # It's a library, so shhh!
shhh(library(htmltools))
shhh(library(shiny))
shhh(library(shinyjs))
shhh(library(tools))
shhh(library(testthat))
shhh(library(shinytest2))
shhh(library(shinyWidgets))
shhh(library(shinydashboard))
shhh(library(shinyGovstyle))
shhh(library(bslib))
shhh(library(dplyr))
shhh(library(ggplot2))
shhh(library(plotly))
shhh(library(DT))
shhh(library(shinyvalidate))
shhh(library(metathis))
shhh(library(reactable))
shhh(library(dfeshiny))

# Functions ---------------------------------------------------------------------------------

# Here's an example function for simplifying the code needed to commas separate numbers:

# cs_num ----------------------------------------------------------------------------
# Comma separating function

cs_num <- function(value) {
  format(value, big.mark = ",", trim = TRUE)
}

# tidy_code_function -------------------------------------------------------------------------------
# Code to tidy up the scripts.

tidy_code_function <- function() {
  message("----------------------------------------")
  message("App scripts")
  message("----------------------------------------")
  app_scripts <- eval(styler::style_dir(recursive = FALSE)$changed)
  message("R scripts")
  message("----------------------------------------")
  r_scripts <- eval(styler::style_dir("R/")$changed)
  message("Test scripts")
  message("----------------------------------------")
  test_scripts <- eval(styler::style_dir("tests/", filetype = "r")$changed)
  script_changes <- c(app_scripts, r_scripts, test_scripts)
  return(script_changes)
}

# Source scripts ---------------------------------------------------------------------------------

# Source any scripts here. Scripts may be needed to process data before it gets to the server file.
# It's best to do this here instead of the server file, to improve performance.

# source("R/filename.r")


# appLoadingCSS ----------------------------------------------------------------------------
# Set up loading screen

appLoadingCSS <- "
#loading-content {
  position: absolute;
  background: #000000;
  opacity: 0.9;
  z-index: 100;
  left: 0;
  right: 0;
  height: 100%;
  text-align: center;
  color: #FFFFFF;
}
"

site_primary <- "https://department-for-education.shinyapps.io/ks4_ready_reckoners/"
google_analytics_key <- "3L9Y07E864"
source("R/support_links.R")
source("R/read_data.R")

pupil_coefficients <- read.csv("data/p8_pupil_coefficients_file.csv")
pupil_modelvalues <- read.csv("data/ebac_pupil_modelvalues_file.csv")
pupil_modelvalues$ks2emss <- as.numeric(pupil_modelvalues$ks2emss)
p8stdev <- read.csv("data/p8_stdev_file.csv")
ebacstdev <- read.csv("data/ebac_stdev_file.csv")
p8stdev$p8stdev <- as.numeric(p8stdev$p8stdev)
p8att8splits <- read.csv("data/p8_att8_splits.csv")
ebacatt8splits <- read.csv("data/ebac_att8_splits.csv")
p8stdevnamed <- read.csv("data/p8_stdev_file_named.csv")
ebacstdevnamed <- read.csv("data/ebac_stdev_file_named.csv")


names(p8att8splits) <- c(
  "KS2 prior attainment group", "KS2 average scaled score range",
  "Attainment 8 average", "English average", "Maths average", "EBacc average",
  "Open average", "Average EBacc slots filled (out of 3)",
  "Average open slots filled (out of 3)"
)
names(ebacatt8splits) <- c(
  "KS2 prior attainment group", "KS2 average scaled score range",
  "Science average", "Humanities average", "Languages average"
)
names(p8stdevnamed) <- c(
  "Progress 8", "Progress 8 English element", "Progress 8 Maths element",
  "Progress 8 Open element", "Progress 8 EBacc element"
)
names(ebacstdevnamed) <- c("Science VA", "Humanities VA", "Languages VA")


df <- data.frame(
  x = c(0:90),
  y = c(0:90)
)

df2 <- data.frame(
  x = c(0:9),
  y = c(0:9)
)

# # Read in the data
# dfRevBal <- read_revenue_data()
# # Get geographical levels from data
# dfAreas <- dfRevBal %>%
#   select(
#     geographic_level, country_name, country_code,
#     region_name, region_code,
#     la_name, old_la_code, new_la_code
#   ) %>%
#   distinct()
#
# choicesLAs <- dfAreas %>%
#   filter(geographic_level == "Local authority") %>%
#   select(geographic_level, area_name = la_name) %>%
#   arrange(area_name)
#
# choicesAreas <- dfAreas %>%
#   filter(geographic_level == "National") %>%
#   select(geographic_level, area_name = country_name) %>%
#   rbind(dfAreas %>% filter(geographic_level == "Regional") %>% select(geographic_level, area_name = region_name)) %>%
#   rbind(choicesLAs)
#
# choicesYears <- unique(dfRevBal$time_period)
#
# choicesPhase <- unique(dfRevBal$school_phase)

choicesPupil <- data.frame(
  label = c(
    "Exam year 2016, TAOUTCOME = 'BLW'",
    "Exam year 2016, TAOUTCOME = 'PKF'",
    "Exam year 2016, TAOUTCOME = 'PKE'",
    "Exam year 2016, TAOUTCOME = 'PKG'",
    "Exam year 2017, TAOUTCOME = 'BLW'",
    "Exam year 2017, TAOUTCOME = 'PKF'",
    "Exam year 2017, TAOUTCOME = 'PKE'",
    "Exam year 2017, TAOUTCOME = 'PKG'",
    "Grade = N",
    "80",
    "81",
    "82",
    "83",
    "84",
    "85",
    "86",
    "87",
    "88",
    "89",
    "90",
    "91",
    "92",
    "93",
    "94",
    "95",
    "96",
    "97",
    "98",
    "99",
    "100",
    "101",
    "102",
    "103",
    "104",
    "105",
    "106",
    "107",
    "108",
    "109",
    "110",
    "111",
    "112",
    "113",
    "114",
    "115",
    "116",
    "117",
    "118",
    "119",
    "120"
  ),
  value = c(
    70,
    73,
    76,
    79,
    71,
    73,
    76,
    79,
    79,
    80,
    81,
    82,
    83,
    84,
    85,
    86,
    87,
    88,
    89,
    90,
    91,
    92,
    93,
    94,
    95,
    96,
    97,
    98,
    99,
    100,
    101,
    102,
    103,
    104,
    105,
    106,
    107,
    108,
    109,
    110,
    111,
    112,
    113,
    114,
    115,
    116,
    117,
    118,
    119,
    120
  )
)
