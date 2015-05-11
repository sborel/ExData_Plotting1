data <- read.csv('household_power_consumption.txt',sep = ";",na.strings = "?") # loading data
data$Date2 <- as.Date(as.character(data$Date), "%d/%m/%Y")
data.sub1 <- subset(data, 
                    Date2 >= as.Date("2007-02-01"))
data.sub2 <- subset(data.sub1, 
                    Date2 <= as.Date("2007-02-02") )
data <-data.sub2

temp <- paste(data$Date,data$Time)
data$datetime <- strptime(as.character(temp),format = "%d/%m/%Y %H:%M:%S")

png("plot3.png",width = 480, height = 480)
##Plotting
plot(data$datetime,data$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")
lines(data$datetime,data$Sub_metering_2, col="red")
lines(data$datetime,data$Sub_metering_3, col="blue")
legend('topright',c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))

dev.off()