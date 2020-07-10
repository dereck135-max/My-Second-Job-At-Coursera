library(ggplot2)
library(dplyr)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
numtype<-table(NEI$type) # sources 
numtype

eeuu_pm25<-select(NEI,-fips,-SCC,-Pollutant)%>%
   group_by(type,year) %>% 
   summarise(TotalEmissions=sum(Emissions))
#----------------- PLOT -----------------------------
png("PLOT4.png")
g1<-ggplot(eeuu_pm25,aes(year,TotalEmissions,colour=type ))
g1+geom_line(size=1)+facet_grid(.~type)+geom_point(size=1.5)+
   ggtitle("TOTAL EMISSIONS FROM PM2.5 IN THE EEUU 1999-2008")+
   labs(x="YEAR",y="TOTAL EMISSIONS")
dev.off()
#---------------------------------------------------