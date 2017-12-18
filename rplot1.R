#read table 1 and 2
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#table with Total emission by year
q1 <- with(NEI, aggregate(Emissions, by = list(year), sum))
#create image
png('plot1.png', width=480, height=480)
#plot it
plot(q1, type ='o', main = "Total PM2.5 Emission", xlab = "Year",
     ylab = "Emission", pch = 15)
#close device
dev.off()