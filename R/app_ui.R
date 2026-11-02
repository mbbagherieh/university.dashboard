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
      
      # --- DATA UPLOAD SECTION ---
      fluidRow(
        column(12,
               wellPanel(
                 style = "background-color: #f8f9fa; border: 1px solid #dee2e6; padding: 15px; margin-bottom: 20px;",
                 h4("Data Ingestion (Optional)"),
                 p("By default, the dashboard uses the built-in dummy data. You can upload a new CSV to override it."),
                 fluidRow(
                   column(4, fileInput("upload_enroll", "Upload Enrollment Data (.csv)", accept = ".csv")),
                   column(4, fileInput("upload_eval", "Upload Evaluation Data (.csv)", accept = ".csv")),
                   column(4, fileInput("upload_research", "Upload Research Data (.csv)", accept = ".csv"))
                 )
               )
        )
      ),
      
      # --- TABS ---
      tabsetPanel(
        id = "main_tabs",
        tabPanel("Enrollment", mod_enrollment_ui("enrollment_1")),
        tabPanel("Evaluations", mod_eval_ui("eval_1")),
        tabPanel("Research", mod_research_ui("research_1"))
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