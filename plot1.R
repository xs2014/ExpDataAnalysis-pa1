#set working directory

#load library
library(data.table)

#load data into workspace
data <- read.table('./household_power_consumption.txt', header=T, sep=';')

#subset only Feb 1 and 2
feb <- data[data$Date == '1/2/2007' | data$Date == '2/2/2007',]

#plot
png(filename = 'plot1.png', width = 480, height = 480)
hist(as.numeric(as.character(feb$Global_active_power)), 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", 
     ylab="Frequency", 
     col="red")

dev.off()
