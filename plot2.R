# Cousera Course: Exploratory Data Analysis
# Project 1 part 2
# Name: Isaac Griffith
#
# Note to run this code be sure to change the setwd() command.
setwd("/home/data/coursera/EDA")
require(data.table)
data <- fread(input="household_power_consumption.txt", sep=";", header = T, na.strings = "?")
data[,Date2:=as.Date(Date, format = "%d/%m/%Y")]
data <- data[data$Date2 > as.Date("2007-01-31"),]
data <- data[data$Date2 <= as.Date("2007-02-02"),]

# plot 2
png(filename="plot2.png", width=480, height=480)
plot(x = strptime(paste(data$Date, data$Time, sep=" "), format="%d/%m/%Y %H:%M:%S"), y = as.numeric(data$Global_active_power), xlab="", ylab="Global Active Power (kilowatts)", type="l")
dev.off()