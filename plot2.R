inputdir  <- "/home/gbpvb/R/input"
setwd(inputdir)

setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )
data <- read.table("household_power_consumption.txt",header = TRUE,sep = ";",stringsAsFactors = FALSE, colClasses = c("Date"="myDate","Time"="character","Global_active_power"="numeric","Global_reactive_power"="numeric","Voltage"="numeric","Global_intensity"="numeric","Sub_metering_1"="numeric", "Sub_metering_2"="numeric","Sub_metering_3"="numeric"),na.strings = ("?"))
subset_data <- subset(data,   select = c("Date","Global_active_power"))
subset_data_2 <- subset_data[(subset_data$Date>="2007-02-01" & subset_data$Date<="2007-02-02"),]

plot(subset_data_2$Global_active_power,type="l",ylab="Global Active Power (kilowatts)")


