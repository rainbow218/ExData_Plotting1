inputdir  <- "/home/gbpvb/R/input"
setwd(inputdir)
library(dplyr)
setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )
data <- read.table("household_power_consumption.txt",header = TRUE,sep = ";",stringsAsFactors = FALSE, colClasses = c("Date"="myDate","Time"="character","Global_active_power"="numeric","Global_reactive_power"="numeric","Voltage"="numeric","Global_intensity"="numeric","Sub_metering_1"="numeric", "Sub_metering_2"="numeric","Sub_metering_3"="numeric"),na.strings = ("?"))
subset_data <- subset(data,   select = c("Date","Sub_metering_1","Sub_metering_2","Sub_metering_3","Global_active_power","Voltage","Global_reactive_power"))
subset_data_2 <- subset_data[(subset_data$Date>="2007-02-01" & subset_data$Date<="2007-02-02"),]

par(mfrow = c(2,2))
plot(subset_data_2$Global_active_power,ylab="Global Active Power", type="l", pin=c(2.2,2.2))
plot(subset_data_2$Voltage, ylab  = "Voltage", type = "l")
plot(subset_data_2$Sub_metering_1,type="n",ylab="Energy sub metering")
lines(subset_data_2$Sub_metering_2,type="l",col="red")
lines(subset_data_2$Sub_metering_1,type="l",col="black")
lines(subset_data_2$Sub_metering_3,type="l",col="blue")

legend("topright",col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1, y.intersp = 0.5)

plot(subset_data_2$Global_reactive_power,ylab="Global_reactive_power", type="l")
