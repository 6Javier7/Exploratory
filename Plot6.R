#plot 6

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

motor3 <- merge(motor1, nei) %>% filter(fips == "24510" | fips == "06037") %>% group_by(year, fips) %>% summarise(Emissions = mean(Emissions), .groups = "drop")
motor3$fips <- gsub("24510", "Baltimore", motor3$fips)
motor3$fips <- gsub("06037", "Angeles", motor3$fips)
png("plot6.png", height = 480, width = 480)
with(motor3, xyplot(Emissions ~ year|fips, groups = fips, type = "l", xlab = "Year", ylab = "Emission of PM2.5(tons)", main = "Motor Emissions of PM2.5 per Year"))
dev.off()
