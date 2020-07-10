# 2)   Have total emissions from PM2.5 decreased in the Baltimore City, 
# Maryland (fips == "24510" ) from 1999 to 2008? 

library(dplyr)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
baltimore<- filter(NEI,fips ==24510)  %>% select(-fips,-SCC,-Pollutant) %>% 
   group_by(year) %>% summarise(total=sum(Emissions))
#----------------- PLOT -----------------------------
png("PLOT2.png")
plot(baltimore,type="b",lty=5,col="blue",lwd=2,pch=19,
     main="TOTAL EMISSIONS FROM PM2.5 IN THE BALTIMORE CITY ")
dev.off()

#---------------------------------------------------
