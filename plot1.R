dataFile <- "household_power_consumption.txt"
data <- read.csv(dataFile, sep=";", stringsAsFactors=FALSE, na.strings = c("?", ""))

# sub-set the Date
data <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

png(file = "~/Coursea/DataScience/ExploreAna/plot1.png")
hist(data$Global_active_power, col="red", xlab="Global Active Power (kilwatts)", main="Global Active Power")
dev.off()