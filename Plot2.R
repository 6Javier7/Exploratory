#plot 2


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

n2 <- nei[fips == "24510",] %>% group_by(year) %>% summarise(Emissions = mean(Emissions), .groups = "drop")
png("plot2.png", height = 480, width = 480)
with(n2, plot(Emissions ~ year, type = "l", xlab = "Year", ylab = "Emission of PM2.5(tons)", main = "Baltimore City Emissions of PM2.5 per Year"))
with(n2, points(Emissions ~ year, col = "red"))
dev.off()
