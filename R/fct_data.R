#' @importFrom utils read.csv
NULL
#' Load University Data Sources
#' 
#' Reads the three CSV files from inst/extdata and returns a list of data frames.
#' @noRd
load_university_data <- function() {
  # Resolve the path using the golem system file utility
  path_enroll <- app_sys("extdata", "enrollment.csv")
  path_eval   <- app_sys("extdata", "eval_scores.csv")
  path_res    <- app_sys("extdata", "research_output.csv")
  
  # Read the files
  enroll <- read.csv(path_enroll, stringsAsFactors = FALSE)
  eval   <- read.csv(path_eval, stringsAsFactors = FALSE)
  res    <- read.csv(path_res, stringsAsFactors = FALSE)
  
  # Basic structural validation
  stopifnot("enrollment_count" %in% names(enroll))
  stopifnot("satisfaction_score" %in% names(eval))
  stopifnot("publications" %in% names(res))
  
  # Convert academic_year to an ordered factor for proper sorting in plots
  year_levels <- c("2022/23", "2023/24", "2024/25")
  
  enroll$academic_year <- factor(enroll$academic_year, levels = year_levels, ordered = TRUE)
  eval$academic_year   <- factor(eval$academic_year, levels = year_levels, ordered = TRUE)
  res$academic_year    <- factor(res$academic_year, levels = year_levels, ordered = TRUE)
  
  list(
    enrollment = enroll,
    eval_scores = eval,
    research = res
  )
}
#' Validate Uploaded Data
#' 
#' Checks if the uploaded dataframe has the required columns.
#' @noRd
validate_upload <- function(df, required_cols) {
  missing_cols <- setdiff(required_cols, names(df))
  if (length(missing_cols) > 0) {
    stop(paste("Missing required columns:", paste(missing_cols, collapse = ", ")))
  }
  return(TRUE)
}