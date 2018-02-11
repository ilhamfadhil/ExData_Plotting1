data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".") # import data
library(lubridate)
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,] # subset required data
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") # change into datetime format

globalActivePower <- as.numeric(subSetData$Global_active_power) #convert data to numeric

png(filename = "plot1.png") # create png file
hist(globalActivePower, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off() # close png file device