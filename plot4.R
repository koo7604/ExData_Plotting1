library(data.table)
setwd("/Users/koo7604/Desktop/R/Johns_Hopkins/ExploratoryDataAnalysis")
data <- fread("household_power_consumption.txt")
data2 <- rbind(data[data$Date=="1/2/2007"], data[data$Date=="2/2/2007"])

# character -> numeric
data2$Global_active_power <- as.numeric(data2$Global_active_power)
data2$Global_reactive_power <- as.numeric(data2$Global_reactive_power)
data2$Voltage <- as.numeric(data2$Voltage)
data2$Sub_metering_1 <- as.numeric(data2$Sub_metering_1)
data2$Sub_metering_2 <- as.numeric(data2$Sub_metering_2)
data2$Sub_metering_3 <- as.numeric(data2$Sub_metering_3)

# create dates
maxrow=nrow(data2)
for(i in 1:maxrow){
        data2$Date[i] <- if(data2$Date[i] == "1/2/2007"){"2007-02-01"}
        else if(data2$Date[i] == "2/2/2007"){"2007-02-02"}       
}

data2[, DateTime:=as.POSIXct(paste(data2$Date, data2$Time))]

# create plot4
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))

#plot1
plot(data2$DateTime, data2$Global_active_power, type="l", col = "black",
     xlab = "datetime", ylab ="Global active power")

#plot2
plot(data2$DateTime, data2$Voltage, type="l", col = "black",
     xlab = "datetime", ylab ="Voltage")

#plot3
plot(data2$DateTime, data2$Sub_metering_1, type="l", col = "black",
     xlab = "", ylab ="Energy sub metering")
lines(data2$DateTime, data2$Sub_metering_2, type="l", col = "red")
lines(data2$DateTime, data2$Sub_metering_3, type="l", col = "blue")
legend("topright", lty = c(1,1,1), box.lty=0, col=c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#plot4
plot(data2$DateTime, data2$Global_reactive_power, type="l", col = "black",
     xlab = "datetime", ylab ="Global_reactive_power")

dev.off()
