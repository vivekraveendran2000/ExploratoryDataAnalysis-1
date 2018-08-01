library(lubridate)

# Read the data from household_power_consumption.txt
energyData <- read.table("household_power_consumption.txt", sep = ";", 
                         na.strings = "?", header = TRUE)

# Retrieve the data for only 1 day
energyData <- energyData[energyData$Date %in% c("1/2/2007", "2/2/2007"),]

# Combine date and time of energyData and store in dateWithTime
dateWithTime <-  as.POSIXct(dmy_hms(as.character(paste(energyData$Date, energyData$Time))))

# Set the column types required
energyData$Date <- as.Date(energyData$Date)
energyData$Global_active_power <- as.numeric(energyData$Global_active_power)
energyData$Voltage <- as.numeric(energyData$Voltage)
energyData$Sub_metering_1 <- as.numeric(energyData$Sub_metering_1)
energyData$Sub_metering_2 <- as.numeric(energyData$Sub_metering_2)
energyData$Sub_metering_3 <- as.numeric(energyData$Sub_metering_3)
energyData$Global_reactive_power <-  as.numeric(energyData$Global_reactive_power)

# Plot graph
png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))

#graph1
with(energyData, plot(dateWithTime, Global_active_power, xlab = "datetime",
                      ylab = "Global Active Power", type = "l"))

#graph2
with(energyData, plot(dateWithTime, Voltage, xlab = "datetime",
                      ylab = "Voltage", type = "l"))

#graph3
with(energyData, plot(dateWithTime, Sub_metering_1, xlab = "Day", 
                      ylab = "Energy Sub Metering", type = "l"))
with(energyData, points(dateWithTime,Sub_metering_2, type = "l", col="red"))
with(energyData, points(dateWithTime,Sub_metering_3, type = "l", col="blue"))
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1, col = c("black", "red", "blue"))

#graph4
with(energyData, plot(dateWithTime, Global_reactive_power, xlab = "datetime",
                      ylab = "Global Reactive Power", type = "l"))

dev.off()
