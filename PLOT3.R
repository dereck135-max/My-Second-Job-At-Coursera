library(ggplot2)
library(dplyr)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
baltimcity<-filter(NEI,fips==24510) %>% select(-fips,-SCC,-Pollutant) # filtramos solo datos de baltimore

baltimfortype<- group_by(baltimcity,type,year) %>% 
   summarise(TotalEmissions=sum(Emissions)) # realizamo un agrupamiento por año y por source
#----------------- PLOT -----------------------------
png("PLOT3.png")
g<-ggplot(baltimfortype,aes(year,TotalEmissions,colour=type ))
g+geom_line(size=1)+facet_grid(.~type)+geom_point(size=1.5)+
   ggtitle("TOTAL EMISSIONS FROM PM2.5 IN THE BALTIMORE CITY")+
   labs(x="YEAR",y="TOTAL EMISSIONS")
dev.off()
#---------------------------------------------------