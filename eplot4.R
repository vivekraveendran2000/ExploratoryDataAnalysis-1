# Include library required
library(ggplot2)

# Read rds files from disk
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Search for value coal in SCC and selecting same columns in NEI
coalSCC <- SCC[grep("Coal", SCC$Short.Name),]
coalNEI <- subset(NEI, NEI$SCC %in% coalSCC$SCC)

# Grouping by year
coalNEIaggr <- with(coalNEI, aggregate(Emissions~year, coalNEI, 
                                      sum, na.rm = TRUE))
# Plotting the graph
png("eplot4.png")
g <- ggplot(data = coalNEIaggr, aes(x = year, y = Emissions))
g <- g + geom_bar(stat = "identity", width = .3, color = "orange")
g <- g + labs(xlab = "Year", ylab = "Emissions",
              title = "Coal emissions from 1999 - 2008")
print(g)

dev.off()
