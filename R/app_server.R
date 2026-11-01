#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  # Load the data once when the app starts
  uni_data <- load_university_data()
  
  # Call the enrollment module
  mod_enrollment_server("enrollment_1", enrollment_data = uni_data$enrollment)
  
  # Call the evaluation module
  mod_eval_server("eval_1", eval_data = uni_data$eval_scores)
  # Call the research module
  mod_research_server("research_1", research_data = uni_data$research) # <-- Add this line
}