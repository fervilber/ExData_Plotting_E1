# Reading data from file
# household_power_consumption.txt
# nrow corresponding 2007/02/01 to 2007/2/02 --> 66637 to 69517
nombres <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
data <- read.table("household_power_consumption.txt", skip = 66637, nrows = 69517 - 66637, sep = ";", na.strings = "?",col.names=nombres )


# summary data
dim (data)
str(data)
summary(data)

# create a new var class POSIXlt, col 10
data$DateTime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# plot in screem 
hist(data$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="wheat")

# plot in png
png('plot1.png',width = 480, height = 480, units = "px")
hist(data$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")
dev.off()
