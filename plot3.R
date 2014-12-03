Sys.setlocale("LC_ALL", "C")

lines = readLines("household_power_consumption.txt")
lines <- grep("^(Date|[12]/2/2007)", lines, value=TRUE, useBytes=TRUE)
f = textConnection(lines)
data = read.csv(f, na.strings="?", row.names=NULL, sep=";", colClasses=c(rep("character", 2), rep("numeric", 7)))

data$DateTime <- strptime(paste(data$Date, data$Time), "%e/%m/%Y %T")

png("plot3.png", width=480, height=480, units="px")
with(data, {
     plot(DateTime, Sub_metering_1, type="l", xlab="", ylab="Energy_sub_metering")
     lines(DateTime, Sub_metering_2, type="l", col="red")
     lines(DateTime, Sub_metering_3, type="l", col="blue")
     legend("topright", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1)
})
dev.off()

