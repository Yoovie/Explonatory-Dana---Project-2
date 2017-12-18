#read table 1 and 2
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#subset vehicle related emissions in Baltimore and Los Angeles
sub6 <- subset(NEI, (fips == "24510" | fips == "06037") & type=="ON-ROAD")
q6 <- aggregate(sub6[c("Emissions")], list(location = sub6$fips, year = sub6$year), sum)
#load ggplot2
library('ggplot2')
#create file
png('plot6.png', width=480, height=480)
#plot data
p6 <- qplot(year, Emissions, data = q6, color = location, geom= "line")+ ggtitle("Motor Vehicle Emissions\nBaltimore (24510) vs. Los Angeles (06037)")
print(p6)
#close device
dev.off()