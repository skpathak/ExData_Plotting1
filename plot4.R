dataFile <- "household_power_consumption.txt"
data <- read.csv(dataFile, sep=";", stringsAsFactors=FALSE, na.strings = c("?", ""))

# sub-set the Date
data <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]
data$DateTime <- as.POSIXlt(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

png(file = "plot4.png")
par(mfrow = c(2,2))

# Plot 1
plot(data$DateTime, data$Global_active_power, xlab="", ylab="Global Active Power", type="l")

# Plot 2
plot(data$DateTime, data$Voltage, xlab="datatime", ylab="Voltage", type="l")

# Plot 3
plot(data$DateTime, data$Sub_metering_1, xlab="", ylab="Energy sub metering", type="l")
lines(data$DateTime, data$Sub_metering_2, type="l", col = "red")
lines(data$DateTime, data$Sub_metering_3, type="l", col = "blue")
metering_name = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
metering_color = c("black", "red", "blue'")
legend("topright", metering_name, col=metering_color)

# Plot 4
plot(data$DateTime, data$Global_reactive_power, xlab="datatime", ylab="Global_reactive_power", type="l")

dev.off()
