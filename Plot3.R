#plot 3

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

n3 <- nei[fips == "24510",] %>% group_by(year, type) %>% summarise(Emissions = mean(Emissions), .groups = "drop")
png("plot3.png", height = 480, width = 480)
ggplot(data = n3, mapping = aes(x = year, y = Emissions, col = type)) +  geom_point() +  geom_line() +
  labs(colour = "Type", x = "Year", y = "Emission of PM2.5(tons)", title = "Baltimore City Emissions of PM2.5 per Year") +
  theme_minimal()
dev.off()
