setup <- function(report_year, report_quarter) {
  usethis::use_directory(fs::path("reports", report_year, report_quarter))
}
