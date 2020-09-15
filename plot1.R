#dataset setup
library(dplyr)
data <- read.csv("C:/Users/tonyk/Desktop/ExData_Plotting1/household_power_consumption.txt", sep=";")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
subset_data <- subset(data, data$Date == "2007-02-01" | data$Date == "2007-02-02")
subset_data <- mutate(subset_data, datetime = 
        as.POSIXct(paste(subset_data$Date, subset_data$Time),
            format = "%Y-%m-%d %H:%M:%S"))

#creating png file 
png(filename = "plot1.png")
hist(as.numeric(subset_data$Global_active_power), main = "Global Active Power", 
    xlab = "Global Active Power (kilowatts)",
    col = "red", breaks = 12)
dev.off()
