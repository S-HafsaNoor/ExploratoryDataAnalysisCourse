source("get_archives.R")

# Load the NEI and SCC data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Aggregate total emissions year wise
aggTotals <- aggregate(Emissions ~ year, NEI, sum)

# Generate bar plot of total PM2.5 emissions by year
png("plot_1.png", width = 480, height = 480, units = "px", bg = "transparent")

barplot((aggTotals$Emissions) / 10^6,names.arg = aggTotals$year,xlab = "Year", ylab = "PM2.5 Emissions (10^6 Tons)", main = "Total PM2.5 Emissions From All US Sources")
dev.off()