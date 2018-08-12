# Reading the emission summary file
emissionSummary <- readRDS("summarySCC_PM25.rds")

# Grouping by year
yearlyEmission <- with(emissionSummary, aggregate(Emissions, 
                                by = list(year), sum, na.rm = TRUE))

# Plotting the graph
png("ePlot1.png")
with(yearlyEmission, plot(Group.1, x, xlab = "Year", ylab ="Emission",
                          pch = 14, col = "blue"))
dev.off()