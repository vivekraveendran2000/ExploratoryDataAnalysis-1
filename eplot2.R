# Read the emission summary file
emissionSummary <- readRDS("summarySCC_PM25.rds")

# Select emissions of Baltimore county only
baltEmisSummary <- subset(emissionSummary, fips == "24510")

# Group emissions by year
baltYearEmisSum <- with(baltEmisSummary, aggregate(Emissions, 
                        by = list(year), sum, na.rm = TRUE ))

# Plot the graph
png("ePlot2.png")
with(baltYearEmisSum, plot(Group.1, x, xlab = "Year", pch = 14,
                           ylab = "Emissions", col = "blue"))
dev.off()
