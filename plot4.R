#set working directory

#load library
library(data.table)

#load data into workspace
data <- read.table('./household_power_consumption.txt', header=T, sep=';')

#subset only Feb 1 and 2
feb <- data[data$Date == '1/2/2007' | data$Date == '2/2/2007',]

#convert date and time
feb$DateTime <- strptime(paste(feb$Date, feb$Time), format="%d/%m/%Y %H:%M:%S")

#create/coerce object type
feb$Global_active_power <- as.numeric(as.character(feb$Global_active_power))

feb$Voltage <- as.numeric(as.character(feb$Voltage))

feb$Sub_metering_1 <- as.numeric(as.character(feb$Sub_metering_1))
feb$Sub_metering_2 <- as.numeric(as.character(feb$Sub_metering_2))
feb$Sub_metering_3 <- as.numeric(as.character(feb$Sub_metering_3))

feb$Global_reactive_power <-
        as.numeric(as.character(feb$Global_reactive_power))

#make plots
png(filename = 'plot4.png', width = 480, height = 480)
par(mfrow=c(2,2))

##plot 1
plot(x=feb$DateTime, 
     y=feb$Global_active_power, 
     type='l', 
     xlab='',
     ylab='Global Active Power (kilowatts)')

##plot 2
plot(x=feb$DateTime, 
     y=feb$Voltage, 
     type='l', 
     xlab='datetime', 
     ylab='Voltage')

##plot 3
plot(feb$DateTime, feb$Sub_metering_1, pch = '',
     xlab = '',
     ylab = 'Energy sub metering',
     main = '')
lines(feb$DateTime, feb$Sub_metering_1)
lines(feb$DateTime, feb$Sub_metering_2, col = 'red')
lines(feb$DateTime, feb$Sub_metering_3, col = 'blue')
legend('topright', cex=0.9, lty=1, bty='n',
       legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col = c('black', 'red', 'blue'))

##plot 4
plot(x=feb$DateTime, 
     y=feb$Global_reactive_power, 
     type='l', 
     xlab='datetime', 
     ylab='Global_reactive_power')

dev.off()
