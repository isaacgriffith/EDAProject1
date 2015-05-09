# Cousera Course: Exploratory Data Analysis
# Project 1 part 3
# Name: Isaac Griffith
#
# Note to run this code be sure to change the setwd() command.
setwd("/home/data/coursera/EDA")
require(data.table)
data <- fread(input="household_power_consumption.txt", sep=";", header = T, na.strings = "?")
data[,Date2:=as.Date(Date, format = "%d/%m/%Y")]
data <- data[data$Date2 > as.Date("2007-01-31"),]
data <- data[data$Date2 <= as.Date("2007-02-02"),]

# plot 3
png(filename="plot3.png", width=480, height=480)
plot(x = strptime(paste(data$Date, data$Time, sep=" "), format="%d/%m/%Y %H:%M:%S"), y = data$Sub_metering_1, xlab="", ylab = "Energy sub metering", type = "n")
lines(x = strptime(paste(data$Date, data$Time, sep=" "), format="%d/%m/%Y %H:%M:%S"), y = data$Sub_metering_1, col = "black")
lines(x = strptime(paste(data$Date, data$Time, sep=" "), format="%d/%m/%Y %H:%M:%S"), y = data$Sub_metering_2, col = "red")
lines(x = strptime(paste(data$Date, data$Time, sep=" "), format="%d/%m/%Y %H:%M:%S"), y = data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty = c(1,1,1))
dev.off()