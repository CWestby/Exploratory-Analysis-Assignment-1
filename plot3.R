library(dplyr)
library(lubridate)
library(tidyr)


url <- download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
                     destfile = "Electric Power Consumption.zip")
file <- unzip("Electric Power Consumption.zip")
power_data <- read.csv2("household_power_consumption.txt", 
                        stringsAsFactors = FALSE)
power_data$Date <- as.Date(power_data$Date, "%d/%m/%Y")
power_subset <- filter(power_data, Date == "2007-02-01" | Date == "2007-02-02")
power_subset <- unite(power_subset, Date_Time, Date, Time, sep = " ")
power_subset$Date_Time <- strptime(power_subset$Date_Time,  "%Y-%m-%d %H:%M:%S")
power_subset$Sub_metering_1 <- as.numeric(power_subset$Sub_metering_1)
power_subset$Sub_metering_2 <- as.numeric(power_subset$Sub_metering_2)
power_subset$Sub_metering_3 <- as.numeric(power_subset$Sub_metering_3)
plot1 <- plot(power_subset$Date_Time, power_subset$Sub_metering_1, type = "l", 
     ylab = "Energy sub metering", xlab = " ")
lines(power_subset$Date_Time, power_subset$Sub_metering_2, col = "red")
lines(power_subset$Date_Time, power_subset$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))