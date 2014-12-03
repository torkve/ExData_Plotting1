lines = readLines("household_power_consumption.txt")
lines <- grep("^(Date|[12]/2/2007)", lines, value=TRUE, useBytes=TRUE)
f = textConnection(lines)
data = read.csv(f, na.strings="?", row.names=NULL, sep=";", colClasses=c(rep("character", 2), rep("numeric", 7)))

png("plot1.png", width=480, height=480, units="px")
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")
dev.off()
