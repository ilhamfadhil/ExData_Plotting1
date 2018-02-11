data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
library(lubridate)
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

globalActivePower <- as.numeric(subSetData$Global_active_power) #convert data to numeric
voltage <- as.numeric(subSetData$Voltage)
Global_reactive_power <- as.numeric(subSetData$Global_reactive_power)
Sub_metering_1 <- as.numeric(subSetData$Sub_metering_1)
Sub_metering_2 <- as.numeric(subSetData$Sub_metering_2)
Sub_metering_3 <- as.numeric(subSetData$Sub_metering_3)

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power")

plot(datetime, voltage, ylab = "Voltage", type = "l")

plot(datetime, Sub_metering_1, type = "l", 
     ylim = c(0, max(Sub_metering_1, Sub_metering_2, Sub_metering_3)),
     ylab = "Energy Sub Metering", 
     xlab = "")
lines(datetime, Sub_metering_2, col = "red")
lines(datetime, Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1,lwd = 2.5, box.lty = 0, inset = 0.01)

plot(datetime, Global_reactive_power, type = "l")
dev.off()