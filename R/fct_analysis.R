#' Summarize Enrollment
#' @noRd
summarize_enrollment <- function(data, faculties = NULL, levels = NULL) {
  if (!is.null(faculties) && length(faculties) > 0) {
    data <- data[data$faculty %in% faculties, ]
  }
  if (!is.null(levels) && length(levels) > 0) {
    data <- data[data$study_level %in% levels, ]
  }
  
  aggregate(enrollment_count ~ academic_year + faculty + study_level, data = data, FUN = sum)
}

#' Summarize Evaluation Scores
#' @noRd
summarize_eval_scores <- function(data, departments = NULL) {
  if (!is.null(departments) && length(departments) > 0) {
    data <- data[data$department %in% departments, ]
  }
  
  # Calculate mean and median by department and year
  agg <- aggregate(satisfaction_score ~ academic_year + department + faculty, data = data, FUN = function(x) {
    c(mean = mean(x, na.rm = TRUE), median = median(x, na.rm = TRUE))
  })
  
  # Unpack the matrix returned by aggregate
  agg$mean_score   <- agg$satisfaction_score[, "mean"]
  agg$median_score <- agg$satisfaction_score[, "median"]
  agg$satisfaction_score <- NULL
  
  agg
}

#' Summarize Research Output
#' @noRd
summarize_research <- function(data, faculties = NULL) {
  if (!is.null(faculties) && length(faculties) > 0) {
    data <- data[data$faculty %in% faculties, ]
  }
  
  aggregate(cbind(publications, grants_awarded, grant_amount_eur) ~ academic_year + faculty, data = data, FUN = sum)
}