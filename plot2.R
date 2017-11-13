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
power_subset$Global_active_power <- as.numeric(power_subset$Global_active_power)
plot(power_subset$Date_Time, power_subset$Global_active_power, type = "l", xlab  = " ", ylab = "Global Active Power (kilowatts)")