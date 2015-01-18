dataFile <- "household_power_consumption.txt"
data <- read.csv(dataFile, sep=";", stringsAsFactors=FALSE, na.strings = c("?", ""))
 
# sub-set the Date
data <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]
data$DateTime <- as.POSIXlt(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

png(file = "~/Coursea/DataScience/ExploreAna/plot2.png")
plot(data$DateTime, data$Global_active_power, xlab="", ylab="Global Active Power (kilwatts)", type="l")
dev.off()
