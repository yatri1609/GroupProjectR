library(dplyr)
library(tidyr)
library(ggplot2)

data <- read.csv("./Desktop/R_Project/owid-covid-data.csv")

createTimeSeriesChart <- function(isocode, frequency, column){
  
  data_new <- data %>%
    dplyr::filter(iso_code == isocode)
  data_new <- data_new %>% select(column, "date")
  
  data_new <- drop_na(data_new)
  
  MultipleTimeSeries <- ts(data_new, frequency=frequency, start = c(2020,2), end = c(2021,4) )
  
  View(MultipleTimeSeries)
  
  plot.ts(MultipleTimeSeries,xlab="Time")
}

createTimeSeriesChart("AFG", 12, "total_cases")

