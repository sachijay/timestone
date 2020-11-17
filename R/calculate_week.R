#' Calculate the number of weeks past a given date
#'
#' This function calculates the number of weeks past a given "start date" for a vector of dates. This function also allows to combine multiple weeks into a single unit and calculate the "week" (e.g.: bi-weekly, etc.). One use of this function is data aggregation (e.g.: convert daily data into weekly data).
#'
#' @param x A character vector of suspected dates. The dates should be in the parse format specified in `date_parsing`. No default value given.
#' @param start_date A single reference date which week 0 starts from. No default value given.
#' @param no_of_weeks The number of weeks to consider as a single unit. For example, this can be used to identify bi-weeks or any integer multiplication of weeks. The default is given as 1, which gives the number of weeks. For the bi-week use `no_of_weeks = 2`.
#' @param date_parsing A function for parsing the date from the `lubridate` package. The default is the `ymd` year-month-date format.
#' @param as_integer Specifies if the output should be an integer vector of weeks (default). If `FALSE` will output a tibble with the input set of dates and the weeks.
#'
#' @return If `as_integer = TRUE`: a numeric vector of the same length as `x` which contains the week number (default), or any other number of week increments specified in `no_of_weeks`. The week can be used in other calculations or models as necessary. Negative values indicates the weeks before the starting date. If `as_integer = FLASE`: a tibble with the input dates and the week.
#' @export
#'
#' @examples
#'d <- c("2020-01-01", "2020-02-01")
#'calculate_week(d, start_date = "2020-01-2")
calculate_week <- function(x,
                           start_date,
                           no_of_weeks = 1,
                           date_parsing = ymd,
                           as_integer = TRUE){

  # Parse the characters containing dates into date object
  x_parse <- date_parsing(x, quiet = TRUE)
  start_date_parse <- date_parsing(start_date, quiet = TRUE)

  # Test if the inputs are acceptable
  if(anyNA(x_parse)){
    stop("All elements of x does not contain dates in the specified format.")
  } else if(anyNA(start_date_parse)){
    stop("start_date does not contain dates in the specified format.")
  } else if(no_of_weeks != round(no_of_weeks)){
    stop("Number of weeks is not an integer.")
  }

  if(length(start_date_parse) > 1){
    warning("Multiple start dates used. Start dates will be recycled.")
  }

  # Calculate number of days between x and start_date
  n_diff_days <- difftime(x_parse,
                          start_date_parse,
                          units = "days") %>%
    as.integer()

  # Calculate week number
  out <- n_diff_days %/% (7 * no_of_weeks)

  # Convert the output into a tibble
  if(!as_integer){
    out <- tibble(x_parse, week = out)
  }

  # Return the output
  return(out)
}
