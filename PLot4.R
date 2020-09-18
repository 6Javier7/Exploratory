#plot 4

library(purrr)
library(tidyr)
library(dplyr)
library(data.table)
library(ggplot2)
library(lattice)

unzip("Explory2.zip")
nei <- readRDS("explory2/summarySCC_PM25.rds")
cods <- readRDS("explory2/Source_Classification_Code.rds")
nei <- data.table(nei)
cods <- data.table(cods)

cods <- data.table(cods)
coal <- unique(cods$EI.Sector)[c(grep("Coal",unique(cods$EI.Sector)))]
coal1 <-cods[EI.Sector %in% coal,]
coal2 <- merge(coal1, nei) %>% group_by(year) %>% summarise(Emissions = mean(Emissions), .groups = "drop")
png("plot4.png", height = 480, width = 480)
with(coal2, xyplot(Emissions ~ year, type = "l", xlab = "Year", ylab = "Emission of PM2.5(tons)", main = "Coal Combustion-Related Emissions of PM2.5 per Year"))
dev.off()
