#plot 5

library(purrr)
library(tidyr)
library(dplyr)
library(data.table)
library(ggplot2)
library(lattice)

unzip("exdata_data_NEI_data.zip")
nei <- readRDS("exdata_data_NEI_data/summarySCC_PM25.rds")
cods <- readRDS("exdata_data_NEI_data/Source_Classification_Code.rds")
nei <- data.table(nei)
cods <- data.table(cods)

motor <- unique(cods$EI.Sector)[c(grep("Mobile",unique(cods$EI.Sector)))]
motor1 <-cods[EI.Sector %in% motor,]
motor2 <- merge(motor1, nei) %>% filter(fips == "24510") %>% group_by(year) %>% summarise(Emissions = mean(Emissions), .groups = "drop")
png("plot5.png", height = 480, width = 480)
with(motor2, xyplot(Emissions ~ year, type = "l", xlab = "Year", ylab = "Emission of PM2.5(tons)", main = "Motor Emissions of PM2.5 per Year"))
dev.off()
