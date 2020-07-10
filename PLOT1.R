library(dplyr)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

numyear<-table(NEI$year) # sources 
numyear

nonroad<- filter(NEI,type == "NON-ROAD") %>% select(-fips,-SCC,-Pollutant,-type) %>% 
   group_by(year) %>% summarise(total=sum(Emissions))

nonpoint<- filter(NEI,type=="NONPOINT") %>% select(-fips,-SCC,-Pollutant,-type)%>% 
   group_by(year) %>% summarise(total=sum(Emissions))

onroad<- filter(NEI,type=="ON-ROAD") %>%  select(-fips,-SCC,-Pollutant,-type)%>% 
   group_by(year) %>% summarise(total=sum(Emissions))

point<- filter(NEI,type=="POINT") %>% select(-fips,-SCC,-Pollutant,-type)%>% 
   group_by(year) %>% summarise(total=sum(Emissions))
 
eeuupm25<-select(NEI,-fips,-SCC,-Pollutant)%>%
   group_by(year) %>% 
   summarise(TotalEmissions=sum(Emissions))
#----------------- PLOT -----------------------------
png("PLOT1.png",height = 720,width = 720)
layout(matrix(c(5,5:1),ncol = 3, byrow = T))
layout.show(5)

plot(nonroad,type="b",lty=5,col="red",lwd=2,pch=19,main="NON-ROAD")
plot(nonpoint,type="b",lty=5,col="blue",lwd=2,pch=19,main="NONPOINT")
plot(onroad,type="b",lty=5,col="green",lwd=2,pch=19,main="ON-ROAD")
plot(point,type="b",lty=5,col="black",lwd=2,pch=19,main="POINT")    
plot(eeuupm25,type="b",lty=5,col="blue",lwd=2,pch=19,
     main="TOTAL EMISSIONS FROM PM2.5")

dev.off()
#---------------------------------------------------
