#read table 1 and 2
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#subsetting Baltimore
sub1 <- subset(NEI, fips == "24510")
#create a table with Baltimore's emissions by year
q2 <- with(sub1, aggregate(Emissions, by = list(year), sum))
#create image
png('plot2.png', width=480, height=480)
#plot it
plot(q2, type ='o', main = "Baltimore PM2.5 Emission", xlab = "Year",
     ylab = "Emission", pch = 16)
#close device
dev.off()