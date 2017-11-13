library(dplyr)
library(lubridate)


url <- download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "Electric Power Consumption.zip")
file <- unzip("Electric Power Consumption.zip")
power_data <- read.csv2("household_power_consumption.txt", stringsAsFactors = FALSE)
power_data$Date <- dmy(power_data$Date)
power_data$Date <- as.Date(power_data$Date)
power_subset <- filter(power_data, Date == "2007-02-01" | Date == "2007-02-02")
power_subset$Global_active_power <- as.numeric(power_subset$Global_active_power)
hist(power_subset$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power(kilowatts)")

