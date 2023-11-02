library(shinytest2)


test_that("{shinytest2} recording: KS4-ready-reckoners", {
  standard_input_list <- c(
    "chartbutton",
    "cookieAccept",
    "cookieLink",
    "cookieReject",
    "ebacelementinput",
    "ebacscorehum",
    "ebacscorelan",
    "ebacscoresci",
    "hideAccept",
    "hideReject",
    "mathsinput",
    "mathsinputebac",
    "navlistPanel",
    "p8elementinput",
    "p8scoreebac",
    "p8scoreeng",
    "p8scoremath",
    "p8scoreopen",
    "readinginput",
    "readinginputebac",
    "remove",
    "tabsetpanels",
    "tabsetpanels2",
    "user_input_VA",
    "user_input_VA_ebac"
  )

  dashboard_1_outputs <- c(
    "user_view", "boxavgschoolp8score", "boxpupilnumberp8score",
    "boxuppconflimp8score", "boxlowconflimp8score", "boxp8scorenatcomp",
    "user_view_ebac", "boxavgschoolebacscore", "boxpupilnumberebacscore",
    "boxuppconflimebacscore", "boxlowconflimebacscore", "boxebacscorenatcomp",
    "ebacerrorbarchart_title"
  )

  dashboard_2_outputs <- c(
    "boxavgreadmaths", "PAGcatbox", "PAGbox", "estimatedscorebox", "VAscorebox",
    "VAscoreavbox", "estimatedscoreboxeng", "VAscoreboxeng", "VAscoreavboxeng",
    "estimatedscoreboxmath", "VAscoreboxmath", "VAscoreavboxmath", "estimatedscoreboxebac",
    "VAscoreboxebac", "VAscoreavboxebac",
    "estimatedscoreboxopen", "VAscoreboxopen", "VAscoreavboxopen",
    "boxavgreadmathsebac", "PAGcatboxebac", "PAGboxebac",
    "estimatedscoreboxebacsci", "VAscoreboxebacsci",
    "estimatedscoreboxebachum", "VAscoreboxebachum",
    "estimatedscoreboxebaclan", "VAscoreboxebaclan"
  )

  app <- AppDriver$new(
    name = "KS4-ready-reckoners",
    height = 846, width = 1445,
    load_timeout = 45 * 1000, timeout = 20 * 1000,
    wait = TRUE
  )
  app$expect_values(input = standard_input_list)

  app$set_inputs(navlistPanel = "dashboard")
  app$expect_values(
    input = standard_input_list,
    output = dashboard_1_outputs
  )

  app$set_inputs(navlistPanel = "dashboard2")
  app$expect_values(
    input = standard_input_list,
    output = dashboard_2_outputs
  )

  app$set_inputs(navlistPanel = "Model values")
  app$expect_values(input = standard_input_list)

  app$set_inputs(navlistPanel = "Accessibility")
  app$expect_values(input = standard_input_list)

  app$set_inputs(navlistPanel = "Support and feedback")
  app$expect_values(input = standard_input_list)
})
