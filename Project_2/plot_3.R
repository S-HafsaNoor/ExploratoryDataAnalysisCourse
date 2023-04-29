source("get_archives.R")
library(ggplot2)
# Load the NEI & SCC data frames.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset NEI data by Baltimore's fip.
baltimoreNEI <- NEI[NEI$fips=="24510",]

ggp <- ggplot(baltimoreNEI,aes(factor(year),Emissions,fill=type)) +
geom_bar(stat="identity") +
theme_bw() + guides(fill=FALSE)+
facet_grid(.~type,scales = "free",space="free") +
labs(x="year", y=expression("Total PM"[2.5]" Emission (Tons)")) +
labs(title=expression("PM"[2.5]" Emissions, Baltimore City 1999-2008 by Source Type"))
# The code creates a stacked bar chart using ggplot2 library to visualize PM2.5 Emissions from different sources in Baltimore City from 1999-2008.
png("plot_3.png",width=480,height=480,units="px",bg="transparent")
print(ggp)
dev.off()

