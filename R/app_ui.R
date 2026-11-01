#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic
    fluidPage(
      theme = bslib::bs_theme(version = 5, bootswatch = "flatly"),
      titlePanel("University Decision Support Dashboard"),
      
      # Create a tabbed layout
      tabsetPanel(
        id = "main_tabs",
        tabPanel("Enrollment", mod_enrollment_ui("enrollment_1")),
        tabPanel("Evaluations", mod_eval_ui("eval_1")),
        tabPanel("Research", mod_research_ui("research_1")) # <-- Add this line
      )
    )
  )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  add_resource_path(
    "www",
    app_sys("app/www")
  )
  
  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "university.dashboard"
    )
  )
}