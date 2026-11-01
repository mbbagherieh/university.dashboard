#' Evaluation UI Module
#' @noRd
mod_eval_ui <- function(id) {
  ns <- NS(id)
  tagList(
    h3("Course Evaluation Scores"),
    selectInput(ns("department"), "Select Department(s):",
                choices = c("All", "Computer Science", "Civil Engineering", "Mechanical Engineering", 
                            "Cardiology", "Pediatrics", "History", "Languages", "Accounting", 
                            "Marketing", "Physics", "Biology"),
                selected = "All",
                multiple = TRUE),
    br(),
    plotly::plotlyOutput(ns("eval_plot")),
    br(),
    downloadButton(ns("download_eval"), "Download Filtered Data (CSV)")
  )
}

#' Evaluation Server Module
#' @noRd
mod_eval_server <- function(id, eval_data) {
  moduleServer(id, function(input, output, session) {
    
    # Reactive to filter data based on user inputs
    filtered_data <- reactive({
      deps <- if ("All" %in% input$department) NULL else input$department
      summarize_eval_scores(eval_data, departments = deps)
    })
    
    # Render the interactive plot
    output$eval_plot <- plotly::renderPlotly({
      df <- filtered_data()
      
      # Calculate the university-wide mean for the current year selection
      uni_mean <- mean(df$mean_score, na.rm = TRUE)
      
      p <- ggplot2::ggplot(df, ggplot2::aes(x = academic_year, y = mean_score, 
                                            color = department, group = department)) +
        ggplot2::geom_line(linewidth = 1) +
        ggplot2::geom_point() +
        # Add a dashed line for the university average
        ggplot2::geom_hline(yintercept = uni_mean, linetype = "dashed", color = "black") +
        ggplot2::theme_minimal() +
        ggplot2::labs(x = "Academic Year", y = "Mean Satisfaction Score", 
                      color = "Department",
                      title = "Department Scores vs University Average") +
        ggplot2::ylim(1, 5)
      
      plotly::ggplotly(p)
    })
    
    # Download handler
    output$download_eval <- downloadHandler(
      filename = function() { paste("evaluation_data_", Sys.Date(), ".csv", sep = "") },
      content = function(file) { write.csv(filtered_data(), file, row.names = FALSE) }
    )
  })
}