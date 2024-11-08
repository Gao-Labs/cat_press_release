#' @name app.R
#' @title App script to render RMarkdown Report
#' @author Tim Fraser

# Set values, for testing
setwd(paste0(rstudioapi::getActiveProject()))
install.packages("catviz_0.2.0.tar.gz", type = "source", lib = "lib")

# Set environmental variables
Sys.setenv("REPORTER_OUTPUT_FILE"="report.docx")
Sys.setenv("REPORTER_TABLE"="granddata.d36109")
Sys.setenv("REPORTER_YEAR"=2020)
Sys.setenv("REPORTER_POLLUTANT"=98)
Sys.setenv("REPORTER_REPORT_TYPE"="demo")
Sys.setenv("REPORTER_REPORT_GRAPH"="donut")
Sys.setenv("REPORTER_REPORT_SET"="sourcetype")

# Load Packages
library(rmarkdown)
library(catviz)

file = Sys.getenv("REPORTER_OUTPUT_FILE")

# Set up parameters to pass to Rmd document when knitting
params = list(
  table = Sys.getenv("REPORTER_TABLE"),
  year = Sys.getenv("REPORTER_YEAR"),
  pollutant = Sys.getenv("REPORTER_POLLUTANT"),
  report_type = Sys.getenv("REPORTER_REPORT_TYPE"),
  graph = Sys.getenv("REPORTER_REPORT_GRAPH"),
  set = Sys.getenv("REPORTER_REPORT_SET")
)

# Quality checking
if(file == ""){ stop("ENV REPORTER_OUTPUT_FILE is not specified.") }
if(params$table == ""){ stop("ENV REPORTER_TABLE is not specified.") }
if(params$year == ""){ stop("ENV REPORTER_YEAR is not specified.") }
if(params$pollutant == ""){ stop("ENV REPORTER_POLLUTANT is not specified.") }
if(params$report_type == ""){ stop("ENV REPORTER_REPORT_TYPE is not specified.") }
if(params$graph == ""){ stop("ENV REPORTER_REPORT_GRAPH is not specified.") }
if(params$set == ""){ stop("ENV REPORTER_REPORT_SET is not specified.") }

# Run function to generate report
rmarkdown::render(
  input = "report.Rmd", output_file = file, clean = TRUE,
  # Make new environment in which to knit the Rmd file with its parameters
  envir = new.env(parent = globalenv()), params = params
)

# Completion message
print("---render complete---")
