# Include the libraries
library(ggplot2)

# Read from rds file for summary and scc
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Get values from SCC where SCC column contain  Veh
vehScc <- SCC[grep("[Vv]eh", SCC$Short.Name),]

# Select same columns in NEI where SCC column contain Veh
vehNei <- subset(NEI, NEI$SCC %in% vehScc$SCC)

# Select the baltimore county values
vehNeiBalt <- subset(vehNei, fips == "24510")

# Group by year
vehNBYear <- with(vehNeiBalt, aggregate(Emissions~year, vehNeiBalt,
                                        sum,  na.rm = TRUE))

# Plot the graph
png("eplot5.png")
g <- ggplot(data = vehNBYear, aes(x = year, y = Emissions))
g <- g + geom_bar(stat = "identity", color = "orange", width = .3)
g <- g + labs(xlab = "Year", ylab = "Emissions")
g <- g + labs(title = "Baltimore Vehicle Emissions for 1999 - 2008")

print(g)
dev.off()

