
<!-- README.md is generated from README.Rmd. Please edit that file -->

# timestone

<!-- badges: start -->

[![R build
status](https://github.com/sachijay/timestone/workflows/R-CMD-check/badge.svg)](https://github.com/sachijay/timestone/actions)
<!-- badges: end -->

This repository contains an `R` package to manipulate dates and times.

The main function implemented in this package is  
- `calculate_week()`

## Installation

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("sachijay/timestone")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(timestone)
library(lubridate)

# Create a sequences of dates
date_seq <- seq.Date(ymd("2020-01-01"),
                     ymd("2020-02-01"),
                     by = "day")

# Calculate bi-weekly number of each of 
# the dates in date_seq
calculate_week(date_seq, "2020-01-2",
               no_of_weeks = 2, 
               as_integer = FALSE)
#> # A tibble: 32 x 2
#>    x_parse     week
#>    <date>     <dbl>
#>  1 2020-01-01    -1
#>  2 2020-01-02     0
#>  3 2020-01-03     0
#>  4 2020-01-04     0
#>  5 2020-01-05     0
#>  6 2020-01-06     0
#>  7 2020-01-07     0
#>  8 2020-01-08     0
#>  9 2020-01-09     0
#> 10 2020-01-10     0
#> # ... with 22 more rows
```

## Code of Conduct

Please note that the timestone project is released with a [Contributor
Code of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.

## Building the package

The following codes were used to build this package. *The prompts after
each function (if shown) are handled as needed.*

``` r
# Loads usethis package
library(devtools)

# Creates the package
create_package(path = here::here())

# Initialise a git repository
use_git()

# Add a file for the function
use_r(name = "calculate_week")

# Check if the package loads properly
load_all()

# Build and check the package
check()

# To add license to the package
use_mit_license("Pramoda Jayasinghe")

# Defined required packages
use_package("lubridate")
use_package("tibble")

# Create the document
document()

# To create the package readme
use_readme_rmd()

# To build the readme file
build_readme()

# Initialize testing
use_testthat()

# Formal testing the calculate_week function
use_test("calculate_week_test")

# Create vignettes
use_vignette(name = "summarise_daily_data", title = "Summarise Daily Data")

# To build vignettes
build_vignettes()

# To add code of conduct
use_code_of_conduct()

# Make the package website
# install.packages("pkgdown")
use_pkgdown()
build_site()
use_github_action("pkgdown")
```
