# Peer-graded Assignment: Course Project 1
# Plot 1

# Download data
download.file(url = 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip', 
              destfile = 'household_power_consumption.zip', mode="wb")
unzip(zipfile = 'household_power_consumption.zip')

# Read data
library(readr)
household_power_consumption <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")

# Prepare data
household_power_consumption <- household_power_consumption[household_power_consumption$Date %in% c('1/2/2007', '2/2/2007'), ]
household_power_consumption$DateTime <- strptime(paste0(household_power_consumption$Date, " ", household_power_consumption$Time), format = '%d/%m/%Y %H:%M:%S') 

# Create plot
png(filename = 'plot1.png', width = 480, height = 480, units = 'px')
hist(household_power_consumption$Global_active_power, xlab = 'Global Active Power (kilowatts)', col = 'red', main = 'Global Active Power')
dev.off()

