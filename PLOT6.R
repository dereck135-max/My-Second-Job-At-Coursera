library(ggplot2)
library(dplyr)
EI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


angelesbaltimore<-filter(NEI, fips %in% c("06037","24510")) %>% select(-SCC,-Pollutant)%>%
   group_by(type,year,fips) %>% 
   summarise(TotalEmissions=sum(Emissions))
#----------------- PLOT -----------------------------
png("PLOT6.png")
g2<-ggplot(angelesbaltimore,aes(year,TotalEmissions,colour=fips))

g2+geom_line(size=1)+facet_grid(.~type)+geom_point(size=1.5)+
   ggtitle("CITY OF BALTIMORE AND LOS ANGELES COUNTY 1999-2008")+
   labs(x="YEAR",y="TOTAL EMISSIONS")
dev.off()
#---------------------------------------------------