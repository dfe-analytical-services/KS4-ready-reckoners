a11y_panel <- function() {
  tabPanel(
    "Accessibility",
    gov_main_layout(
      gov_row(
        column(
          width = 12,
          h1("Accessibility statement"),
          p("This accessibility statement applies to the KS4 Ready Reckoner dashboard.
            This application is run by the Department for Education. We want as many people as possible to be able to use this application,
            and have actively developed this application with accessibilty in mind."),
          h2("WCAG 2.1 compliance"),
          p(
            "We follow the reccomendations of the ",
            a(style = "color:#007fb0", href = "https://www.w3.org/TR/WCAG21/", "WCAG 2.1 requirements. ", onclick = "ga('send', 'event', 'click', 'link', 'IKnow', 1)"),
            "This application has been checked using the ", a(style = "color:#007fb0", href = "https://github.com/ewenme/shinya11y", "Shinya11y tool "),
            ", which detected a small number of accessibility issues as outlined below. Each page in this application has been audited for accessiblity with the page-snapshot functionality in the ",
            a(style = "color:#007fb0", href = "https://developers.google.com/web/tools/lighthouse", "Google Developer Lighthouse tool"),
            ". This application does not fully pass the accessibility auditing, partially due to limitations in the software (R-Shiny) used to produce the dashboard. ",
            "Specific reasons for this are outlined in the limitations section below, whilst to mitigate the accessibility challenges here, we also provide the",
            tags$a(href = "https://explore-education-statistics.service.gov.uk/find-statistics/pupil-yield-from-housing-developments", "underlying data via the DfE Explore Education Statistics platform"), ". ",
            "This app does however follow the following guidelines:"
          ),
          tags$div(tags$ul(
            tags$li("uses colours that have sufficient contrast"),
            tags$li("allows you to zoom in up to 300% without the text spilling off the screen"),
            tags$li("has its performance regularly monitored, with a team working on any feedback to improve accessibility for all users")
          )),
          h2("Limitations"),
          p("We recognise that there are still potential issues with accessibility in this application, but we will continue
             to review updates to technology available to us to keep improving accessibility for all of our users. For example, these
            are known issues that we will continue to monitor and improve:"),
          tags$div(tags$ul(
            tags$li("Keyboard navigation through the interactive charts is currently limited, and some features are unavailable for keyboard only users"),
            tags$li("Alternative text in interactive charts is limited to titles and could be more descriptive (although this data is available in csv format)"),
            tags$li("Some elements fail to have the appropriate aria tags"),
            tags$li("Some table header ids are not assigned correctly"),
            tags$li("Some image elements do not have an alt attributes (note that where this is the case, those images are primarily for presentation )")
          )),
          h2("Feedback"),
          p(
            "If you have any feedback on how we could further improve the accessibility of this application, please contact us at",
            a(href = "mailto:attainment.statistics@education.gov.uk", "attainment.statistics@education.gov.uk")
          )
        )
      )
    )
  )
}
