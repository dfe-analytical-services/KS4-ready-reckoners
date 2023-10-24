library(shinytest2)

test_that("{shinytest2} recording: KS4-ready-reckoners-2", {
  app <- AppDriver$new(
    variant = platform_variant(), name = "KS4-ready-reckoners-2",
    height = 991, width = 748
  )
  app$expect_values()
  app$expect_screenshot()
  app$set_inputs(navlistPanel = "dashboard2")
  app$set_window_size(width = 748, height = 991)
  app$expect_values()
  app$set_window_size(width = 748, height = 991)
  app$expect_screenshot()
  app$set_window_size(width = 748, height = 991)
  app$expect_values()
})



test_that("{shinytest2} recording: KS4-ready-reckoners", {
  app <- AppDriver$new(
    variant = platform_variant(), name = "KS4-ready-reckoners",
    height = 991, width = 748
  )
  app$set_inputs(cookies = c(
    "GA1.1.438056990.1664964290", "GS1.1.1664964290.1.1.1664964307.0.0.0",
    "GS1.1.1679648688.2.0.1679648688.0.0.0", "GS1.1.1686930955.4.1.1686931408.0.0.0",
    "GS1.1.1696865015.1.1.1696865853.0.0.0", "GS1.1.1698069133.1.1.1698069320.0.0.0",
    "granted", "GS1.1.1698070420.5.1.1698071073.0.0.0"
  ), allow_no_input_binding_ = TRUE)
  app$expect_values()
  app$expect_screenshot()
  app$set_inputs(navlistPanel = "dashboard2")
  app$set_window_size(width = 748, height = 991)
  app$expect_values()
  app$expect_screenshot()
  app$set_window_size(width = 748, height = 991)
  app$set_inputs(navlistPanel = "Model values")
  app$set_window_size(width = 748, height = 991)
  app$expect_values()
  app$expect_screenshot()
  app$set_inputs(navlistPanel = "Accessibility")
  app$set_window_size(width = 748, height = 991)
  app$expect_values()
  app$expect_screenshot()
  app$set_inputs(navlistPanel = "Support and feedback")
  app$expect_values()
  app$expect_screenshot()
})
