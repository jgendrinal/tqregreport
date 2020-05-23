#' Get data from Yahoo finance
#'
#' This function returns the historical end-of-day stock prices for the top
#' five stocks for the quarter indicated
#'
#' @param report_year A numeric, the year period of stock performance
#' @param report_quarter A numeric, the quarter period in `report_year` of
#'   stock performance
#'
#' @importFrom tidyquant tq_get
#' @importFrom stringr str_c
#' @return A tibble, containing the historical data for stock performance
#' @export
get_data <- function(report_year, report_quarter) {

  # Convert reporting year and quarter to start and end dates

  start_date <- str_c(report_year, "-", report_start_month_day(report_quarter))
  end_date <- str_c(report_year, "-", report_end_month_day(report_quarter))

  #TODO Create preliminary script to get top 5 performing for the quarter, use
  #     random stocks for the meantime

  tq_get(c("FB", "AAPL", "MCD", "MSFT", "MMM"),
         from = start_date,
         to = end_date)
}

#' @keywords internal
report_start_month_day <- function(quarter) {
  switch(quarter,
         `1` = "01-01",
         `2` = "04-01",
         `3` = "07-01",
         `4` = "10-01")
}

#' @keywords internal
report_end_month_day <- function(quarter) {
  switch(quarter,
         `1` = "03-31",
         `2` = "06-30",
         `3` = "09-30",
         `4` = "12-31")
}
