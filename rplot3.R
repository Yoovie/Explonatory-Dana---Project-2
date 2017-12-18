#read table 1 and 2
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#load ggplot2
library('ggplot2')
#subsetting Baltimore
sub1 <- subset(NEI, fips == "24510")
#create a table with Baltimore's emissions by year
q3 <- aggregate(sub1[c("Emissions")], list(type = sub1$type, year = sub1$year), sum)
#create file
png('plot3.png', width=480, height=480)
# plot data
p3 <- ggplot(data=q3, aes(x=year, y=Emissions, col=type, geom= "line"))+ geom_line() + geom_point() + ggtitle("Emissions in Baltimore City")
print(p3)
#close device
dev.off()