estvsactual <- function(estimated, actual, lims = c(0, 90)) {
  score <- ifelse(is.null(actual), 0, actual)
  ggplot(
    data = data,
    aes(x = estimated, y = score)
  ) +
    geom_point(colour = "#12436D") +
    geom_abline(intercept = 0, slope = 1, color = "#28A197", linetype = "dashed") +
    # ggtitle("Estimated against actual KS4 outcome") +
    xlab("Estimated KS4 outcome") +
    ylab("Actual KS4 outcome") +
    xlim(lims) +
    ylim(lims) +
    theme_classic() +
    theme(
      plot.title = element_text(color = "black", size = 14, face = "bold"),
      axis.title.x = element_text(color = "black", size = 10, face = "plain"),
      axis.title.y = element_text(color = "black", size = 10, face = "plain")
    )
}
