# Plot 3
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



plot(dataframe[, dateTime], dataframe[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(dataframe[, dateTime], dataframe[, Sub_metering_2],col="red")
lines(dataframe[, dateTime], dataframe[, Sub_metering_3],col="blue")
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))
dev.off()
