#dataset setup
library(dplyr)
data <- read.csv("C:/Users/tonyk/Desktop/ExData_Plotting1/household_power_consumption.txt", sep=";")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
subset_data <- subset(data, data$Date == "2007-02-01" | data$Date == "2007-02-02")
subset_data <- mutate(subset_data, datetime = 
        as.POSIXct(paste(subset_data$Date, subset_data$Time),
            format = "%Y-%m-%d %H:%M:%S"))
subset_data[,7:8]<- lapply(subset_data[,7:8], as.numeric)
attach(subset_data)

#Creating png
png(filename = "plot4.png")
par(mfcol = c(2,2))

plot(datetime, as.numeric(Global_active_power),type = "l",
    ylab = "Global Active Power", xlab = "")

plot(datetime, Sub_metering_1, type = "l", xlab = "",
    ylab = "Energy sub metering")
    lines(datetime, Sub_metering_2, col = "red", type = "l")
    lines(datetime, Sub_metering_3, col = "blue", type = "l")
    legend("topright", lty = 1, col = c("black", "red", "blue"),
        legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = .6)
    
plot(datetime, Voltage, type = "l")    

plot(datetime, Global_reactive_power, type = "l")
dev.off()

