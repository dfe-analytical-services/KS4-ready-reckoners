run_set_shinytests <- function(dfinputs, outstring, listrecords) {
  # This function loops through a set of inputs and takes a snapshot for each one.
  # dfinputs: data frame containing field list and value list.
  # outstring: the stem for the output filename.
  # listrecords: list of input and output variables to record the values of.
  for (i in 1:nrow(dfinputs)) {
    file <- paste0(outstring, "_", i - 1, ".json")
    cat(paste0(dfinputs$field[i], '="', dfinputs$value[i]), fill = TRUE)
    eval(parse(text = paste0("app$setInputs(", dfinputs$field[i], '="', dfinputs$value[i], '", timeout_ = 1.2e+4, values_ = FALSE)')))
    app$snapshot(
      #      items = listrecords,
      filename = file
    )
    #    clean_json(file)
  }
}

app <- ShinyDriver$new("../../", loadTimeout = 6.e4)
app$snapshotInit("initial_load_test", screenshot = FALSE)
app$snapshot(
  filename = "LoadHome.json"
)


dfTestInputs <- data.frame(
  field = c(
    "navlistPanel",
    "tabsetpanels", "readinginput", "mathsinput", "p8scoreeng", "p8scoremath", "p8scoreebac", "p8scoreopen",
    "tabsetpanels", "readinginputebac", "mathsinputebac", "ebacscoresci", "ebacscorehum", "ebacscorelan"
  ),
  value = c(
    "dashboard2",
    "Progress 8", "120", "120", "18", "18", "27", "27",
    "EBacc subject area", "120", "120", "9", "9", "9"
  )
)
run_set_shinytests(dfTestInputs, "KS4rRR", "")
