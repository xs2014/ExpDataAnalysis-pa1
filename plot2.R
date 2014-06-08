#set working directory
setwd("~/Online Classes/Exploratory Data Analysis/Course Project")

#load library
library(data.table)

#load data into workspace
data <- read.table('household_power_consumption.txt', header=T, sep=';')

#subset only Feb 1 and 2
feb <- data[data$Date == '1/2/2007' | data$Date == '2/2/2007',]

#convert date and time
feb$DateTime <- strptime(paste(feb$Date, feb$Time), format="%d/%m/%Y %H:%M:%S")

#create/coerce object type
feb$Global_active_power <- as.numeric(as.character(feb$Global_active_power))

#plot
png(filename = 'plot2.png', width = 480, height = 480)
plot(x=feb$DateTime, 
     y=feb$Global_active_power, 
     type='l', 
     xlab='',
     ylab='Global Active Power (kilowatts)')

dev.off()