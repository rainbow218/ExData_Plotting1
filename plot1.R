
inputdir  <- "/home/gbpvb/R/input"
setwd(inputdir)

#You can write your own function that accepts a string and converts it to a Date using the format you want, then use the setAs to set it as an as method. Then you can use your function as part of the colClasses.
#You might want to run setClass('myDate') first to avoid the warning (you can ignore the warning, but it can get annoying if you do this a lot and this is a simple call that gets rid of it).
setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )
data <- read.table("household_power_consumption.txt",header = TRUE,sep = ";",stringsAsFactors = FALSE, colClasses = c("Date"="myDate","Time"="character","Global_active_power"="numeric","Global_reactive_power"="numeric","Voltage"="numeric","Global_intensity"="numeric","Sub_metering_1"="numeric", "Sub_metering_2"="numeric","Sub_metering_3"="numeric"),na.strings = ("?"))
subset_data <- subset(data,   select = c("Date","Global_active_power"))
subset_data_2 <- subset_data[(subset_data$Date>="2007-02-01" & subset_data$Date<="2007-02-02"),]

hist(subset_data_2$Global_active_power ,col="red",main="Global Active Power",xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
