#' Research UI Module
#' @noRd
mod_research_ui <- function(id) {
  ns <- NS(id)
  tagList(
    h3("Research Output & Funding"),
    fluidRow(
      column(6,
             selectInput(ns("faculty"), "Select Faculty:",
                         choices = c("All", "Engineering", "Medicine", "Arts & Humanities", "Business", "Science"),
                         selected = "All",
                         multiple = TRUE)
      ),
      column(6,
             radioButtons(ns("metric"), "Select Metric:",
                          choices = c("Publications" = "publications",
                                      "Grants Awarded" = "grants_awarded",
                                      "Grant Amount (€)" = "grant_amount_eur"),
                          inline = TRUE)
      )
    ),
    br(),
    plotly::plotlyOutput(ns("research_plot")),
    br(),
    downloadButton(ns("download_research"), "Download Filtered Data (CSV)")
  )
}

#' Research Server Module
#' @noRd
mod_research_server <- function(id, research_data) {
  moduleServer(id, function(input, output, session) {
    
    # Reactive to filter data based on user inputs
    filtered_data <- reactive({
      facs <- if ("All" %in% input$faculty) NULL else input$faculty
      
      # ADD THE PARENTHESES HERE:
      summarize_research(research_data(), faculties = facs)
    })
    
    # Render the interactive plot
    output$research_plot <- plotly::renderPlotly({
      df <- filtered_data()
      metric <- input$metric
      
      # Create dynamic labels based on the selected metric
      y_label <- switch(metric,
                        "publications" = "Number of Publications",
                        "grants_awarded" = "Number of Grants",
                        "grant_amount_eur" = "Grant Amount (€)"
      )
      
      p <- ggplot2::ggplot(df, ggplot2::aes(x = academic_year, y = .data[[metric]], 
                                            color = faculty, group = faculty)) +
        ggplot2::geom_line(linewidth = 1) +
        ggplot2::geom_point() +
        ggplot2::theme_minimal() +
        ggplot2::labs(x = "Academic Year", y = y_label, color = "Faculty")
      
      plotly::ggplotly(p)
    })
    
    # Download handler
    output$download_research <- downloadHandler(
      filename = function() { paste("research_data_", Sys.Date(), ".csv", sep = "") },
      content = function(file) { write.csv(filtered_data(), file, row.names = FALSE) }
    )
  })
}