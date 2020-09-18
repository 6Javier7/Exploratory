#plot 1

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
n1 <- nei %>% group_by(year) %>% summarise(Emissions = mean(Emissions), .groups = "drop")
png("plot1.png", height = 480, width = 480)
with(n1, plot(Emissions ~ year, type = "l", xlab = "Year", ylab = "Emission of PM2.5(tons)", main = "Emissions of PM2.5 per Year"))
with(n1, points(Emissions ~ year, col = "red"))
dev.off()
