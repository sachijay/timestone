# This function calculates the number of weeks past a given "start date" for a vector of dates.
# It also allows to combine multiple weeks into a single unit and calculate the "week" (e.g.: bi-weekly, etc.).
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
