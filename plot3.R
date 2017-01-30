# Reading data from file
nombres <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
data <- read.table("household_power_consumption.txt", skip = 66637, nrows = 69517 - 66637, sep = ";", na.strings = "?",col.names=nombres )
# create a new var class POSIXlt, col 10
data$DateTime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")


# plot 3
png('plot3.png',width = 480, height = 480, units = "px")
plot(data$DateTime, data$Sub_metering_1, ylab="Energy sub metering", xlab="", type="n")
lines(data$DateTime, data$Sub_metering_1, type= "l", col="grey")
lines(data$DateTime, data$Sub_metering_2, type= "l", col="red")
lines(data$DateTime, data$Sub_metering_3, type= "l", col="blue")
# Add legend
legend("topright",legend=c("sub-metering_1","sub-metering_2","sub-metering_3"),col=c("black","red","blue"),lty=c(1,1,1),lwd=2)
dev.off()
