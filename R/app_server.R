#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  
  # 1. Load the default data once when the app starts
  default_data <- load_university_data()
  
  # 2. Create a reactive list to hold the active data (default or uploaded)
  active_data <- reactiveValues(
    enrollment = default_data$enrollment,
    eval_scores = default_data$eval_scores,
    research = default_data$research
  )
  
  # 3. Handle Enrollment Upload
  observeEvent(input$upload_enroll, {
    req(input$upload_enroll)
    tryCatch({
      df <- read.csv(input$upload_enroll$datapath, stringsAsFactors = FALSE)
      validate_upload(df, c("academic_year", "faculty", "study_level", "enrollment_count"))
      # Convert year to ordered factor
      df$academic_year <- factor(df$academic_year, levels = c("2022/23", "2023/24", "2024/25"), ordered = TRUE)
      active_data$enrollment <- df
      showNotification("Enrollment data successfully updated!", type = "message")
    }, error = function(e) {
      showNotification(paste("Error in Enrollment Upload:", e$message), type = "error")
    })
  })
  
  # 4. Handle Evaluation Upload
  observeEvent(input$upload_eval, {
    req(input$upload_eval)
    tryCatch({
      df <- read.csv(input$upload_eval$datapath, stringsAsFactors = FALSE)
      validate_upload(df, c("academic_year", "department", "faculty", "response_id", "satisfaction_score"))
      df$academic_year <- factor(df$academic_year, levels = c("2022/23", "2023/24", "2024/25"), ordered = TRUE)
      active_data$eval_scores <- df
      showNotification("Evaluation data successfully updated!", type = "message")
    }, error = function(e) {
      showNotification(paste("Error in Evaluation Upload:", e$message), type = "error")
    })
  })
  
  # 5. Handle Research Upload
  observeEvent(input$upload_research, {
    req(input$upload_research)
    tryCatch({
      df <- read.csv(input$upload_research$datapath, stringsAsFactors = FALSE)
      validate_upload(df, c("academic_year", "faculty", "publications", "grants_awarded", "grant_amount_eur"))
      df$academic_year <- factor(df$academic_year, levels = c("2022/23", "2023/24", "2024/25"), ordered = TRUE)
      active_data$research <- df
      showNotification("Research data successfully updated!", type = "message")
    }, error = function(e) {
      showNotification(paste("Error in Research Upload:", e$message), type = "error")
    })
  })
  
  # 6. Call the modules, passing the *reactive* data
  mod_enrollment_server("enrollment_1", enrollment_data = reactive(active_data$enrollment))
  mod_eval_server("eval_1", eval_data = reactive(active_data$eval_scores))
  mod_research_server("research_1", research_data = reactive(active_data$research))
}