# Peer-graded Assignment: Course Project 1

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
png(filename = 'plot2.png', width = 480, height = 480, units = 'px')
Sys.setlocale("LC_ALL","English")
plot(y=household_power_consumption$Global_active_power, x=household_power_consumption$DateTime, ylab = 'Global Active Power (kilowatts)', xlab = '', main = '', type='l')
dev.off()

