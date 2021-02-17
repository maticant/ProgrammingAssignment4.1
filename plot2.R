# Plot 2
library("data.table")
library(lubridate)
library("dplyr")
getwd()
setwd("C:/Users/mccan/Documents/R/Repositorios/ProgrammingAssignment4.1")
data <- data.table::fread(input = "household_power_consumption.txt"
                          , na.strings="?")

dataframe <- as.data.frame(data)

dataframe <- mutate(dataframe, dateTime = paste(Date, Time))
dataframe$dateTime <-  as.POSIXct(dataframe$dateTime, format = "%d/%m/%Y %H:%M:%S")
head(dataframe)


dataframe <- filter(dataframe, dateTime >= "2007-02-01")
dataframe <- filter(dataframe, dateTime <= "2007-02-02")
str(dataframe)
head(dataframe)



png("plot2.png", width=480, height=480)
plot(x = dataframe$dateTime, y = dataframe$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

