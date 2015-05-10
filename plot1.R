data <- read.csv('household_power_consumption.txt',sep = ";",na.strings = "?") # loading data
data$Date2 <- as.Date(as.character(data$Date), "%d/%m/%Y")
data.sub1 <- subset(data, 
                    Date2 >= as.Date("2007-02-01"))
data.sub2 <- subset(data.sub1, 
                    Date2 <= as.Date("2007-02-02") )
data <-data.sub2

png("plot1.png",width = 480, height = 480)
##Plotting
hist(data$Global_active_power,
     ylim = c(0,1200),
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power",
     col = "red")

dev.off()