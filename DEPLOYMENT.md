# Deployment Guide: University Decision Support Dashboard

This is an R Shiny application built using the `{golem}` framework. It is structured as an R package.

## System Requirements
- **R** (Version 4.1.0 or higher)
- **System Libraries** (Linux): `libcurl-devel`, `openssl-devel`, `libxml2-devel`, `libgit2-devel`, `pkg-config`
- **R Packages**: All dependencies are listed in the `DESCRIPTION` file.

## Package Installation Note (Fedora/RHEL)
If deploying on Fedora/RHEL, the default system R configuration may try to install packages via `dnf` (COPR mirror), which can be unreliable.
It is recommended to configure R to use Posit Package Manager for Linux binaries by adding this to `~/.Rprofile`:
`options(repos = c(CRAN = "https://packagemanager.posit.co/cran/__linux__/noble/latest"))`

## Running the App (Development)
To run the app locally from the R console, first install the required dependencies, then launch the app:

```R
# Install package dependencies (requires the pak package)
pak::local_install_deps()

# Launch app
golem::run_dev()
```

## Deploying to Posit Connect / Shiny Server
This app is built for production deployment.

1. **Server Access**: Ensure the deployment server has access to the GitHub repository.
2. **Deployment Method**:
   - Use `rsconnect::deployApp()` if the university uses Posit Connect.
   - Alternatively, copy the repository directly to the Shiny Server directory.
3. **Authentication**: Access must be restricted to authorized staff.
   - Posit Connect can integrate directly with university LDAP/Active Directory.
   - For open-source Shiny Server, it is recommended to implement the `{shinymanager}` R package for a secure login screen.

## Data Architecture
Currently, the app uses static CSV files located in the `inst/extdata/` folder.
Users can manually override this data using the "Data Ingestion" panel at the top of the dashboard.

For live data, modify the `load_university_data()` function in `R/fct_data.R` to query the university database via ODBC or an API.
