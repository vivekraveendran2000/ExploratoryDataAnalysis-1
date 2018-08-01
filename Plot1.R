# Read the data from household_power_consumption.txt
energyData <- read.table("household_power_consumption.txt", sep = ";", 
              na.strings = "?", header = TRUE)

# Retrieve the data for only 1 day
energyData <- energyData[energyData$Date %in% c("1/2/2007", "2/2/2007"),]

# Set the column types required
energyData$Date <- as.Date(energyData$Date)
energyData$Global_active_power <- as.numeric(energyData$Global_active_power)

par(mfrow = c(1,1))

# Plot the histogram
png("plot1.png", width=480, height=480)
hist(energyData$Global_active_power, xlab = "Global Active Power(kilowatts)",
     ylab = "Frequency", main = "Global Active Power", col = "red")
dev.off()