library(dplyr)
library(tidyr)
library(ggplot2)

data <- read.csv("C:/Users/yatri/Downloads/owid-covid-data.csv")


data_new <- NULL

createTimeSeriesChart <- function(a, c){
  data_new <- data %>%
    filter(iso_code == a)
  data_new <- data_new %>% select(c, "date")
  drop_na(data_new)
  ggplot(data_new, aes(x = date) + geom_line(aes(y=c)))
}

createTimeSeriesChart("USA", "total_cases")