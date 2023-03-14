# --- Data Transformation ----

#Load libraries and data sets to be used for data transformation
library(tidyverse)
library(nycflights13) #contains data set of 336,776 flights departing New York City in 2013.

#-- Source of data: The data comes from the US Bureau of Transportation Statistics

#Store the data set in a new variable: nyc_flights. 
nyc_flights <- nycflights13::flights
nyc_flights        

view(nyc_flights)
#nyc_flights contains 336,776 and 19 columns

## dplyr Basics ---
#The six key dplyr verbs used in data transformation include:
# a) filter(): obtain observations by their values based on a specific criteria
# b) select(): pick variables by their names
# c) mutate(): create new variables based on existing variables using functions
# d) summarize(): Collapse many values down to a single summary
# e) arrange(): reorder rows
# f) group_by(): changes the scope of each function from operating on the entire dataset to operating on it group-by-group.

#Filter data frame ------
#Quiz 1: Using filter(), subset data frame(nyc_flights) for flights for 1st Jan and 2nd Feb

jan1_flights <- filter(nyc_flights, month == 1, day == 1)
jan1_flights
#842 flights occurred on 1st jan

(feb2_flights <- filter(nyc_flights, month == 2, day == 2))
#682 flights occurred on 2nd feb

#Using logical operators, filter flights that departed in April or May
(Apr_May <- filter(nyc_flights, month == 4 | month == 5))
#57, 116 flights departed during this period
Nov_or_Dec <- filter(nyc_flights, month %in% c(11,12))
Nov_or_Dec  
#55,403 flights departed during this period

#Quiz 2: using filter,find no. of flights that weren't delayed (on arrival or departure) by more than 2 hours
flights_not_delayed <- filter(nyc_flights, !(arr_delay > 120 | dep_delay > 120))
flights_not_delayed
#316,040 flights were not delayed

#Quiz 3: find flights delayed by more than 2 hours
flights_delayed <- filter(nyc_flights, arr_delay > 120, dep_delay > 120)
flights_delayed
#8,335 flights were delayed for more than 2 hours

#Quiz 4: flights operated by United, American, or Delta
(carriers <- filter(nyc_flights, carrier %in% c("UA", "AA", "DL")))

#Arrange rows with arrange() -----
(delay_time <- arrange(nyc_flights, desc(arr_delay)))

#Select columns using select() ------
select(nyc_flights, year, month, day)

#select all columns except origin, arr_delay and distance
select(nyc_flights, -c(origin, arr_delay, distance))

# rename columns using rename()
rename(nyc_flights,time_in_hours= time_hour )

#Adding new variables using mutate() -----
#add speed column
nyc_flights <- mutate(nyc_flights, speed = distance / air_time * 60)
nyc_flights$speed

#Grouped Summaries with summarize()  ----
#summarize() collapses a data frame into a single row as output
#It is usually useful when paired with group_by()
summarize(nyc_flights, delay = mean(dep_delay, na.rm = TRUE))
#find average delay by date
delay_by_day <- nyc_flights %>%
  group_by(year, month, day) %>%
  summarize(nyc_flights, delay = mean(dep_delay, na.rm = TRUE))
delay_by_day
