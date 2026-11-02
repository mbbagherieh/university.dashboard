#' Enrollment UI Module
#' @noRd
mod_enrollment_ui <- function(id) {
  ns <- NS(id)
  tagList(
    h3("Student Enrollment"),
    fluidRow(
      column(4,
             selectInput(ns("faculty"), "Select Faculty:",
                         choices = c("All", "Engineering", "Medicine", "Arts & Humanities", "Business", "Science"),
                         selected = "All",
                         multiple = TRUE)
      ),
      column(4,
             selectInput(ns("level"), "Select Study Level:",
                         choices = c("All", "Bachelor", "Master", "PhD"),
                         selected = "All",
                         multiple = TRUE)
      )
    ),
    br(),
    plotly::plotlyOutput(ns("enroll_plot")),
    br(),
    downloadButton(ns("download_enroll"), "Download Filtered Data (CSV)")
  )
}

#' Enrollment Server Module
#' @noRd
mod_enrollment_server <- function(id, enrollment_data) {
  moduleServer(id, function(input, output, session) {
    
    # Reactive to filter data based on user inputs
    filtered_data <- reactive({
      facs <- if ("All" %in% input$faculty) NULL else input$faculty
      levs <- if ("All" %in% input$level) NULL else input$level
      
      # ADD THE PARENTHESES HERE:
      summarize_enrollment(enrollment_data(), faculties = facs, levels = levs)
    })
    
    # Render the interactive plot
    output$enroll_plot <- plotly::renderPlotly({
      df <- filtered_data()
      
      p <- ggplot2::ggplot(df, ggplot2::aes(x = academic_year, y = enrollment_count, 
                                            color = faculty, group = faculty)) +
        ggplot2::geom_line(linewidth = 1) +
        ggplot2::geom_point() +
        ggplot2::facet_wrap(~ study_level) +
        ggplot2::theme_minimal() +
        ggplot2::labs(x = "Academic Year", y = "Enrollment Count", color = "Faculty")
      
      plotly::ggplotly(p)
    })
    
    # Download handler
    output$download_enroll <- downloadHandler(
      filename = function() { paste("enrollment_data_", Sys.Date(), ".csv", sep = "") },
      content = function(file) { write.csv(filtered_data(), file, row.names = FALSE) }
    )
  })
}