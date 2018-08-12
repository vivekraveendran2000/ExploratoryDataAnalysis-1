## Adding necessary libraries
library(dplyr)
library(ggplot2)

# Read emission summary file
emissionSummary <- readRDS("summarySCC_PM25.rds")

# Retrieving Baltimore county emission data
baltEmissSum <- subset(emissionSummary, fips == "24510")

# Grouping Baltimore emission by year and type
baltYTESum <-  baltEmissSum %>% 
               group_by(year,type) %>% 
               summarise(emissSum = sum(Emissions, na.rm = TRUE))

# Plotting the graph
png("eplot3.png")
g <- ggplot(data = baltYTESum, 
            aes(x = year,y = emissSum)) +
            geom_line(color =  "orange", lwd = 2) +
            facet_grid(. ~ type) +
            labs(x = "Year", y = "Emissions(Ton)", 
                 title = "Baltimore county Pollution Emission")
print(g)
dev.off()
                                              
  