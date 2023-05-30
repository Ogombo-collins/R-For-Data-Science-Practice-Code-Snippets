#--- Tibbles with tibble -----

#tibbles are data frames that make working in the tidyverse a little easier
#tibble package enables us transform R's in-built data frame to tibbles
library(tidyverse)
#Creating Tibbles:

#-- a) from a regular data frame provided by other R packages
iris_tibble <- as_tibble(iris)
iris_tibble

#-- b) from individual vectors-
vector_tibble <- tibble(x = 1:10, y =2, z = x ** 2 + y)
vector_tibble

tibble(
  a = lubridate::now() + runif(1e3) * 86400,
  b = lubridate::today() + runif(1e3) * 30,
  c = 1:1e3,
  d = runif(1e3),
  e = sample(letters, 1e3, replace = TRUE)
)

# --- Subsetting ----
#subsetting involves obtaining segment of a data frame/ tibble
# subset by column name
sepal_lenght <- iris_tibble$Sepal.Length
sepal_lenght

y = vector_tibble[["y"]]
y
#subsetting by position: [[]]
sepal_width <- iris_tibble[[2]]
sepal_width

# ---- Data Import with readr package ----

#readr package enables one load flat files in R
#Key functions in readr package used to load flat files in R include:
# 1) read_csv(): reads comma-delimited files
# 2) read_csv2(): reads semicolon-separated files
# 3) read_tsv(): reads tab-delimited files
# 4) read_delim(): reads in files with any delimiter
# 4) read_log(): reads Apache style log files

#load sales data into my R environment
sales <- read_csv("C:/Users/user/Downloads/sales.csv")
sales
summary(sales)

#---Parsing a vector----
#parse_*() take a character vector and return a more specialized vector like a logical, integer, or date
parse_logical(c("TRUE", "TRUE", "FALSE", "NA"))
parse_date(c("2010-01-01", "1979-10-14"))
parse_double("2.4", "12")
parse_double("1,83", locale = locale(decimal_mark = ","))
parse_number("$2000")             
parse_number("My first month pay as a data analyst in April this year will be $1200")             




