source("get_archives.R")
library(ggplot2)
# Load the NEI & SCC data frames.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset NEI data related to coal combustion
combustionRelated <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
coalRelated <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE)
coalCombustion <- (combustionRelated & coalRelated)
combustionSCC <- SCC[coalCombustion,]$SCC
combustionNEI <- NEI[NEI$SCC %in% combustionSCC,]

png("plot_4.png",width=480,height=480,units="px",bg="transparent")
ggp <- ggplot(combustionNEI,aes(factor(year),Emissions/10^5)) +
geom_bar(stat="identity",fill="grey",width=0.75) +
theme_bw() + guides(fill=FALSE) +
labs(x="Year", y=expression("Total PM"[2.5]" Emission (10^5 Tons)")) +
labs(title=expression("PM"[2.5]" Emissions from Coal Combustion Sources in the US from 1999 to 2008"))

print(ggp)
dev.off()