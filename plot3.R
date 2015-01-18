dataFile <- "household_power_consumption.txt"
data <- read.csv(dataFile, sep=";", stringsAsFactors=FALSE, na.strings = c("?", ""))

# sub-set the Date
data <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]
data$DateTime <- as.POSIXlt(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

png(file = "plot3.png")
plot(data$DateTime, data$Sub_metering_1, xlab="", ylab="Energy sub metering", type="l")
lines(data$DateTime, data$Sub_metering_2, type="l", col = "red")
lines(data$DateTime, data$Sub_metering_3, type="l", col = "blue")

metering_name = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
metering_color = c("black", "red", "blue'")
legend("topright", metering_name, col=metering_color)

dev.off()
