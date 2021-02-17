# Plot 4

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




png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(powerDT[, dateTime], powerDT[, Global_active_power], type="l", xlab="", ylab="Global Active Power")
plot(powerDT[, dateTime],powerDT[, Voltage], type="l", xlab="datetime", ylab="Voltage")
plot(powerDT[, dateTime], powerDT[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(powerDT[, dateTime], powerDT[, Sub_metering_2], col="red")
lines(powerDT[, dateTime], powerDT[, Sub_metering_3],col="blue")
legend("topright", col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       , lty=c(1,1)
       , bty="n"
       , cex=.5) 
plot(powerDT[, dateTime], powerDT[,Global_reactive_power], type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()