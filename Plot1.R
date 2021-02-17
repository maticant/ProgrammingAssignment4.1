# Plot 1
library("data.table")
library("dplyr")
getwd()
setwd("C:/Users/mccan/Documents/R/Repositorios/ProgrammingAssignment4.1")
data <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?")

dataframe <- as.data.frame(data)
dataframe$Date <- as.Date(dataframe$Date, "%d/%m/%Y")
str(dataframe)
class (dataframe$Date )

dataframe <- filter(dataframe, Date >= "2007-02-01")
dataframe <- filter(dataframe, Date <= "2007-02-02")

png("plot1.png", width=480, height=480)
hist(dataframe$Global_active_power ,main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")




