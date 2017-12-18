#read table 1 and 2
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#subset vehicle related emissions in Baltimore
sub5 <- subset(NEI, fips == "24510" & type=="ON-ROAD")
q5 <- with(sub5, aggregate(Emissions, by = list(year), sum))
#create image
png('plot5.png', width=480, height=480)
#plot it
plot(q5, type ='o', main = "Baltimore Vehicle related Emission", xlab = "Year",
     ylab = "Emission", pch = 16)
#close device
dev.off()