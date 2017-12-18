#read table 1 and 2
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
# subsetting SCC list with coal fuel
coalSCC <- SCC[grepl("[Cc]oal", SCC$Short.Name),]
# subset NEI data based on the list generated above
coalNEI <- subset(NEI, NEI$SCC %in% coalSCC$SCC)
#load ggplot2
library('ggplot2')
#create file
png('plot4.png', width=480, height=480)
#plot data
plot4 <- ggplot(data=coalNEI, aes(x=factor(year), y=Emissions)) + geom_bar(stat= "identity", width = .4) + xlab("year") +ylab("Coal-Related PM2.5 Emissions") + ggtitle("Total Coal-Related PM2.5 Emissions")
print(plot4)
#close device
dev.off()