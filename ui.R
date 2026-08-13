# ---------------------------------------------------------
# This is the ui file.
# Use it to call elements created in your server file into the app, and define where they are placed.
# Also use this file to define inputs.
#
# Every UI file should contain:
# - A title for the app
# - A call to a CSS file to define the styling
# - An accessibility statement
# - Contact information
#
# Other elements like charts, navigation bars etc. are completely up to you to decide what goes in.
# However, every element should meet accessibility requirements and user needs.
#
# This file uses a slider input, but other inputs are available like date selections, multiple choice dropdowns etc.
# Use the shiny cheatsheet to explore more options: https://shiny.rstudio.com/images/shiny-cheatsheet.pdf
#
# Likewise, this template uses the navbar layout.
# We have used this as it meets accessibility requirements, but you are free to use another layout if it does too.
#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
# ---------------------------------------------------------

#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
# The documentation for this GOVUK components can be found at:
#
#    https://github.com/moj-analytical-services/shinyGovstyle
#

#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
# The documentation for this GOVUK components can be found at:
#
#    https://github.com/moj-analytical-services/shinyGovstyle
#

ui <- function(input, output, session) {
  page(
    # use_tota11y(),
    title = tags$head(
      tags$link(
        rel = "shortcut icon",
        href = "dfefavicon.png"
      ),
      # Add title for browser tabs
      tags$title("Key Stage 4 Ready Reckoner tool")
    ),
    tags$html(lang = "en"),
    # Add meta description for search engines
    meta() %>%
      meta_general(
        application_name = site_title,
        description = site_title,
        robots = "index,follow",
        generator = "R-Shiny",
        rating = "General",
        referrer = "no-referrer"
      ),
    shinyjs::useShinyjs(),
    tags$head(includeHTML(("google-analytics.html"))),
    shinyGovstyle::full_width_overrides(),
    dfe_cookies_script(),
    cookies_banner_ui(name = site_title),
    shinyGovstyle::header(org_name = "Department for Education"),
    shinyGovstyle::service_navigation(
      service_name = site_title,
      c(
        "Homepage",
        "School ready reckoner",
        "Pupil ready reckoner",
        "Model values"
      )
    ),
    shinyGovstyle::banner(
      "beta banner",
      "Beta",
      paste0(
        "This Dashboard is in beta phase and we are still reviewing performance and reliability."
      )
    ),
    bslib::navset_hidden(
      id = "main_panels",
      homepage_panel(),
      school_ready_reckoner(),
      pupil_ready_reckoner(),
      model_values(),
      bslib::nav_panel(
        value = "support_panel",
        "Support and feedback",
        layout_columns(
          col_widths = c(-2, 8, -2),
          dfeshiny::support_panel(
            team_email = "attainment.statistics@education.gov.uk",
            repo_name = "https://github.com/dfe-analytical-services/KS4-ready-reckoners",
            publication_name = "Key Stage 4 Performance",
            publication_slug = "key-stage-4-performance-revised"
          )
        )
      ),
      bslib::nav_panel(
        value = "accessibility_panel",
        "Accessibility statement",
        layout_columns(
          col_widths = c(-2, 8, -2),
          dfeshiny::a11y_panel(
            dashboard_title = site_title,
            dashboard_url = site_primary,
            date_tested = "16/10/2023",
            date_prepared = "18/10/2023",
            date_reviewed = "18/10/2023",
            date_template_reviewed = "16/10/2022",
            specific_issues = c(
              "Keyboard navigation through the interactive charts is currently limited, and some features are unavailable for keyboard only users",
              "Alternative text in interactive charts is limited to titles and could be more descriptive (although this data is available in csv format)",
              "Some elements fail to have the appropriate aria tags",
              "Some table header ids are not assigned correctly",
              "Some image elements do not have an alt attributes (note that where this is the case, those images are primarily for presentation )"
            ),
            non_accessible_components = c(
              "Interactive charts",
              "Tables"
            ),
            issues_contact = "attainment.statistics@education.gov.uk"
          )
        )
      ),
      ## Cookies panel -----------------------------------------------------
      bslib::nav_panel(
        value = "cookies_panel_ui",
        "Cookie information",
        layout_columns(
          col_widths = c(-2, 8, -2),
          cookies_panel_ui(google_analytics_key = google_analytics_key)
        )
      )
    ),
    tags$script(
      src = "script.js"
    ),
    footer(
      full = TRUE,
      links = c(
        "Accessibility statement",
        "Cookie information",
        "Support and feedback"
      )
    )
  )
}
