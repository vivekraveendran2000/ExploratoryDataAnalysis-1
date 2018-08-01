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

par(mfrow = c(1,1))

# Plot graph
png("plot2.png", width=480, height=480)
plot(dateWithTime, energyData$Global_active_power, xlab = "Day", 
     ylab = "Global Active Power(Kilowats)", type = "l")
dev.off()
