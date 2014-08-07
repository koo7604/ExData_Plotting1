library(data.table)
setwd("/Users/koo7604/Desktop/R/Johns_Hopkins/ExploratoryDataAnalysis")
data <- fread("household_power_consumption.txt")
data2 <- rbind(data[data$Date=="1/2/2007"], data[data$Date=="2/2/2007"])

# character -> numeric
data2$Global_active_power <- as.numeric(data2$Global_active_power)

#create plot1
png(filename = "plot1.png", width = 480, height = 480)
hist(data2$Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
