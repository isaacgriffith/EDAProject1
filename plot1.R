# Cousera Course: Exploratory Data Analysis
# Project 1 part 1
# Name: Isaac Griffith
#
# Note to run this code be sure to change the setwd() command.
setwd("/home/data/coursera/EDA")
require(data.table)
data <- fread(input="household_power_consumption.txt", sep=";", header = T, na.strings = "?")
data[,Date2:=as.Date(Date, format = "%d/%m/%Y")]
data <- data[data$Date2 > as.Date("2007-01-31"),]
data <- data[data$Date2 <= as.Date("2007-02-02"),]

# plot 1
png(filename="plot1.png", width=480, height=480)
hist(as.numeric(data$Global_active_power), col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()