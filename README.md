# timestone

<!-- badges: start -->
<!-- badges: end -->

This repository contains an `R` package to manipulate dates and times.

The main function implemented in this package is  
  - `calculate_week()`

## Installation

You can install the released version of timestone from [GitHub](https://github.com/) with:

``` r
...
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(timestone)
## basic example code
```

## Building the package

The following codes were used to build this package. *The prompts after each function (if shown) are handled as needed.*

```r
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

# Create the document
document()
```
