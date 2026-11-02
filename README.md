
<!-- README.md is generated from README.Rmd. Please edit that file -->

# `{university.dashboard}`

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

## Installation

You can install the development version of `{university.dashboard}` like
so:

``` r
# FILL THIS IN! HOW CAN PEOPLE INSTALL YOUR DEV PACKAGE?
```

## Run

You can launch the application by running:

``` r
university.dashboard::run_app()
```

## About

You are reading the doc about version : 0.0.1

This README has been compiled on the

``` r
Sys.time()
#> [1] "2026-11-02 04:58:58 +0330"
```

Here are the tests results and package coverage:

``` r
devtools::check(quiet = TRUE)
#> ── R CMD check results ───────────────────────────────────────── university.dashboard 0.0.1 ────
#> Duration: 55.6s
#> 
#> ❯ checking tests ...
#>   See below...
#> 
#> ❯ checking code files for non-ASCII characters ... WARNING
#>   Found the following file with non-ASCII characters:
#>     R/mod_research.R
#>   Portable packages must use only ASCII characters in their R code and
#>   NAMESPACE directives, except perhaps in comments.
#>   Use \uxxxx escapes for other characters.
#>   Function ‘tools::showNonASCIIfile’ can help in finding non-ASCII
#>   characters in files.
#> 
#> ❯ checking dependencies in R code ... WARNING
#>   '::' or ':::' imports not declared from:
#>     ‘bslib’ ‘ggplot2’ ‘plotly’
#> 
#> ❯ checking for unstated dependencies in ‘tests’ ... WARNING
#>   '::' or ':::' import not declared from: ‘htmltools’
#> 
#> ❯ checking top-level files ... NOTE
#>   Non-standard file/directory found at top level:
#>     ‘DEPLOYMENT.md’
#> 
#> ❯ checking R code for possible problems ... NOTE
#>   app_server: no visible global function definition for ‘read.csv’
#>   load_university_data: no visible global function definition for
#>     ‘read.csv’
#>   mod_enrollment_server : <anonymous>: no visible binding for global
#>     variable ‘academic_year’
#>   mod_enrollment_server : <anonymous>: no visible binding for global
#>     variable ‘enrollment_count’
#>   mod_enrollment_server : <anonymous>: no visible binding for global
#>     variable ‘faculty’
#>   mod_enrollment_server : <anonymous> : <anonymous>: no visible global
#>     function definition for ‘write.csv’
#>   mod_eval_server : <anonymous>: no visible binding for global variable
#>     ‘academic_year’
#>   mod_eval_server : <anonymous>: no visible binding for global variable
#>     ‘mean_score’
#>   mod_eval_server : <anonymous>: no visible binding for global variable
#>     ‘department’
#>   mod_eval_server : <anonymous> : <anonymous>: no visible global function
#>     definition for ‘write.csv’
#>   mod_research_server : <anonymous>: no visible binding for global
#>     variable ‘academic_year’
#>   mod_research_server : <anonymous>: no visible binding for global
#>     variable ‘.data’
#>   mod_research_server : <anonymous>: no visible binding for global
#>     variable ‘faculty’
#>   mod_research_server : <anonymous> : <anonymous>: no visible global
#>     function definition for ‘write.csv’
#>   summarize_enrollment: no visible global function definition for
#>     ‘aggregate’
#>   summarize_eval_scores: no visible global function definition for
#>     ‘aggregate’
#>   summarize_eval_scores : <anonymous>: no visible global function
#>     definition for ‘median’
#>   summarize_research: no visible global function definition for
#>     ‘aggregate’
#>   Undefined global functions or variables:
#>     .data academic_year aggregate department enrollment_count faculty
#>     mean_score median read.csv write.csv
#>   Consider adding
#>     importFrom("stats", "aggregate", "median")
#>     importFrom("utils", "read.csv", "write.csv")
#>   to your NAMESPACE file.
#> 
#> ── Test failures ───────────────────────────────────────────────────────────────── testthat ────
#> 
#> > # This file is part of the standard setup for testthat.
#> > # It is recommended that you do not modify it.
#> > #
#> > # Where should you do additional test configuration?
#> > # Learn more about the roles of various files in:
#> > # * https://r-pkgs.org/testing-design.html#sec-tests-files-overview
#> > # * https://testthat.r-lib.org/articles/special-files.html
#> > 
#> > library(testthat)
#> > library(university.dashboard)
#> > 
#> > test_check("university.dashboard")
#> Saving _problems/test-golem-recommended-2.R
#> Loading required package: shiny
#> Saving _problems/test-golem-recommended-67.R
#> [ FAIL 2 | WARN 0 | SKIP 0 | PASS 79 ]
#> 
#> ══ Failed tests ════════════════════════════════════════════════════════════════
#> ── Error ('test-golem-recommended.R:2:2'): app ui ──────────────────────────────
#> <packageNotFoundError/error/condition>
#> Error in `loadNamespace(x)`: there is no package called 'plotly'
#> Backtrace:
#>      ▆
#>   1. ├─university.dashboard:::app_ui() at test-golem-recommended.R:2:9
#>   2. │ ├─htmltools::tagList(...)
#>   3. │ │ └─rlang::dots_list(...)
#>   4. │ ├─shiny::fluidPage(...)
#>   5. │ │ ├─shiny::bootstrapPage(...)
#>   6. │ │ │ └─rlang::list2(...)
#>   7. │ │ └─htmltools::div(class = "container-fluid", ...)
#>   8. │ │   └─rlang::dots_list(...)
#>   9. │ ├─shiny::tabsetPanel(...)
#>  10. │ │ ├─shiny:::remove_first_class(...)
#>  11. │ │ └─bslib (local) func(..., id = id, selected = selected, header = header, footer = footer)
#>  12. │ │   └─bslib (local) new(...)
#>  13. │ │     └─bslib:::tabsetPanel_(...)
#>  14. │ │       └─bslib:::buildTabset(...)
#>  15. │ │         ├─bslib:::dropNulls(list2(...))
#>  16. │ │         └─rlang::list2(...)
#>  17. │ ├─shiny::tabPanel("Enrollment", mod_enrollment_ui("enrollment_1"))
#>  18. │ │ └─bslib::nav(title, ..., value = value, icon = icon)
#>  19. │ │   └─bslib (local) new(...)
#>  20. │ │     └─bslib:::tabPanel_(title, ..., value = value, icon = icon)
#>  21. │ │       └─htmltools::div(...)
#>  22. │ │         └─rlang::dots_list(...)
#>  23. │ └─university.dashboard:::mod_enrollment_ui("enrollment_1")
#>  24. │   └─htmltools::tagList(...)
#>  25. │     └─rlang::dots_list(...)
#>  26. └─base::loadNamespace(x)
#>  27.   └─base::withRestarts(stop(cond), retry_loadNamespace = function() NULL)
#>  28.     └─base (local) withOneRestart(expr, restarts[[1L]])
#>  29.       └─base (local) doWithOneRestart(return(expr), restart)
#> ── Error ('test-golem-recommended.R:54:1'): (code run outside of `test_that()`) ──
#> <packageNotFoundError/error/condition>
#> Error in `loadNamespace(x)`: there is no package called 'plotly'
#> Backtrace:
#>      ▆
#>   1. ├─shiny::testServer(...) at test-golem-recommended.R:54:1
#>   2. │ ├─shiny:::withMockContext(...)
#>   3. │ │ ├─shiny::isolate(...)
#>   4. │ │ │ ├─shiny::..stacktraceoff..(...)
#>   5. │ │ │ └─ctx$run(...)
#>   6. │ │ │   ├─promises::with_promise_domain(...)
#>   7. │ │ │   │ └─domain$wrapSync(expr)
#>   8. │ │ │   ├─shiny::withReactiveDomain(...)
#>   9. │ │ │   │ └─promises::with_promise_domain(...)
#>  10. │ │ │   │   └─domain$wrapSync(expr)
#>  11. │ │ │   │     └─base::force(expr)
#>  12. │ │ │   ├─shiny:::with_otel_span_context(...)
#>  13. │ │ │   │ └─base::force(expr)
#>  14. │ │ │   ├─shiny::captureStackTraces(...)
#>  15. │ │ │   │ └─promises::with_promise_domain(...)
#>  16. │ │ │   │   └─domain$wrapSync(expr)
#>  17. │ │ │   │     └─base::withCallingHandlers(expr, error = doCaptureStack)
#>  18. │ │ │   └─env$runWith(self, func)
#>  19. │ │ │     └─shiny (local) contextFunc()
#>  20. │ │ │       └─shiny::..stacktraceon..(expr)
#>  21. │ │ ├─shiny::withReactiveDomain(...)
#>  22. │ │ │ └─promises::with_promise_domain(...)
#>  23. │ │ │   └─domain$wrapSync(expr)
#>  24. │ │ │     └─base::force(expr)
#>  25. │ │ └─withr::with_options(...)
#>  26. │ │   └─base::force(code)
#>  27. │ └─university.dashboard (local) server(input = session$input, output = session$output, session = session)
#>  28. │   └─university.dashboard:::mod_enrollment_server(...)
#>  29. │     └─shiny::moduleServer(...)
#>  30. │       ├─session$setReturned(callModule(module, id, session = session))
#>  31. │       └─shiny::callModule(module, id, session = session)
#>  32. │         ├─shiny::withReactiveDomain(...)
#>  33. │         │ └─promises::with_promise_domain(...)
#>  34. │         │   └─domain$wrapSync(expr)
#>  35. │         │     └─base::force(expr)
#>  36. │         └─university.dashboard (local) module(childScope$input, childScope$output, childScope, ...)
#>  37. ├─base::loadNamespace(x)
#>  38. │ ├─base::withRestarts(stop(cond), retry_loadNamespace = function() NULL)
#>  39. │ │ └─base (local) withOneRestart(expr, restarts[[1L]])
#>  40. │ │   └─base (local) doWithOneRestart(return(expr), restart)
#>  41. │ └─base::stop(cond)
#>  42. └─shiny (local) `<fn>`(`<S3: packageNotFoundError>`)
#> 
#> [ FAIL 2 | WARN 0 | SKIP 0 | PASS 79 ]
#> Error:
#> ! Test failures.
#> Execution halted
#> 
#> 1 error ✖ | 3 warnings ✖ | 2 notes ✖
```

``` r
covr::package_coverage()
#> university.dashboard Coverage: 89.46%
#> R/run_app.R: 0.00%
#> R/app_server.R: 33.33%
#> R/fct_analysis.R: 76.47%
#> R/mod_research.R: 81.63%
#> R/fct_data.R: 81.82%
#> R/mod_eval.R: 94.87%
#> R/mod_enrollment.R: 95.45%
#> R/app_config.R: 100.00%
#> R/app_ui.R: 100.00%
#> R/golem_utils_server.R: 100.00%
#> R/golem_utils_ui.R: 100.00%
```
