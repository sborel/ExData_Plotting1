data <- read.csv('household_power_consumption.txt',sep = ";",na.strings = "?") # loading data
data$Date2 <- as.Date(as.character(data$Date), "%d/%m/%Y")
data.sub1 <- subset(data, 
                    Date2 >= as.Date("2007-02-01"))
data.sub2 <- subset(data.sub1, 
                    Date2 <= as.Date("2007-02-02") )
data <-data.sub2

temp <- paste(data$Date,data$Time)
data$datetime <- strptime(as.character(temp),format = "%d/%m/%Y %H:%M:%S")

png("plot2.png",width = 480, height = 480)
##Plotting
plot(data$datetime,data$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.off()