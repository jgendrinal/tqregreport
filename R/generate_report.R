#' Generate a report on Top 5 stocks in current directory
#'
#' Fillin
#'
#' @param report_year Year of report
#' @param report_quarter Quarter of report
#'
#' @importFrom fs path
#' @importFrom usethis use_directory use_template
#' @importFrom rmarkdown render
#' @export
generate_report <- function(report_year, report_quarter, render=TRUE) {
  report_path <- fs::path("reports", report_year, paste0("Q", report_quarter))
  usethis::use_directory(report_path)

  usethis::use_template(template = "report.Rmd",
                        save_as = paste0(report_path, "/02-report.Rmd"),
                        data = list(report_year = report_year,
                                    report_quarter = report_quarter),
                                    package = "tqregreport",
                                    open = !render)

  if(render){
    out_path <- paste0(report_path, "/Top 5 Stocks.pdf")

    rmarkdown::render(input = paste0(report_path, "/02-report.Rmd"),
                      output_file = "Top5 Stocks.pdf",
                      quiet = TRUE)

    usethis::ui_done("Report saved to {usethis::ui_path(out_path)}")
  }
}
