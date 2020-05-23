#' Load data into working space
#'
#' @param report_year Reporting year
#' @param report_quarter Reporting quarter
#'
#' @importFrom readr write_csv
#' @importFrom fs path
#' @importFrom usethis use_directory
#' @importFrom magrittr %>%
#' @export
load_data <- function(report_year, report_quarter) {
  data_path <- fs::path("reports", report_year, paste0("Q", report_quarter), "data")
  usethis::use_directory(data_path)

  get_data(report_year = report_year,
           report_quarter = report_quarter) %>%
    write_csv(paste0(data_path, "/top5.csv"))
}
