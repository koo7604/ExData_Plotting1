library(data.table)
setwd("/Users/koo7604/Desktop/R/Johns_Hopkins/ExploratoryDataAnalysis")
data <- fread("household_power_consumption.txt")
data2 <- rbind(data[data$Date=="1/2/2007"], data[data$Date=="2/2/2007"])

# character -> numeric
data2$Global_active_power <- as.numeric(data2$Global_active_power)

maxrow=nrow(data2)
# create dates
for(i in 1:maxrow){
        data2$Date[i] <- if(data2$Date[i] == "1/2/2007"){"2007-02-01"}
        else if(data2$Date[i] == "2/2/2007"){"2007-02-02"}       
}

data2[, DateTime:=as.POSIXct(paste(data2$Date, data2$Time))]

#create plot2
png(filename = "plot2.png", width = 480, height = 480)
plot(data2$DateTime,data2$Global_active_power, type="l", 
     xlab = "", ylab ="Global Active Power (kilowatts)")
dev.off()
