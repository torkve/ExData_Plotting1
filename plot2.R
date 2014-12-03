Sys.setlocale("LC_ALL", "C")

lines = readLines("household_power_consumption.txt")
lines <- grep("^(Date|[12]/2/2007)", lines, value=TRUE, useBytes=TRUE)
f = textConnection(lines)
data = read.csv(f, na.strings="?", row.names=NULL, sep=";", colClasses=c(rep("character", 2), rep("numeric", 7)))

data$DateTime <- strptime(paste(data$Date, data$Time), "%e/%m/%Y %T")

png("plot2.png", width=480, height=480, units="px")
plot(data$DateTime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
