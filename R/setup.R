#' This function sets up the reporting containing the analysis
#'
#' @description FillIn
#'
#' @param report_year
#' @param report_month
#'
#' @importFrom fs path
#' @importFrom usethis use_directory use_template
#' @export
setup <- function(report_year, report_quarter) {
  report_path <- fs::path("reports", report_year, paste0("Q", report_quarter))
  usethis::use_directory(report_path)

  usethis::use_template(template = "setup.R",
                        save_as = paste0(report_path, "/01-setup.R"),
                        data = list(report_year = report_year,
                                    report_quarter = report_quarter),
                        package = "tqregreport",
                        open = TRUE)
}
